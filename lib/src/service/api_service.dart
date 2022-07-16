import 'dart:convert';
import 'dart:typed_data';

import 'package:chopper/chopper.dart';
import '../models/api_search_model.dart';
import '../models/api_author_model.dart';
import '../models/api_book_model.dart';

part 'api_service.chopper.dart';

/// OpenLibraryApiService class to implement openlibrary api calls
/// Author: Andreas Lange
/// Published in 2022
@ChopperApi(baseUrl: '')
abstract class OpenLibraryApiService extends ChopperService {
  /// constructor used by open_library
  static OpenLibraryApiService create() {
    final client = ChopperClient(
      baseUrl: '',
      services: [
        _$OpenLibraryApiService(),
      ],
      converter: const ApiConverter(type: APIBook),
    );

    return _$OpenLibraryApiService(client);
  }

  /// Get a book by it's ISBN number (10 or 13 digits) from OpenLibrary.org
  /// @param loadCover indicates if the cover should be loaded, default = true
  Future<APIBookBase> getBookByISBN({required String isbn}) async {
    final Response<APIBook> book = await _getBookByISBN(isbn: isbn);
    if (book.statusCode == 200 && book.body != null) {
      return book.body!;
    }
    return const APIBookError();
  }

  /// Get an auther by his's OL ID number from OpenLibrary.org
  /// @param id the openlibrary id for Authors
  Future<APIAuthorBase> getAuthorById({required String id}) async {
    final Response<APIAuthor> author = await _getAuthorById(id: id);
    if (author.statusCode == 200 && author.body != null) {
      return author.body!;
    }
    return const APIAuthorError();
  }

  /// Query the covers.openlibrary.org/ to load covers
  /// getCover will return Uint8List(0) if it was not found
  /// @param id -> openlibrary coverId
  /// @param size -> S/M/L CoverSize to load
  Future<Uint8List> getCoverById(
      {required String id, required String size}) async {
    final Response<Uint8List> cover = await _getCoverById(id: id, size: size);
    if (cover.statusCode == 200 && cover.body != null) {
      return cover.body!;
    }
    return Uint8List(0);
  }

  /// Query the openlibrary.org/search.json api
  /// @param pattern -> search url encoded string to query the api
  Future<APISearchBase> query({required String pattern}) async {
    final Response<APISearch> query = await _query(pattern: pattern);
    if (query.statusCode == 200 && query.body != null) {
      return query.body!;
    }
    return const APISearchError();
  }

  /// code generation for api endpoint: https://openlibrary.org/isbn/{isbn}.json
  @Get(path: 'https://openlibrary.org/isbn/{isbn}.json')
  Future<Response<APIBook>> _getBookByISBN(
      {@Path('isbn') required String isbn});

  /// code generation for api endpoint: https://openlibrary.org/authors/{id}.json
  @Get(path: 'https://openlibrary.org/authors/{id}.json')
  Future<Response<APIAuthor>> _getAuthorById({@Path('id') required String id});

  /// code generation for api endpoint: 'https://covers.openlibrary.org/b/id/{id}-{size}.jpg
  @Get(path: 'https://covers.openlibrary.org/b/id/{id}-{size}.jpg')
  Future<Response<Uint8List>> _getCoverById(
      {@Path('id') required String id, @Path('size') required String size});

  /// https://openlibrary.org/search.json?{pattern}
  @Get(path: 'https://openlibrary.org/search.json?{pattern}')
  Future<Response<APISearch>> _query(
      {@Path('pattern') required String pattern});
}

/// APIConverter Class to convert response headers into api objects
/// Author: Andreas Lange
class ApiConverter extends JsonConverter {
  final dynamic type;

  const ApiConverter({required this.type});

  /// Convert to bodyError so the vody returns empty
  @override
  Response convertError<BodyType, InnerType>(Response response) {
    return response.copyWith(body: null);
  }

  /// JSON Decoder
  @override
  Response decodeJson<BodyType, InnerType>(Response response) {
    return response;
  }

  /// JSON Encoder
  @override
  Request encodeJson(Request request) {
    return request;
  }

  /// request converter
  @override
  Request convertRequest(Request request) {
    return super.convertRequest(request.copyWith(body: null));
  }

  /// coverts the Response using a dispatcher for each type
  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    final Response dynamicResponse = super.convertResponse(response);
    //log("BodyType:$BodyType -> ${BodyType == Book}");
    if (BodyType == APIBook) {
      final BodyType customBody = _convertBook(dynamicResponse.body);
      return dynamicResponse.copyWith<BodyType>(body: customBody);
    } else if (BodyType == APIAuthor) {
      final BodyType customBody = _convertAuthor(dynamicResponse.body);
      return dynamicResponse.copyWith<BodyType>(body: customBody);
    } else if (BodyType == Uint8List) {
      final BodyType customBody = dynamicResponse.bodyBytes as BodyType;
      return dynamicResponse.copyWith<BodyType>(body: customBody);
    } else if (BodyType == APISearch) {
      final BodyType customBody =
          _convertSearch(dynamicResponse.body) as BodyType;
      return dynamicResponse.copyWith<BodyType>(body: customBody);
    }
    return dynamicResponse.copyWith<BodyType>(body: null);
  }

  /// response to APIBook
  dynamic _convertBook(dynamic element) {
    //log("content<$APIBook>:$element",name:"API_CONVERTER");
    return APIBook.fromJson(jsonDecode(element));
  }

  /// response to APIAuthor
  dynamic _convertAuthor(dynamic element) {
    //log("content<$APIAuthor>:$element",name:"API_CONVERTER");
    return APIAuthor.fromJson(jsonDecode(element));
  }

  /// response to APISearch
  dynamic _convertSearch(dynamic element) {
    //log("content<$APISearch>:$element",name:"API_CONVERTER");
    return APISearch.fromJson(jsonDecode(element));
  }
}
