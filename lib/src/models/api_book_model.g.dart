// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIBook _$APIBookFromJson(Map<String, dynamic> json) => APIBook(
      title: json['title'] as String? ?? "",
      full_title: json['full_title'] as String? ?? "",
      subtitle: json['subtitle'] as String? ?? "",
      subjects: (json['subjects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isbn_10: (json['isbn_10'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isbn_13: (json['isbn_13'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      ia_box_id: (json['ia_box_id'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      ocaid: json['ocaid'] as String? ?? "",
      publishers: (json['publishers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      authors: (json['authors'] as List<dynamic>?)
              ?.map((e) => Map<String, String>.from(e as Map))
              .toList() ??
          const [],
      publish_places: (json['publish_places'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      physical_format: json['physical_format'] as String? ?? "",
      physical_dimensions: json['physical_dimensions'] as String? ?? "",
      latest_revision: json['latest_revision'] as int? ?? 0,
      revision: json['revision'] as int? ?? 0,
      publish_date: json['publish_date'] as String? ?? "",
      contributions: (json['contributions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      covers:
          (json['covers'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      weight: json['weight'] as String? ?? "",
      lc_classifications: (json['lc_classifications'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      number_of_pages: json['number_of_pages'] as int? ?? 0,
      edition_name: json['edition_name'] as String? ?? "",
      pagination: json['pagination'] as String? ?? "",
    );

Map<String, dynamic> _$APIBookToJson(APIBook instance) => <String, dynamic>{
      'title': instance.title,
      'full_title': instance.full_title,
      'subtitle': instance.subtitle,
      'isbn_10': instance.isbn_10,
      'isbn_13': instance.isbn_13,
      'ia_box_id': instance.ia_box_id,
      'ocaid': instance.ocaid,
      'publishers': instance.publishers,
      'publish_places': instance.publish_places,
      'physical_format': instance.physical_format,
      'physical_dimensions': instance.physical_dimensions,
      'latest_revision': instance.latest_revision,
      'revision': instance.revision,
      'number_of_pages': instance.number_of_pages,
      'publish_date': instance.publish_date,
      'weight': instance.weight,
      'covers': instance.covers,
      'contributions': instance.contributions,
      'subjects': instance.subjects,
      'lc_classifications': instance.lc_classifications,
      'edition_name': instance.edition_name,
      'pagination': instance.pagination,
      'authors': instance.authors,
    };
