import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_library/models/ol_book_model.dart';

import 'package:open_library/open_library.dart';

void main() {
  test('adds one to input values', () async {
    final OpenLibrary openLibrary = OpenLibrary();

    final OLBookBase book =
        await openLibrary.getBookByISBN(isbn: '9783608980806');

    expect(book is OLBook,true);
    if(book is OLBook){
      expect(book.title,'Der Herr der Ringe');
      debugPrint(book.toString());
    }

  });
}
