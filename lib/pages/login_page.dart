import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_libros/pages/home_page.dart';
import 'package:mis_libros/pages/my_books_page.dart';
import 'package:mis_libros/pages/register_page.dart';
import 'package:mis_libros/repository/firebase_api.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final firebase_api fireapi = firebase_api();
  final _email = TextEditingController();
  final _pass = TextEditingController();


  _alert(String msg){
    final Scaffold = ScaffoldMessenger.of(context);
    Scaffold.showSnackBar(
        SnackBar(content: Text(msg),
          action: SnackBarAction(
            label: "aceptar",onPressed: Scaffold.hideCurrentSnackBar,
          ),
        )
    );
  }
  String data = "";

  void login()async {
    //validacion si el usuario ingresa los datos
    if (_email.text.isEmpty || _pass.text.isEmpty) {
      _alert("campos obligatorios");
    }else {
      var result = await fireapi.Loing(_email.text, _pass.text);
      String msg = "";

      if(result ==  "invalid-email"){
        msg = "Ingresa un correo electrónico válido";
        _alert(msg);}
      else if(result ==  "user-not-found"){
        msg = "Usuario no registrado";
        _alert(msg);} else if(result ==  "wrong-password"){
        msg = "Contraseña  o correo incorrecto";_alert(msg);}
      else if(result ==  "network-request-failed"){
        msg = "Sin conexión a internet verfica tú conexión e intenta de nuevo";
        _alert(msg);
      }else {
        msg = "Usuario correcto";
        _alert(msg);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const myBooksPage()));
      }
    }
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
                  height: 16.0,
                ),
                Image(image: AssetImage('assets/img/logo.png')),
                const SizedBox(
                  height: 16.0,
                ),

                //form login
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    border:  OutlineInputBorder(),
                    labelText: "Ingresa tú email"
                  ),
                  keyboardType: TextInputType.emailAddress,

                ),
                    const SizedBox(
                      height: 18.0,
                    ),
                TextFormField(
                  controller: _pass,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Ingresa tú contraseña"
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),

                const SizedBox(
                  height: 16.0,
                )
,               ElevatedButton(
                    onPressed: (){
                      login();

                    },
                    child: const Text("login")
                ),

                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>register()));
                    },
                    child: const Text("¿no tienes cuenta? registrate")
                ),

                 Text(data)

              ],

            ),
          ),
        ),
      ),
    );
  }
}
