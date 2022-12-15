import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mis_libros/pages/favoritesPage.dart';
import 'package:mis_libros/pages/my_books_page.dart';
import 'package:mis_libros/pages/searchBookPage.dart';

import 'login_page.dart';

class myhomePage extends StatefulWidget {
  const myhomePage({Key? key}) : super(key: key);

  @override
  State<myhomePage> createState() => _myhomePageState();
}

class _myhomePageState extends State<myhomePage> {

  var currentPage = 0;

  late List<Widget> pages;
@override
  void initState() {
    _loadPages();
    super.initState();
  }

  void _loadPages(){
    pages = [];
    pages.add(myBooksPage());
    pages.add(Search());
    pages.add(favoritesPage());

}


  _onItemTapped(int page){
  setState(() {
    currentPage = page;
  });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("mis libros"),
        actions: [
          PopupMenuButton(
              onSelected: (Menu item){
                setState(() {
                  if(item == Menu.logout){
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => const login()));
                  }
                });
              },
              itemBuilder: (BuildContext context)=> <PopupMenuEntry<Menu>>[
                const PopupMenuItem(
                  value: Menu.logout,
                  child: Text("salir"),
                ),
              ]

          )
        ],
      ),
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (page){
          _onItemTapped(page);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.book,size: 20),
            label: 'mis libros'

          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.searchengin,size: 20),
          label: 'Buscar '),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.heart,size: 20),
          label: 'mis favoritos')
          
        ],
      ),
    );
  }
}
