import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_libros/pages/newBookPage.dart';

class myBooksPage extends StatefulWidget {
  const myBooksPage({Key? key}) : super(key: key);

  @override
  State<myBooksPage> createState() => _myBooksPageState();
}

class _myBooksPageState extends State<myBooksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mis libros"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 16.0,
            )
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const newBookpage()));
          
        },
        tooltip: 'new book',
        child: const Icon(Icons.add),
      ),
    );
  }
}
