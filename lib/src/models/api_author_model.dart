import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_author_model.g.dart';

abstract class APIAuthorBase extends Equatable {
  @override
  List<Object?> get props => [];

  const APIAuthorBase();
}

class APIAuthorError extends APIAuthorBase {
  static const message = "Error on returning a valid Author Object";

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => false;

  const APIAuthorError();

  @override
  String toString() {
    return 'Error: $message';
  }
}

@JsonSerializable()
class APIAuthor extends APIAuthorBase {
  final String name;
  final String personal_name;

  @override
  List<Object?> get props => [name, personal_name];

  const APIAuthor({
    this.name = "",
    this.personal_name = "",
  });

  factory APIAuthor.fromJson(Map<String, dynamic> json) {
    return _$APIAuthorFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$APIAuthorToJson(this);
  }

  @override
  String toString() {
    return '\nAuthor:\n  name:$name\n  personal_name:$personal_name';
  }
}
