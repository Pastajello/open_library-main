library open_library;

import 'dart:typed_data';

import 'models/ol_search_doc_model.dart';
import 'models/ol_search_model.dart';
import 'src/models/api_search_doc_model.dart';
import 'src/models/api_search_model.dart';
import 'src/service/api_service.dart';
import 'src/models/api_author_model.dart';
import 'src/models/api_book_model.dart';
import 'models/ol_author_model.dart';
import 'models/ol_book_model.dart';

/// [OpenLibrary] class to support an easy way to consume openlibrary.org api
/// Version 0.1.4
/// Author: Andreas Lange
/// Published in 2022
/// Licensed under the MIT License
class OpenLibrary {
  final OpenLibraryApiService _openLibraryApiService =
      OpenLibraryApiService.create();

  /// call [dispose] to close the API Client proper-
  void dispose() {
    _openLibraryApiService.client.dispose();
  }

  /// This function [getBookByISBN] fetches a book by it's ISBN number
  /// (10 or 13 digits) from OpenLibrary.org.
  /// Always check RuntimeType [OLBookBase] type is -> [OLBook] / [OLBookError]
  /// use [loadCover] to indicate if the cover should be loaded, default = true
  /// and [coverSite] to define the loaded size, M,S,L
  /// from enum CoverSize, default = L
  Future<OLBookBase> getBookByISBN(
      {required String isbn,
      bool loadCover = true,
      CoverSize coverSize = CoverSize.L}) async {
    // try to fetch the book via isbn from the openlibrary.org isbn api
    final APIBookBase book =
        await _openLibraryApiService.getBookByISBN(isbn: isbn);
    if (book is APIBook) {
      // fetch Authors if exist
      final List<OLAuthor> authors = [];
      if (book.authors.isNotEmpty) {
        // each author needs to be fetched from openlibrary.org
        await Future.forEach(book.authors, (Map<String, String> element) async {
          if (element.keys.contains('key')) {
            final String id = element['key'] ?? '';
            if (id.isNotEmpty) {
              // the api wraps the id so we can remove path elements here
              final APIAuthorBase author = await _openLibraryApiService
                  .getAuthorById(id: id.replaceFirst('/authors/', ''));
              if (author is APIAuthor) {
                authors.add(OLAuthor.fromJson(author.toJson()));
              }
            }
          }
        });
      }

      // fetch covers if exists
      final List<Uint8List> covers = [];
      if (book.covers.isNotEmpty && loadCover) {
        // each cover needs to be downloaded from the openlibrary.org covers endpoint
        await Future.forEach(book.covers, (int coverId) async {
          // we will provide byte data as Uint8List so it can be used directly as MemoryImage
          final Uint8List cover =
              await getCover(coverId: coverId, coverSize: coverSize);
          if (cover.isNotEmpty) {
            covers.add(cover);
          }
        });
      }

      // creates a new OLBook instance to be returned as data copy of
      // it's api transfer object APIBook with added authors and covers
      return _olBookFromAPIBook(book: book, authors: authors, covers: covers);
    }
    // in the case of an error return the Error Instance
    return const OLBookError();
  }

  /// To fetch auther by his's OL UD number from OpenLibrary.org
  /// use [getAuthorByOLID]. Always check RuntimeType [OLAuthorsBase]
  /// type is -> [OLAuthor] / [OLAuthorError]
  ///provide [olid] as the openlibrary id for Authors
  Future<OLAuthorBase> getAuthorByOLID({required String olid}) async {
    final APIAuthorBase author =
        await _openLibraryApiService.getAuthorById(id: olid);
    // if we have a valid author
    if (author is APIAuthor) {
      final OLAuthor result = OLAuthor.fromJson(author.toJson());
      return result;
    }
    // in case of any error return the error instance
    return const OLAuthorError();
  }

  /// To [query] the openlibrary.org/search.json api with all it's options
  /// Always check RuntimeType [OLSearchBase] type is -> [OLSearch] / [OLSearchError]
  /// Use [title] to give search words for the title and/or
  /// [author] for the author name and/or
  /// [isbn] in a 10 or 13 ISBN digits format, if less it is filled
  /// with * to 10 digits and/or
  /// [subject] to search for books subject content and/or
  /// [place] to find places named in the books and/or
  /// [person] to find fictive or real persons in the book and/or
  /// [language] if you want to find special published languages and/or
  /// [publisher] to find books publishers as a filter or
  /// use [q] only to find any given content
  /// use [loadCover] indicates if the cover should be loaded, default = true
  /// and [coverSite] to define the loaded size, M,S,L from enum
  /// [CoverSize], default = S, if you want to limit the search, it returns
  /// max docs set by [limit] and just load limit covers, default = 10
  Future<OLSearchBase> query({
    String query = "",
    String title = "",
    String author = "",
    String subject = "",
    String place = "",
    String person = "",
    SearchLanguage language = SearchLanguage.none,
    String publisher = "",
    String isbn = "",
    String q = "",
    bool loadCover = true,
    CoverSize coverSize = CoverSize.S,
    int limit = 10,
  }) async {
    // pattern builder
    final StringBuffer patterns = StringBuffer();

    // render query (pattern)
    if (q.trim().isNotEmpty) {
      patterns.write(q.toJSONPattern(pattern: SearchPatterns.q));
    } else {
      if (title.trim().isNotEmpty) {
        patterns.write(title.toJSONPattern(pattern: SearchPatterns.title));
      }
      if (author.trim().isNotEmpty) {
        if (patterns.isNotEmpty) {
          patterns.write("&");
        }
        patterns.write(author.toJSONPattern(pattern: SearchPatterns.author));
      }
      if (subject.trim().isNotEmpty) {
        if (patterns.isNotEmpty) {
          patterns.write("&");
        }
        patterns.write(subject.toJSONPattern(pattern: SearchPatterns.subject));
      }
      if (place.trim().isNotEmpty) {
        if (patterns.isNotEmpty) {
          patterns.write("&");
        }
        patterns.write(place.toJSONPattern(pattern: SearchPatterns.place));
      }
      if (person.trim().isNotEmpty) {
        if (patterns.isNotEmpty) {
          patterns.write("&");
        }
        patterns.write(person.toJSONPattern(pattern: SearchPatterns.person));
      }
      if (language != SearchLanguage.none) {
        if (patterns.isNotEmpty) {
          patterns.write("&");
        }
        patterns.write(
            language.name.toJSONPattern(pattern: SearchPatterns.language));
      }
      if (publisher.trim().isNotEmpty) {
        if (patterns.isNotEmpty) {
          patterns.write("&");
        }
        patterns
            .write(publisher.toJSONPattern(pattern: SearchPatterns.publisher));
      }
      if (isbn.trim().isNotEmpty) {
        if (patterns.isNotEmpty) {
          patterns.write("&");
        }
        patterns.write(isbn.toJSONPattern(pattern: SearchPatterns.isbn));
      }
    }
    // if we have valid search patterns we run the search
    if (patterns.isNotEmpty) {
      final List<OLSearchDoc> docs = [];
      final APISearchBase search =
          await _openLibraryApiService.query(pattern: patterns.toString());
      if (search is APISearch) {
        // render all search result docs (books)
        if (search.docs.isNotEmpty) {
          // if the load needs to load covers iterate through all docs
          await Future.forEach(search.docs, (APISearchDoc doc) async {
            // limit the results
            if (docs.length < limit) {
              final List<Uint8List> covers = [];
              final List<OLAuthor> authors = [];
              // load cover if wanted and exists
              //log("authors:${doc.author_name}");
              if (doc.cover_i > 0 && loadCover) {
                final Uint8List cover =
                    await getCover(coverId: doc.cover_i, coverSize: coverSize);
                covers.add(cover);
              }
              // render Authors
              for (var authorName in doc.author_name) {
                final OLAuthor author = OLAuthor(
                  name: authorName,
                );
                authors.add(author);
              }

              final OLSearchDoc olSearchDoc = _olSearchDocFromAPISearchDoc(
                  searchDoc: doc, authors: authors, covers: covers);
              docs.add(olSearchDoc);
            }
          });
        }

        final OLSearch olSearch = _olSearchFromAPISearch(
            search: search, docs: docs, patterns: patterns.toString());
        return olSearch;
      }
    }

    return const OLSearchError();
  }

  /// This function [getCover] is called implicit but can also be called
  /// from outside to load a cover as Uint8List. If there is no cover it
  /// returns an empty Uint8List. Use [coverId] to specify it's OL ID and
  /// [coverSize] S/M/L CoverSize to load
  Future<Uint8List> getCover(
      {required int coverId, required CoverSize coverSize}) async {
    final Uint8List cover = await _openLibraryApiService.getCoverById(
        id: coverId.toString(), size: coverSize.name);
    return cover;
  }

  /// This internal function [_olBookFromAPIBook] converts
  /// API Transfer Object to OL Library Object -> [OLBook]
  OLBook _olBookFromAPIBook({
    required APIBook book,
    required List<OLAuthor> authors,
    required List<Uint8List> covers,
  }) {
    return OLBook(
      title: book.title,
      full_title: book.full_title,
      subtitle: book.subtitle,
      authors: authors,
      contributions: book.contributions,
      edition_name: book.edition_name,
      ia_box_id: book.ia_box_id,
      isbn_10: book.isbn_10,
      isbn_13: book.isbn_13,
      latest_revision: book.latest_revision,
      revision: book.revision,
      number_of_pages: book.number_of_pages,
      ocaid: book.ocaid,
      lc_classifications: book.lc_classifications,
      pagination: book.pagination,
      physical_dimensions: book.physical_dimensions,
      physical_format: book.physical_format,
      publish_date: book.publish_date,
      publish_places: book.publish_places,
      publishers: book.publishers,
      subjects: book.subjects,
      weight: book.weight,
      covers: covers,
    );
  }
}

/// This internal function [_olSearchFromAPISearch] converts
/// API Transfer Object to OL Library Object -> [OLSearch]
OLSearch _olSearchFromAPISearch({
  required APISearch search,
  required String patterns,
  required List<OLSearchDoc> docs,
}) {
  return OLSearch(
    numFound: search.numFound,
    numFoundExact: search.numFoundExact,
    patterns: patterns,
    q: search.q,
    docs: docs,
  );
}

/// This internal function [_olSearchDocFromAPISearchDoc] converts
/// API Transfer Object to OL Library Object -> [OLSearchDoc]
OLSearchDoc _olSearchDocFromAPISearchDoc({
  required APISearchDoc searchDoc,
  required List<Uint8List> covers,
  required List<OLAuthor> authors,
}) {
  return OLSearchDoc(
    title: searchDoc.title,
    publish_date: searchDoc.publish_date,
    ia_box_id: searchDoc.ia_box_id,
    isbn: searchDoc.isbn,
    type: searchDoc.type,
    time: searchDoc.time,
    key: searchDoc.key,
    author_alternative_name: searchDoc.author_alternative_name,
    author_facet: searchDoc.author_facet,
    author_key: searchDoc.author_key,
    author_name: searchDoc.author_name,
    contributor: searchDoc.contributor,
    cover_edition_key: searchDoc.cover_edition_key,
    cover_i: searchDoc.cover_i,
    ddc: searchDoc.ddc,
    ddc_sort: searchDoc.ddc_sort,
    ebook_count_i: searchDoc.ebook_count_i,
    edition_count: searchDoc.edition_count,
    edition_key: searchDoc.edition_key,
    first_publish_year: searchDoc.first_publish_year,
    first_sentence: searchDoc.first_sentence,
    has_fulltext: searchDoc.has_fulltext,
    ia: searchDoc.ia,
    ia_collection_s: searchDoc.ia_collection_s,
    ia_loaded_id: searchDoc.ia_loaded_id,
    id_alibris_id: searchDoc.id_alibris_id,
    id_amazon: searchDoc.id_amazon,
    id_bcid: searchDoc.id_bcid,
    id_dnb: searchDoc.id_dnb,
    id_goodreads: searchDoc.id_goodreads,
    id_google: searchDoc.id_google,
    id_librarything: searchDoc.id_librarything,
    id_libris: searchDoc.id_libris,
    id_overdrive: searchDoc.id_overdrive,
    id_wikidata: searchDoc.id_wikidata,
    language: searchDoc.language,
    last_modified_i: searchDoc.last_modified_i,
    lcc: searchDoc.lcc,
    lcc_sort: searchDoc.lcc_sort,
    lccn: searchDoc.lccn,
    lending_edition_s: searchDoc.lending_edition_s,
    lending_identifier_s: searchDoc.lending_identifier_s,
    number_of_pages_median: searchDoc.number_of_pages_median,
    oclc: searchDoc.oclc,
    person: searchDoc.person,
    person_facet: searchDoc.person_facet,
    person_key: searchDoc.person_key,
    place: searchDoc.place,
    place_facet: searchDoc.place_facet,
    place_key: searchDoc.place_key,
    printdisabled_s: searchDoc.printdisabled_s,
    public_scan_b: searchDoc.public_scan_b,
    publish_place: searchDoc.publish_place,
    publish_year: searchDoc.publish_year,
    publisher: searchDoc.publisher,
    publisher_facet: searchDoc.publisher_facet,
    seed: searchDoc.seed,
    subject: searchDoc.subject,
    subject_facet: searchDoc.subject_facet,
    subject_key: searchDoc.subject_key,
    time_facet: searchDoc.time_facet,
    time_key: searchDoc.time_key,
    title_suggest: searchDoc.title_suggest,
    covers: covers,
    authors: authors,
  );
}

/// This String Extension [toJSONPattern] helps to stringify search patterns
/// as key pairs like title=Harry%Potter and combines them with url encoded &
extension StringExtension on String {
  String toJSONPattern({SearchPatterns pattern = SearchPatterns.q}) {
    if (isNotEmpty) {
      String tmp = trim();
      while (tmp.contains("  ")) {
        tmp = tmp.replaceAll("  ", " ");
      }
      tmp = tmp.replaceAll(" ", "%20");
      tmp = "${pattern.name}=$tmp";
      return tmp;
    } else {
      return "";
    }
  }
}

/// [CoverSizes] S = small, M = medium, L = large for loading covers
enum CoverSize { S, M, L }

/// Use this enum [SearchPatterns] to render the search like pattern=value
enum SearchPatterns {
  title,
  author,
  isbn,
  subject,
  place,
  person,
  language,
  publisher,
  q
}

/// This enumberation [SearchLanguage] uses values from
/// https://en.wikipedia.org/wiki/List_of_languages_by_number_of_native_speakers
/// for shortcuts ordered by native speakers (3 first letters)
/// exceptions: Japanese = jpn, multi lingual = mul,
/// undetermined = und, empty = none
enum SearchLanguage {
  man,
  spa,
  eng,
  hin,
  ben,
  por,
  rus,
  jpn,
  wes,
  mar,
  tel,
  wuc,
  tur,
  kor,
  fre,
  ger,
  vie,
  tam,
  yue,
  urd,
  jav,
  ita,
  egy,
  guj,
  ira,
  bho,
  sou,
  hak,
  jin,
  hau,
  kan,
  ind,
  pol,
  yor,
  xia,
  mal,
  odi,
  mai,
  bur,
  eas,
  sun,
  sud,
  alg,
  mor,
  ukr,
  igb,
  nor,
  sin,
  nla,
  rom,
  tag,
  dut,
  sai,
  khm,
  chh,
  som,
  ceb,
  nep,
  mes,
  ass,
  ara,
  nig,
  kur,
  hej,
  bav,
  aze,
  gre,
  chi,
  kaz,
  dec,
  hun,
  kin,
  zul,
  lev,
  tun,
  san,
  min,
  pas,
  cze,
  tai,
  uyg,
  syl,
  mul,
  und,
  none
}
