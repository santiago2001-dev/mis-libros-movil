


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

enum generos{masculino,femenino}
class _registerState extends State<register> {
  DateTime dateInitial = new DateTime(2022,1,1);
  // info inputs
  final _name = TextEditingController();
  final _pass = TextEditingController();
  final _email = TextEditingController();
  final  _reppass  =  TextEditingController();
  String data = '';
  //generos
  generos ? _gen  = generos.masculino;

  String btnMss = "fecha de naciemiento";

  //generos libros
  bool comedia = false;
  bool drama = false ;
  bool fantasia = false;
  void showSelectDate() async{
    final DateTime? newDate =  await showDatePicker(
        context: context,
        initialDate: DateTime(2022,08),
        firstDate: DateTime(1900,01),
        lastDate: DateTime(2022,12),
        helpText: "fecha de nacimiento");

    if(newDate != null) {
      setState(() {
        dateInitial = newDate;
        btnMss = "fecha de nacimiento : ${dateInitial.toString()}";
      });
    }
  }



  void capture(){
    setState(() {
      String gen =  "masculino";

      if(_gen == generos.femenino){
        gen = "femenino";
      }

      String  favoritos = "";
      if(comedia) favoritos = ("$favoritos : comedia");
      if(drama)favoritos = ("$favoritos : drama");
      if(fantasia)favoritos = ("$favoritos : fantasía");
      data = 'name : ${_name.text}\n pass : ${_pass.text}  \n email : ${_email.text} \n genero : $gen \n favoritos : $favoritos date : $dateInitial';
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
                Text(data)
                


              ],

            ),
          ),
        ),
      ),
    );
  }
}
