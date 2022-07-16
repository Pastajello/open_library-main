import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_search_doc_model.g.dart';

abstract class APISearchDocBase extends Equatable {
  @override
  List<Object?> get props => [];

  const APISearchDocBase();
}

class APISearchError extends APISearchDocBase {
  static const message = "Error on returning valid SearchDoc Object";

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => false;

  const APISearchError();

  @override
  String toString() {
    return 'Error: $message';
  }
}

@JsonSerializable()
class APISearchDoc extends APISearchDocBase {
  final String key;
  final String type;
  final List<String> seed;
  final String title;
  final String title_suggest;
  final bool has_fulltext;
  final int edition_count;
  final List<String> edition_key;
  final List<String> publish_date;
  final List<int> publish_year;
  final int first_publish_year;
  final int number_of_pages_median;
  final List<String> lccn;
  final List<String> publish_place;
  final List<String> oclc;
  final List<String> contributor;
  final List<String> lcc;
  final List<String> ddc;
  final List<String> isbn;
  final int last_modified_i;
  final int ebook_count_i;
  final List<String> ia;
  final bool public_scan_b;
  final String ia_collection_s;
  final String lending_edition_s;
  final String lending_identifier_s;
  final String printdisabled_s;
  final String cover_edition_key;
  final int cover_i;
  final List<String> first_sentence;
  final List<String> publisher;
  final List<String> language;
  final List<String> author_key;
  final List<String> author_name;
  final List<String> author_alternative_name;
  final List<String> person;
  final List<String> place;
  final List<String> subject;
  final List<String> time;
  final List<String> id_alibris_id;
  final List<String> id_amazon;
  final List<String> id_bcid;
  final List<String> id_dnb;
  final List<String> id_goodreads;
  final List<String> id_google;
  final List<String> id_librarything;
  final List<String> id_libris;
  final List<String> id_overdrive;
  final List<String> id_wikidata;
  final List<String> ia_loaded_id;
  final List<String> ia_box_id;
  final List<String> publisher_facet;
  final List<String> person_key;
  final List<String> place_key;
  final List<String> time_facet;
  final List<String> person_facet;
  final List<String> subject_facet;
  final List<String> place_facet;
  final List<String> author_facet;
  final List<String> subject_key;
  final List<String> time_key;
  final String lcc_sort;
  final String ddc_sort;

  @override
  List<Object?> get props => [
        key,
        type,
        seed,
        title,
        title_suggest,
        has_fulltext,
        edition_count,
        edition_key,
        publish_date,
        publish_year,
        first_publish_year,
        number_of_pages_median,
        lccn,
        publish_place,
        oclc,
        contributor,
        lcc,
        ddc,
        isbn,
        last_modified_i,
        ebook_count_i,
        ia,
        public_scan_b,
        ia_collection_s,
        lending_edition_s,
        lending_identifier_s,
        printdisabled_s,
        cover_edition_key,
        cover_i,
        first_sentence,
        publisher,
        language,
        author_key,
        author_name,
        author_alternative_name,
        person,
        place,
        subject,
        time,
        id_alibris_id,
        id_amazon,
        id_bcid,
        id_dnb,
        id_goodreads,
        id_google,
        id_librarything,
        id_libris,
        id_overdrive,
        id_wikidata,
        ia_loaded_id,
        ia_box_id,
        publisher_facet,
        person_key,
        place_key,
        time_facet,
        person_facet,
        subject_facet,
        place_facet,
        author_facet,
        subject_key,
        time_key,
        lcc_sort,
        ddc_sort,
      ];

  const APISearchDoc({
    this.key = "",
    this.type = "",
    this.seed = const [],
    this.title = "",
    this.title_suggest = "",
    this.has_fulltext = true,
    this.edition_count = 0,
    this.edition_key = const [],
    this.publish_date = const [],
    this.publish_year = const [],
    this.first_publish_year = 0,
    this.number_of_pages_median = 0,
    this.lccn = const [],
    this.publish_place = const [],
    this.oclc = const [],
    this.contributor = const [],
    this.lcc = const [],
    this.ddc = const [],
    this.isbn = const [],
    this.last_modified_i = 0,
    this.ebook_count_i = 0,
    this.ia = const [],
    this.public_scan_b = false,
    this.ia_collection_s = "",
    this.lending_edition_s = "",
    this.lending_identifier_s = "",
    this.printdisabled_s = "",
    this.cover_edition_key = "",
    this.cover_i = 0,
    this.first_sentence = const [],
    this.publisher = const [],
    this.language = const [],
    this.author_key = const [],
    this.author_name = const [],
    this.author_alternative_name = const [],
    this.person = const [],
    this.place = const [],
    this.subject = const [],
    this.time = const [],
    this.id_alibris_id = const [],
    this.id_amazon = const [],
    this.id_bcid = const [],
    this.id_dnb = const [],
    this.id_goodreads = const [],
    this.id_google = const [],
    this.id_librarything = const [],
    this.id_libris = const [],
    this.id_overdrive = const [],
    this.id_wikidata = const [],
    this.ia_loaded_id = const [],
    this.ia_box_id = const [],
    this.publisher_facet = const [],
    this.person_key = const [],
    this.place_key = const [],
    this.time_facet = const [],
    this.person_facet = const [],
    this.subject_facet = const [],
    this.place_facet = const [],
    this.author_facet = const [],
    this.subject_key = const [],
    this.time_key = const [],
    this.lcc_sort = "",
    this.ddc_sort = "",
  });

  factory APISearchDoc.fromJson(Map<String, dynamic> json) {
    return _$APISearchDocFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$APISearchDocToJson(this);
  }

  @override
  String toString() {
    final StringBuffer sb = StringBuffer('\nSearchDoc:');
    return sb.toString();
  }
}
