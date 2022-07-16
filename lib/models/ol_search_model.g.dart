// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ol_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OLSearch _$OLSearchFromJson(Map<String, dynamic> json) => OLSearch(
      numFound: json['numFound'] as int? ?? 0,
      numFoundExact: json['numFoundExact'] as bool? ?? false,
      q: json['q'] as String? ?? "",
      docs: (json['docs'] as List<dynamic>?)
              ?.map((e) => OLSearchDoc.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OLSearchToJson(OLSearch instance) => <String, dynamic>{
      'numFound': instance.numFound,
      'numFoundExact': instance.numFoundExact,
      'q': instance.q,
      'docs': instance.docs,
    };
