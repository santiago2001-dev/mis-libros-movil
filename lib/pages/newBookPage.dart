import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mis_libros/models/book.dart';

import '../repository/firebase_api.dart';

class newBookpage extends StatefulWidget {
  const newBookpage({Key? key}) : super(key: key);

  @override
  State<newBookpage> createState() => _newBookpageState();
}

class _newBookpageState extends State<newBookpage> {
  final firebase_api fireapi = firebase_api();

  final _name = TextEditingController();
  final _author = TextEditingController();
  final _pages = TextEditingController();
  double _rating =  3.0;
  //generos
  bool _accion= false ,_aventura = false ,_cienciaFiccion = false , _drama = false , _romance =  false, _fantasia = false,
  _suspenso = false , _terror = false;
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


  void _createBook(book Book)async{
    var result = await fireapi.createBook(Book);
    _alert("libro creado de forma correcta");
    Navigator.pop(context);

  }
void _savebook(){
setState(() {
  var generes =  "";
  if(_accion)  generes = ("$generes : Acción");
  if(_aventura)  generes = ("$generes : Aventura");
  if(_cienciaFiccion)  generes = ("$generes : Ciencia Ficción");
  if(_drama)  generes = ("$generes : Drama");
  if(_suspenso)  generes = ("$generes : Suspenso");
  if(_romance)  generes = ("$generes : Romance");
  if(_fantasia)  generes = ("$generes : Fantasía");
var Book =  book("",_name.text,_author.text,_pages.text,_rating,generes);
_createBook(Book);
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Libro"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        child: SingleChildScrollView(
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _name,
            decoration: const InputDecoration(
            border: OutlineInputBorder(),labelText:'Nombre' ),
              keyboardType: TextInputType.text,

          ),
          const SizedBox(
            height: 16.0,
          ),
          TextFormField(
            controller: _author,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),labelText: 'Autor',),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 16.0,
          ),
          TextFormField(
            controller: _pages,
            decoration : const InputDecoration(
             border : OutlineInputBorder(),labelText : 'paginas',),
            keyboardType: TextInputType.number,

          ),
          const SizedBox(
            height: 16.0,
          ),


          //bar rating
          RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding:EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context,_)=> const Icon(
                  Icons.star,
                color: Colors.amber,
              ),
            onRatingUpdate: (rating){
                _rating = rating;
            },
              ),

          const SizedBox(
            height: 16.0,
          ),

          const Text("GENEROS LITERIARIOS",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 16.0,
          ),
          //checkbox generos
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  title: const Text("Accion"),
                  value: _accion,
                  selected: _accion,
                  onChanged: (bool? value) {
                    setState(() {
                      _accion = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  title: const Text("Aventura"),
                  value: _aventura,
                  selected: _aventura,
                  onChanged: (bool? value) {
                    setState(() {
                      _aventura = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  title: const Text("Ciencia ficcion"),
                  value: _cienciaFiccion,
                  selected: _cienciaFiccion,
                  onChanged: (bool? value) {
                    setState(() {
                      _cienciaFiccion = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  title: const Text("Drama"),
                  value: _drama,
                  selected: _drama,
                  onChanged: (bool? value) {
                    setState(() {
                      _drama = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  title: const Text("Fantasia"),
                  value: _fantasia,
                  selected: _fantasia,
                  onChanged: (bool? value) {
                    setState(() {
                      _fantasia = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  title: const Text("Romance"),
                  value: _romance,
                  selected: _romance,
                  onChanged: (bool? value) {
                    setState(() {
                      _romance = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  title: const Text("Suspenso"),
                  value: _suspenso,
                  selected: _suspenso,
                  onChanged: (bool? value) {
                    setState(() {
                      _suspenso = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  title: const Text("Terror"),
                  value: _terror,
                  selected: _terror,
                  onChanged: (bool? value) {
                    setState(() {
                      _terror = value!;
                    });
                  },
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
              onPressed: (){
                _savebook();
              },
              child: const Text("Envia"))
        ],
      ),
      ),
      ),
    );
  }
}
