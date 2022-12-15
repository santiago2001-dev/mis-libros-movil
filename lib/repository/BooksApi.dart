import 'dart:convert';

import '../models/result.dart';
import 'package:http/http.dart' as http;
//peteciones http a apis 
class BooksApi{
  Future<Result> getBoks(String busqueda)async{
    final response = await  http.get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$busqueda'));
    if(response.statusCode == 200){
      return Result.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('error al cargar libros');
    }


  }
}