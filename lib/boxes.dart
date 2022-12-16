import 'package:hive/hive.dart';

import 'models/local_book.dart';

class boxes{
  //insertar registro en db
  static Box<LocalBook> getFavoritesBox()=> Hive.box('favoritos');
}