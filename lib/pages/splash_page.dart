import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_libros/pages/login_page.dart';

import 'my_books_page.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  //llamar metodo al lanzar vista
void initState() {
  _closeSplash();
  super.initState();
}
//time out
Future<void> _closeSplash() async {
  Future.delayed(const Duration(seconds: 2), () async {
    //redireccion a vista
   var islogin = FirebaseAuth.instance.currentUser;
   if(islogin == null) {
     Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
   }else{

     Navigator.push(context, MaterialPageRoute(builder: (context) => myBooksPage()));

   }
    });

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 18.0,
                ),
                Image(image: AssetImage('assets/img/logo.png')),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
