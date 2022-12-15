

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_libros/pages/login_page.dart';
import 'package:mis_libros/pages/newBookPage.dart';

class myBooksPage extends StatefulWidget {
  const myBooksPage({Key? key}) : super(key: key);

  @override
  State<myBooksPage> createState() => _myBooksPageState();
}
enum Menu {logout}
class _myBooksPageState extends State<myBooksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),

        child:StreamBuilder<QuerySnapshot>(

          //traer data de db
          stream: FirebaseFirestore.instance.collection("users")
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .collection("book")
              .snapshots(),
              builder: (context,snapshot){
              if(!snapshot.hasData)return const Text("loading");
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context,index){
                    QueryDocumentSnapshot book = snapshot.data!.docs[index];
                    return Card(
                      child: ListTile(
                        title: Text(book['name']),
                        subtitle: Text(book['author']),

                      ),
                    );
                  });
              },
          
        )
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
