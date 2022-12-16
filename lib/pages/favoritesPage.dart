import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mis_libros/boxes.dart';

import '../models/local_book.dart';

class favoritesPage extends StatefulWidget {
  const favoritesPage({Key? key}) : super(key: key);

  @override
  State<favoritesPage> createState() => _favoritesPageState();
}

class _favoritesPageState extends State<favoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        child: Center(
          child: _buildlistview(),
        ),
      ),
    );

  }
  Widget _buildlistview(){
    return ValueListenableBuilder<Box<LocalBook>>
      (valueListenable: boxes.getFavoritesBox().listenable(),
        builder: (context,box,_){
        final bookBox = box.values.toList().cast<LocalBook>();
        return ListView.builder(
          itemCount: bookBox.length,
          itemBuilder: (BuildContext context, int index) {
          final book = bookBox[index];
          return Card(
          child: ListTile(
          leading: Image.network(
          book.imageLik ?? "",
          errorBuilder: (BuildContext context, Object exception,
          StackTrace? stackTrace) {
          return const Image(
          image: AssetImage('assets/img/logo.png'),
          );
          },
          ),
          title: Text(book.name ?? "No title"),
          subtitle: Text(
          book.publishDate ?? "No publishedDate"),

          ),

          );
        },
        );
        });
  }

  }