import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'ol_author_model.dart';

part 'ol_book_model.g.dart';

/// This abstract class [OLBookBase] is the underlying class for
/// valid and invalid data.
abstract class OLBookBase extends Equatable {
  @override
  List<Object?> get props => [];

  const OLBookBase();
}

/// This class [OLBookError] is returned on any errors querying
/// api calls returning a books.
class OLBookError extends OLBookBase {
  static const message = "Error on returning a valid Book Object";

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => false;

  const OLBookError();

  @override
  String toString() {
    return 'Error: $message';
  }
}

@JsonSerializable()

/// This class [OLBook] will be returned on having valid search results
/// using the API's ISBN function. All json based operations are autogenerated.
class OLBook extends OLBookBase {
  final String title;
  final String full_title;
  final String subtitle;
  final List<String> isbn_10;
  final List<String> isbn_13;
  final List<String> ia_box_id;
  final String ocaid;
  final List<String> publishers;
  final List<String> publish_places;
  late final String physical_format;
  final String physical_dimensions;
  final int latest_revision;
  final int revision;
  final int number_of_pages;
  final String publish_date;
  final String weight;
  final List<String> contributions;
  final List<String> subjects;
  final List<String> lc_classifications;
  final String edition_name;
  final String pagination;

  // ignore [authors] on json rendering they are fetched in a separate call
  @JsonKey(ignore: true)
  final List<OLAuthor> authors;

  // ignore [covers] on json rendering they are fetched in a separate call
  @JsonKey(ignore: true)
  late final List<Uint8List> covers;

  @override
  List<Object?> get props => [
        title,
        full_title,
        subtitle,
        isbn_10,
        isbn_13,
        ia_box_id,
        ocaid,
        pagination,
        number_of_pages,
        edition_name,
        publishers,
        publish_places,
        physical_format,
        physical_dimensions,
        latest_revision,
        revision,
        publish_date,
        weight,
        covers,
        contributions,
        subjects,
        lc_classifications,
        authors,
      ];

  OLBook({
    this.title = "",
    this.full_title = "",
    this.subtitle = "",
    this.subjects = const [],
    this.isbn_10 = const [],
    this.isbn_13 = const [],
    this.ia_box_id = const [],
    this.ocaid = "",
    this.publishers = const [],
    this.authors = const [],
    this.publish_places = const [],
    String physical_format = "",
    this.physical_dimensions = "",
    this.latest_revision = 0,
    this.revision = 0,
    this.publish_date = "",
    this.contributions = const [],
    this.covers = const [],
    this.weight = "",
    this.lc_classifications = const [],
    this.number_of_pages = 0,
    this.edition_name = "",
    this.pagination = "",
  }) {
    // standardize up the [physical format]
    this.physical_format = physical_format.trim().capitalize();
  }

  /// [OLBook.fromJson] crates an instance from json
  factory OLBook.fromJson(Map<String, dynamic> json) {
    return _$OLBookFromJson(json);
  }

  /// [toJson] creates a json representative of this class
  Map<String, dynamic> toJson() {
    return _$OLBookToJson(this);
  }

  @override
  String toString() {
    StringBuffer sb = StringBuffer('\nBook:\n');
    sb.writeln('  title:$title');
    sb.writeln('  full_title:$full_title');
    sb.writeln('  subtitle:$subtitle');

    sb.write('  authors:[');
    for (int i = 0; i < authors.length; i++) {
      sb.write('${authors[i]}${i < authors.length - 1 ? ',' : ''}');
    }
    sb.writeln(']');
    sb.writeln(
        '  number_of_pages:${number_of_pages > 0 ? number_of_pages : ''}');
    sb.writeln('  subjects:$subjects');
    sb.writeln('  contributions:$contributions');
    sb.writeln('  isbn_10:$isbn_10');
    sb.writeln('  isbn_13:$isbn_13');
    sb.writeln('  ia_box_id:$ia_box_id');
    sb.writeln('  ocaid:$ocaid');
    sb.writeln('  publishers:$publishers');
    sb.writeln('  publish_places:$publish_places');
    sb.writeln('  publish_date:$publish_date');
    sb.writeln('  physical_format:$physical_format');
    sb.writeln('  physical_dimensions:$physical_dimensions');
    sb.writeln('  weight:$weight');
    sb.writeln('  revision:${revision > 0 ? revision : ""}');
    sb.writeln(
        '  latest_revision:${latest_revision > 0 ? latest_revision : ""}');
    sb.writeln('  covers:${covers.length}');
    sb.writeln('  pagination:$pagination');
    sb.writeln('  lc_classifications:$lc_classifications');
    return sb.toString();
  }
}

/// this [String.capitalize] extension helps to capitalize [physica_format]
extension StringExtension on String {
  String capitalize() {
    if (isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    } else {
      return "";
    }
  }
}
