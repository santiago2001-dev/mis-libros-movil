


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final _name = TextEditingController();
  final _pass = TextEditingController();
  final _email = TextEditingController();
  final  _reppass  =  TextEditingController();
  String data = '';
  
  void capture(){
    setState(() {
      data = 'name : ${_name.text}\n pass : ${_pass.text}  \n email : ${_email.text}';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
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

                //name
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'nombre de usuario',
                  ),
                  keyboardType: TextInputType.text,
                ),

                const SizedBox(
                  height: 16.0,
                ),

                //email
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'correo electrónico'
                  ),
                  keyboardType: TextInputType.emailAddress,

                ),

             const SizedBox(
               height: 16.0,
             ),
                //pass
                TextFormField(
                  controller: _pass,
                  obscureText: true,

                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),

                    labelText:  'contraseña'

                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 16.0,
                ),
              //rep pass
                TextFormField(
                  controller: _reppass,
                  obscureText: true,

                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'repite la contraseña'

                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 17),
                    backgroundColor: Colors.deepPurple
                  ),
                  onPressed: (){
                      capture();
                  },
                child: const Text('registro'),
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
