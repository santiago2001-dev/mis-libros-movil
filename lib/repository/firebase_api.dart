

import 'package:firebase_auth/firebase_auth.dart';

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

  }on FirebaseException catch(e){
    return e.code;
  }on FirebaseAuthException catch(e){
    return e.code;
  }

}
}