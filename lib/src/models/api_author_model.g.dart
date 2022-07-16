// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIAuthor _$APIAuthorFromJson(Map<String, dynamic> json) => APIAuthor(
      name: json['name'] as String? ?? "",
      personal_name: json['personal_name'] as String? ?? "",
    );

Map<String, dynamic> _$APIAuthorToJson(APIAuthor instance) => <String, dynamic>{
      'name': instance.name,
      'personal_name': instance.personal_name,
    };
