// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APISearch _$APISearchFromJson(Map<String, dynamic> json) => APISearch(
      numFound: json['numFound'] as int? ?? 0,
      numFoundExact: json['numFoundExact'] as bool? ?? false,
      q: json['q'] as String? ?? "",
      docs: (json['docs'] as List<dynamic>?)
              ?.map((e) => APISearchDoc.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$APISearchToJson(APISearch instance) => <String, dynamic>{
      'numFound': instance.numFound,
      'numFoundExact': instance.numFoundExact,
      'q': instance.q,
      'docs': instance.docs,
    };
