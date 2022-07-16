import 'package:flutter/material.dart';
import 'package:open_library/open_library.dart';
import 'screens/book_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => OpenLibrary(),
        dispose: (_, OpenLibrary ol) => ol.dispose(),
        child: MaterialApp(
            title: 'Book Example',
            home: BookScreen()
        ));
  }
}
