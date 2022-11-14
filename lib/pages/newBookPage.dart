import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class newBookpage extends StatefulWidget {
  const newBookpage({Key? key}) : super(key: key);

  @override
  State<newBookpage> createState() => _newBookpageState();
}

class _newBookpageState extends State<newBookpage> {
  final _name = TextEditingController();
  final _author = TextEditingController();
  final _pages = TextEditingController();
  double _rating =  3.0;
  //generos
  bool _action= false ,_aventura = false ,_cienciaFiccion = false , _drama = false , _romance =  false, _fantasia = false,
  _suspenso = false , _terror = false;
void _savebook(){

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
            keyboardType: TextInputType.text,

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
                    title: const Text("Acción"),
                    value: _action,
                    selected: _action,
                    onChanged: (bool? value){
                      setState(() {
                        _action = value!;
                      });
                    },
                  )),
              Expanded(
                  child: CheckboxListTile(
                    title: const Text("Aventura"),
                    value: _aventura,
                    selected: _aventura,
                    onChanged: (bool? value){
                      setState(() {
                        _aventura =  value!;
                      });
                    },
                  )),

              Row(
                children: [
                  Expanded(
                      child: CheckboxListTile(
                        title: const Text("Drama"),
                        value: _drama,
                        selected: _drama,
                        onChanged: (bool? value){
                          setState(() {
                            _drama = value!;
                          });
                        },
                      )),
                  Expanded(
                      child: CheckboxListTile(
                        title: const Text("Ciencia Ficción"),
                        value: _cienciaFiccion,
                        selected: _cienciaFiccion,
                        onChanged: (bool? value){
                          setState(() {
                            _cienciaFiccion = value!;
                          });
                        },
                      )),
                ],
              ),

              Row(
                children: [
                  Expanded(
                      child: CheckboxListTile(
                        title: const Text("Romance"),
                        value: _romance,
                        selected: _romance,
                        onChanged: (bool? value){
                          setState(() {
                            _romance = value!;
                          });
                        },
                      )),
                  Expanded(
                      child: CheckboxListTile(
                        title: const Text("Terror"),
                        value: _terror,
                        selected: _terror,
                        onChanged: (bool? value){
                          setState(() {
                            _terror = value!;
                          });
                        },
                      )),
                ],
              ),

              Row(
                children: [
                  Expanded(
                      child: CheckboxListTile(
                        title: const Text("Fantasía"),
                        value: _fantasia,
                        selected: _fantasia,
                        onChanged: (bool? value){
                          setState(() {
                            _fantasia = value!;
                          });
                        },
                      )),
                  Expanded(
                      child: CheckboxListTile(
                        title: const Text("Suspenso"),
                        value: _suspenso,
                        selected: _suspenso,
                        onChanged: (bool? value){
                          setState(() {
                            _suspenso = value!;
                          });
                        },
                      )),
                ],
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
