


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_libros/pages/login_page.dart';
import 'package:mis_libros/repository/firebase_api.dart';
import '/models/user.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

enum generos{masculino,femenino}

class _registerState extends State<register> {

  //instancia metodos auth firebase
  final firebase_api fireapi = firebase_api();

  String dateInitial = "";
  // info inputs
  final _name = TextEditingController();
  final _pass = TextEditingController();
  final _email = TextEditingController();
  final  _reppass  =  TextEditingController();

  //generos
  generos ? _gen  = generos.masculino;

  String btnMss = "fecha de naciemiento";

  //generos libros
  bool comedia = false;
  bool drama = false ;
  bool fantasia = false;

  //convertir formato de fecha capturada
  String _dateConvert(DateTime newDate){
    final DateFormat formatter =  DateFormat('yyyy-MM-dd');
    final String dateFinal = formatter.format(newDate);
    return dateFinal;

  }

//agregar info de usuario en tabla db
void _addUserDb(User user)async{
  var result = await fireapi.createUserInDb(user);

  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context)=>login())
  );

}

//registrar usuario para login
  registerUser(User user)async{
    var result = await fireapi.RegisterUser(_email.text, _pass.text);
    String msg ="";
    //validaciones
    if(result ==  "invalid-email"){msg = "Ingresa un correo electrónico válido";_alert(msg);}else
    if(result ==  "weak-password"){msg = "Ingresa una contraseña válida de minímo 6 caracteres";_alert(msg);}else
    if(result ==  "email-already-in-use"){msg = "Correo electrónico ya está registrado";_alert(msg);}else
    if(result ==  "network-request-failed"){msg = "Sin conexión a internet verfica tú conexión e intenta de nuevo";_alert(msg);}else {
      msg = "usuario agregado de forma correcta";
      //captura de id
      user.uid = result;
      _addUserDb(user);
    }
    _alert(msg);
  }

  //widget capturar fecha
  void showSelectDate() async{
    final DateTime? newDate =  await showDatePicker(
        context: context,
        initialDate: DateTime(2022,08),
        firstDate: DateTime(1900,01),
        lastDate: DateTime(2022,12),
        helpText: "fecha de nacimiento");

    if(newDate != null) {
      setState(() {
        dateInitial = _dateConvert(newDate);
        btnMss = "fecha de nacimiento : ${dateInitial.toString()}";
      });
    }
  }

//alert function
_alert(String msg){
    final Scaffold = ScaffoldMessenger.of(context);
    Scaffold.showSnackBar(
        SnackBar(content:   Text(msg),
        action: SnackBarAction(
            label: "Aceptar",onPressed: Scaffold.hideCurrentSnackBar,
        ),
        ),
    );
  }


  void capture(){
    setState(() {
      if(_pass.text ==_reppass.text) {
        String gen = "masculino";
        String favoritos = "";

        if (_gen == generos.femenino) {
          gen = "femenino";
        }
        if (comedia) favoritos = ("$favoritos : comedia");
        if (drama) favoritos = ("$favoritos : drama");
        if (fantasia) favoritos = ("$favoritos : fantasía");
        //instancia modelo user
        var user = User("", _name.text, _pass.text, _email.text, gen, favoritos, dateInitial);
        //envio data el metodo de registro
        registerUser(user);
      }else{
        _alert("Conntraseña no son iguales");
      }
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
                const SizedBox(
                  height: 16.0,
                ),

                Text("GENEROS FAVORITOS",
                  style:TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.deepPurple,
                    fontSize: 20

                  ) ,
                ),
                const SizedBox(
                  height: 16.0,
                ),

                //generos libros
                //comedia
                CheckboxListTile(
                    title:  const Text('Comeida'),

                    value: comedia,
                    selected: comedia,

                    onChanged: (bool? value){
                      setState(() {
                        comedia = value!;
                      });

                    }

                ),

                //drama
                CheckboxListTile(
                  title : const Text('Drama'),

                    value: drama,
                    selected: drama,

                    onChanged:(bool? value){
                    setState(() {
                      drama = value!;
                    });

                    }),
                //fantasia
                CheckboxListTile(
                  title: const Text("Fantasía"),
                    value: fantasia,
                    selected: fantasia,
                    onChanged: (bool? value){
                    setState(() {
                      fantasia = value!;
                    });

                    }
                ),


                //date
                ElevatedButton(
                    onPressed: (){
                      showSelectDate();

                    },
                    child: Text(btnMss)

                ),
                SizedBox(
                  height: 18.0,
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

                


              ],

            ),
          ),
        ),
      ),
    );
  }
}
