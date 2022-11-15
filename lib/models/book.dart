class book {
  var _id;

  var _name;

  var _author;

  var _pages;

  var _rating;
  var _generes;


  book(this._id, this._name, this._author, this._pages, this._rating,
      this._generes);




  //construir JSON con data de entrada
  book.fromJson(Map<String, dynamic>json)
      : _id = json ['id'],
        _name = json ['name'],
        _author = json['author'],
        _pages = json ['pages'],
        _rating = json ['rating'],
        _generes =json ['generos'];


//construir Json con data Froms
        Map<String,dynamic>ToJson()=>{
        'id': _id,
        'name': _name,
        'author': _author,
        'pages': _pages,
        'generos': _generes,
        'rating': _rating
      };

  get generes => _generes;

  set generes(value) {
    _generes = value;
  }

  get rating => _rating;

  set rating(value) {
    _rating = value;
  }

  get pages => _pages;

  set pages(value) {
    _pages = value;
  }

  get author => _author;

  set author(value) {
    _author = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }
}