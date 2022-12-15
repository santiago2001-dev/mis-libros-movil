import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_libros/models/result.dart';
import 'package:mis_libros/repository/BooksApi.dart';
import 'package:mis_libros/repository/BooksApi.dart';

import 'detall_search_book_page.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  BooksApi _booksApi = BooksApi();
  final _busqueda = TextEditingController();

  List<Items> listBook = <Items>[];

  Future _searchBook()async{
    print(_busqueda.text);
  Result restulFutre = await _booksApi.getBoks(_busqueda.text);
  setState(() {


  restulFutre.items?.forEach((element) {
    listBook.add(element);
    print(element);

  });
  });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _busqueda,
                decoration:  const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Busqueda De Libro'),
                  keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                  onPressed: (){
                    _searchBook();

                  },
                  child: const Icon(Icons.search)),

              Expanded(
                child: ListView.builder(
                  itemCount: listBook.length,
                  itemBuilder: (BuildContext context, int index) {
                    Items book = listBook[index];
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          book.volumeInfo?.imageLinks?.smallThumbnail ?? "",
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Image(
                              image: AssetImage('assets/img/logo.png'),
                            );
                          },
                        ),
                        title: Text(book.volumeInfo?.title ?? "No title"),
                        subtitle: Text(
                            book.volumeInfo?.publishedDate ?? "No publishedDate"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      detail_book_search(book)));
                        },
                      ),
                    );
                  },
                ),
              ),

            ]),

          ),
        ),

    );
  }
}
