import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/result.dart';

class detail_book_search extends StatelessWidget {

  final Items book;
  const detail_book_search(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.volumeInfo?.title ?? "detalle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                book.volumeInfo?.imageLinks?.smallThumbnail ?? "",
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Image(
                    image: AssetImage('assets/img/logo.png'),
                  );
                },
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                child: Text("Autor : ${book.volumeInfo?.authors?[0]}",
                textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17.0,fontStyle: FontStyle.italic
                  ),
                ),

              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                child: Text("publicado el  : ${book.volumeInfo?.publishedDate}",
                textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17.0,fontStyle: FontStyle.italic
                  ),
                ),

              ),
              Padding(padding: const EdgeInsets.all(8.0),
                child: Text(  book.volumeInfo?.description?? "no description",
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
