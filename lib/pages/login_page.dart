import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_libros/pages/register_page.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  String data = "";

  void login(){
    setState(() {
      data = "email : ${_email.text} \n pass :${_pass.text} ";
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
