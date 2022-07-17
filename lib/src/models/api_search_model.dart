import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'api_search_doc_model.dart';

part 'api_search_model.g.dart';

abstract class APISearchBase extends Equatable {
  @override
  List<Object?> get props => [];

  const APISearchBase();
}

class APISearchError extends APISearchBase {
  static const message = "Error on returning valid Search Result Objects";

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
class APISearch extends APISearchBase {
  final int numFound;
  final bool numFoundExact;
  final String q;
  final List<APISearchDoc> docs;

  @override
  List<Object?> get props => [numFound, numFoundExact, q];

  const APISearch({
    this.numFound = 0,
    this.numFoundExact = false,
    this.q = "",
    this.docs = const [],
  });

  factory APISearch.fromJson(Map<String, dynamic> json) {
    return _$APISearchFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$APISearchToJson(this);
  }

  @override
  String toString() {
    return '\nSearch:\n  numFound:$numFound\n  numFoundExact:$numFoundExact\n q:$q numDocs:${docs.length}';
  }
}
