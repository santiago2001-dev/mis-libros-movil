


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

enum generos{masculino,femenino}
class _loginState extends State<login> {

  final _name = TextEditingController();
  final _pass = TextEditingController();
  final _email = TextEditingController();
  final  _reppass  =  TextEditingController();
  String data = '';

 generos ? _gen  = generos.masculino;
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

              //radioBox masculino
                ListTile(
                  title: const Text('Masculino'),
                  leading: Radio<generos>(
                    value: generos.masculino,
                    groupValue: _gen,
                    onChanged: (generos ?  value){
                      setState(() {
                        _gen =  value;
                      });

                },
                  ),
                ),
            //radioBox femenino
                ListTile(
                  title: const Text('Femenino'),
                  leading: Radio<generos>(
                    value: generos.femenino,
                    groupValue: _gen,
                    onChanged: (generos ? value){
                      setState(() {
                        _gen = value;
                      });

                    },


                  ),
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
