## 0.1.6
* Remove Flutter dependancies. Now package is pure dart

## 0.1.5
* Bugfix: Error in pattern builder to render search patterns without title now works

## 0.1.4
* updated doc to follow the dart guidelines to create more readable docs described at https://dart.dev/guides/language/effective-dart/documentation

## 0.1.3
* updated project structure to separate private code from public api code

## 0.1.2
* new search patterns for subject, place, person, language, and publisher
* you now can fully combine search patterns

## 0.1.1
* documentation update

## 0.1.0
* New features to support the search.json query engine of openlibrary.org
* New Models to support rich property models for search result
* selecting L/M/S covers on search to reduce loading times for previews
* getBookByISBN now supports cover loading true/false
* getBookByISBN now supports cover size S/M/L on fetch
* Covers can now be loaded independently
This version is the first bump to more features on the openlibrary.org search

## 0.0.3
* Documentation Update
documentation embedded image fixed.

## 0.0.2
* Documentation Update
some updates on the documentation.

## 0.0.1

* Initial Release.
the initial release only supports to fetch books via it's ISBN (10,13 digits). It provides
  a bunch of models to represent books and authors. The OLBook Model will give you access
  to almost all data provided by openlibrary.org isbn/book api. Also it adds the authors and
  covers as Uint8List if covers exists.
  
