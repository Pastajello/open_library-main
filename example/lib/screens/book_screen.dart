import 'package:flutter/material.dart';
import 'package:open_library/models/ol_book_model.dart';
import 'package:open_library/models/ol_search_model.dart';
import 'package:open_library/open_library.dart';
import 'package:provider/provider.dart';

const ISBN1 = '9783608980806';
const ISBN2 = '0674995171';
const ISBN3 = '3596191130';

class BookScreen extends StatefulWidget {
  BookScreen({Key? key}) : super(key: key);

  final List<OLBook> books = [];

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final TextEditingController controller =
      TextEditingController(text: "Lord of the Rings");
  late bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: !isLoading
          ? Column(
              children: [
                const SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 60.0,
                      child: TextField(
                        controller: controller,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          label: Text("Book title:"),
                          labelStyle: TextStyle(color: Colors.white),
                          focusColor: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final OLSearchBase search =
                              await Provider.of<OpenLibrary>(context,
                                      listen: false)
                                  .query(title: controller.text, limit: 4);
                          if (search is OLSearch) {
                              widget.books.clear();
                              print("search:\n$search");
                              for (var doc in search.docs) {
                                final OLBook book = OLBook(
                                  title: doc.title,
                                  authors: doc.authors,
                                  covers: doc.covers,
                                );
                                widget.books.add(book);
                              }
                          }
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Center(
                    child: Text(
                      "press action button to search for those ISBN's",
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                const Center(
                    child: Text(
                  "ISBN1:$ISBN1",
                  style: TextStyle(color: Colors.white),
                )),
                const SizedBox(height: 20.0),
                const Center(
                    child: Text(
                  "ISBN2:$ISBN2",
                  style: TextStyle(color: Colors.white),
                )),
                const SizedBox(height: 20.0),
                const Center(
                    child: Text(
                  "ISBN3:$ISBN3",
                  style: TextStyle(color: Colors.white),
                )),
                const SizedBox(height: 20.0),
                SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.books.length,
                    itemBuilder: (context, index) {
                      return bookWidget(
                          book: widget.books[index], context: context);
                    },
                  ),
                )
              ],
            )
          : const Center(child: CircularProgressIndicator(color: Colors.white,)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          widget.books.clear();
          const bool loadCovers = true;
          const CoverSize size = CoverSize.S;
          final OLBookBase book1 =
              await Provider.of<OpenLibrary>(context, listen: false)
                  .getBookByISBN(
                      isbn: ISBN1, loadCover: loadCovers, coverSize: size);
          print(book1.toString());
          if (book1 is OLBook) {
            widget.books.add(book1);
          }
          final OLBookBase book2 =
              await Provider.of<OpenLibrary>(context, listen: false)
                  .getBookByISBN(
                      isbn: ISBN2, loadCover: loadCovers, coverSize: size);
          print(book2.toString());
          if (book2 is OLBook) {
            widget.books.add(book2);
          }
          final OLBookBase book3 =
              await Provider.of<OpenLibrary>(context, listen: false)
                  .getBookByISBN(
                      isbn: ISBN3, loadCover: loadCovers, coverSize: size);
          print(book3.toString());
          if (book3 is OLBook) {
            widget.books.add(book3);
          }
          setState(() {
            isLoading = false;
          });
        },
        child: const Icon(Icons.book),
      ),
    );
  }

  Widget bookWidget({required OLBook book, required BuildContext context}) {
    String author = '';
    if (book.authors.isNotEmpty) {
      author = book.authors.first.name.trim();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 20.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      book.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 20.0),
                  child: Text(
                    author,
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SizedBox(
                height: book.covers.isNotEmpty ? 64.0 : 0,
                child: book.covers.isNotEmpty
                    ? Image.memory(book.covers.first)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
