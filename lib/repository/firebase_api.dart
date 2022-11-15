

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mis_libros/models/user.dart' as userApp;

import '../models/book.dart';

class firebase_api{

Future<String?> RegisterUser(String email,String password) async{

  try{
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return credential.user?.uid;
  } on FirebaseAuthException   catch(e){
    print(e.code);
    return e.code ;

  }  on FirebaseException catch(e){

    return e.code;
  }


}

//login
Future<String?> Loing(String email,String pass)async{
  try{
    final credetial = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
    return credetial.user?.uid;

  } on FirebaseAuthException catch(e){
    print("error de auth ${e.code}");
    return e.code;
  }on FirebaseException catch(e){

   return e.code;
   }
  }



//add user ind db

Future<String>createUserInDb(userApp.User user ) async{
  try{
    final document = await FirebaseFirestore.instance.collection("users").doc(user.uid).set(user.ToJson());
    return user.uid;
  }on FirebaseException catch(e){
    print("FirebaseExceptionestee${e.code}");
    return e.code;
  }
}


Future<String>createBook(book Book)async{
  try{
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final document = await FirebaseFirestore.instance.collection("users").doc(uid).collection("book").doc();
    Book.id = document.id;
    final result = await  FirebaseFirestore.instance.collection("users").doc(uid).collection("book").doc(Book.id).set(Book.ToJson());
    return Book.id;

  }on FirebaseException catch(e) {
    print(e.code);
    return e.code;
    }
  }

}

