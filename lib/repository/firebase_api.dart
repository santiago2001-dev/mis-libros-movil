

import 'package:firebase_auth/firebase_auth.dart';

class firebase_api{
Future<bool> RegisterUser(String email,String password) async{

  try{
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseException   catch(e){
    print(e.code);
    return false ;

  }catch(e){
    print(e);
    return false;
  }


}
}