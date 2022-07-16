// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$OpenLibraryApiService extends OpenLibraryApiService {
  _$OpenLibraryApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = OpenLibraryApiService;

  @override
  Future<Response<APIBook>> _getBookByISBN({required String isbn}) {
    final $url = 'https://openlibrary.org/isbn/${isbn}.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<APIBook, APIBook>($request);
  }

  @override
  Future<Response<APIAuthor>> _getAuthorById({required String id}) {
    final $url = 'https://openlibrary.org/authors/${id}.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<APIAuthor, APIAuthor>($request);
  }

  @override
  Future<Response<Uint8List>> _getCoverById(
      {required String id, required String size}) {
    final $url = 'https://covers.openlibrary.org/b/id/${id}-${size}.jpg';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Uint8List, Uint8List>($request);
  }

  @override
  Future<Response<APISearch>> _query({required String pattern}) {
    final $url = 'https://openlibrary.org/search.json?${pattern}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<APISearch, APISearch>($request);
  }
}
