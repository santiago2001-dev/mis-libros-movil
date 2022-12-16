import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_libros/boxes.dart';
import 'package:mis_libros/models/local_book.dart';

import '../models/result.dart';

class detail_book_search extends StatefulWidget {

  final Items book;
  const detail_book_search(this.book);



  @override
  State<detail_book_search> createState() => _detail_book_searchState();
}

class _detail_book_searchState extends State<detail_book_search> {
  void _onFavorite() async{
  var localBook = LocalBook()
    ..id = widget.book.id
    ..name = widget.book.volumeInfo?.title
    ..author = widget.book.volumeInfo?.authors?[0]
    ..publishDate = widget.book.volumeInfo?.publishedDate
      ..Description = widget.book.volumeInfo?.description
      ..imageLik = widget.book.volumeInfo?.imageLinks?.smallThumbnail;

    final box = boxes.getFavoritesBox();
    box.add(localBook);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.volumeInfo?.title ?? "detalle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                widget.book.volumeInfo?.imageLinks?.smallThumbnail ?? "",
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Image(
                    image: AssetImage('assets/img/logo.png'),
                  );
                },
              ),
              Row(
                children: [
                  Expanded(
                      child: IconButton(
                        alignment: Alignment.topRight,
                        icon: const Icon(Icons.favorite_border),
                        color: Colors.red,
                        onPressed: ((){
                          _onFavorite();
                        }),

                      ))
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                child: Text("Autor : ${widget.book.volumeInfo?.authors?[0]}",
                textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17.0,fontStyle: FontStyle.italic
                  ),
                ),

              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                child: Text("publicado el  : ${widget.book.volumeInfo?.publishedDate}",
                textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17.0,fontStyle: FontStyle.italic
                  ),
                ),

              ),
              Padding(padding: const EdgeInsets.all(8.0),
                child: Text(  widget.book.volumeInfo?.description?? "no description",
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontSize: 17.0,fontStyle: FontStyle.italic
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
