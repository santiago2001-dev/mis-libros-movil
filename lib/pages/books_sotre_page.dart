import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_store_page.dart';

class book_sotre_page extends StatefulWidget {
  const book_sotre_page({Key? key}) : super(key: key);

  @override
  State<book_sotre_page> createState() => _book_sotre_pageState();
}

class _book_sotre_pageState extends State<book_sotre_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),

          child:StreamBuilder<QuerySnapshot>(

            //traer data de db
            stream: FirebaseFirestore.instance
                .collection("stores")

                .snapshots(),
            builder: (context,snapshot){
              if(!snapshot.hasData)return const Text("loading");
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context,index){
                    QueryDocumentSnapshot store = snapshot.data!.docs[index];
                    return Card(
                      child: ListTile(
                      leading: Image.network(
                        store['urlPicture'] ?? "",
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Image(
                            image: AssetImage('assets/img/logo.png'),
                          );
                        },
                      ),

                        title: Text(store['name']),
                        subtitle: Text(store['addres']),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  DetailStorePage(store)));
                        },

                      ),
                    );
                  });
            },

          )
      ),
    );
  }
}
