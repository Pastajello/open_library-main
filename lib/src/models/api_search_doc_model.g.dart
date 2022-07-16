// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_search_doc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APISearchDoc _$APISearchDocFromJson(Map<String, dynamic> json) => APISearchDoc(
      key: json['key'] as String? ?? "",
      type: json['type'] as String? ?? "",
      seed:
          (json['seed'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      title: json['title'] as String? ?? "",
      title_suggest: json['title_suggest'] as String? ?? "",
      has_fulltext: json['has_fulltext'] as bool? ?? true,
      edition_count: json['edition_count'] as int? ?? 0,
      edition_key: (json['edition_key'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      publish_date: (json['publish_date'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      publish_year: (json['publish_year'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      first_publish_year: json['first_publish_year'] as int? ?? 0,
      number_of_pages_median: json['number_of_pages_median'] as int? ?? 0,
      lccn:
          (json['lccn'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      publish_place: (json['publish_place'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      oclc:
          (json['oclc'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      contributor: (json['contributor'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lcc: (json['lcc'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      ddc: (json['ddc'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      isbn:
          (json['isbn'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      last_modified_i: json['last_modified_i'] as int? ?? 0,
      ebook_count_i: json['ebook_count_i'] as int? ?? 0,
      ia: (json['ia'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      public_scan_b: json['public_scan_b'] as bool? ?? false,
      ia_collection_s: json['ia_collection_s'] as String? ?? "",
      lending_edition_s: json['lending_edition_s'] as String? ?? "",
      lending_identifier_s: json['lending_identifier_s'] as String? ?? "",
      printdisabled_s: json['printdisabled_s'] as String? ?? "",
      cover_edition_key: json['cover_edition_key'] as String? ?? "",
      cover_i: json['cover_i'] as int? ?? 0,
      first_sentence: (json['first_sentence'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      publisher: (json['publisher'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      language: (json['language'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      author_key: (json['author_key'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      author_name: (json['author_name'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      author_alternative_name:
          (json['author_alternative_name'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      person: (json['person'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      place:
          (json['place'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      subject: (json['subject'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      time:
          (json['time'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      id_alibris_id: (json['id_alibris_id'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id_amazon: (json['id_amazon'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id_bcid: (json['id_bcid'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id_dnb: (json['id_dnb'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id_goodreads: (json['id_goodreads'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id_google: (json['id_google'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id_librarything: (json['id_librarything'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id_libris: (json['id_libris'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id_overdrive: (json['id_overdrive'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id_wikidata: (json['id_wikidata'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      ia_loaded_id: (json['ia_loaded_id'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      ia_box_id: (json['ia_box_id'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      publisher_facet: (json['publisher_facet'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      person_key: (json['person_key'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      place_key: (json['place_key'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      time_facet: (json['time_facet'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      person_facet: (json['person_facet'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      subject_facet: (json['subject_facet'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      place_facet: (json['place_facet'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      author_facet: (json['author_facet'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      subject_key: (json['subject_key'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      time_key: (json['time_key'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lcc_sort: json['lcc_sort'] as String? ?? "",
      ddc_sort: json['ddc_sort'] as String? ?? "",
    );

Map<String, dynamic> _$APISearchDocToJson(APISearchDoc instance) =>
    <String, dynamic>{
      'key': instance.key,
      'type': instance.type,
      'seed': instance.seed,
      'title': instance.title,
      'title_suggest': instance.title_suggest,
      'has_fulltext': instance.has_fulltext,
      'edition_count': instance.edition_count,
      'edition_key': instance.edition_key,
      'publish_date': instance.publish_date,
      'publish_year': instance.publish_year,
      'first_publish_year': instance.first_publish_year,
      'number_of_pages_median': instance.number_of_pages_median,
      'lccn': instance.lccn,
      'publish_place': instance.publish_place,
      'oclc': instance.oclc,
      'contributor': instance.contributor,
      'lcc': instance.lcc,
      'ddc': instance.ddc,
      'isbn': instance.isbn,
      'last_modified_i': instance.last_modified_i,
      'ebook_count_i': instance.ebook_count_i,
      'ia': instance.ia,
      'public_scan_b': instance.public_scan_b,
      'ia_collection_s': instance.ia_collection_s,
      'lending_edition_s': instance.lending_edition_s,
      'lending_identifier_s': instance.lending_identifier_s,
      'printdisabled_s': instance.printdisabled_s,
      'cover_edition_key': instance.cover_edition_key,
      'cover_i': instance.cover_i,
      'first_sentence': instance.first_sentence,
      'publisher': instance.publisher,
      'language': instance.language,
      'author_key': instance.author_key,
      'author_name': instance.author_name,
      'author_alternative_name': instance.author_alternative_name,
      'person': instance.person,
      'place': instance.place,
      'subject': instance.subject,
      'time': instance.time,
      'id_alibris_id': instance.id_alibris_id,
      'id_amazon': instance.id_amazon,
      'id_bcid': instance.id_bcid,
      'id_dnb': instance.id_dnb,
      'id_goodreads': instance.id_goodreads,
      'id_google': instance.id_google,
      'id_librarything': instance.id_librarything,
      'id_libris': instance.id_libris,
      'id_overdrive': instance.id_overdrive,
      'id_wikidata': instance.id_wikidata,
      'ia_loaded_id': instance.ia_loaded_id,
      'ia_box_id': instance.ia_box_id,
      'publisher_facet': instance.publisher_facet,
      'person_key': instance.person_key,
      'place_key': instance.place_key,
      'time_facet': instance.time_facet,
      'person_facet': instance.person_facet,
      'subject_facet': instance.subject_facet,
      'place_facet': instance.place_facet,
      'author_facet': instance.author_facet,
      'subject_key': instance.subject_key,
      'time_key': instance.time_key,
      'lcc_sort': instance.lcc_sort,
      'ddc_sort': instance.ddc_sort,
    };
