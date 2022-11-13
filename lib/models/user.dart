class User{
  var _uid;
  var _name ;
  var _pass ;
  var _email;
  var _generos ;
  var _generosFav;
   var  _dateBorn;




  User(this._uid, this._name, this._pass, this._email, this._generos,
      this._generosFav, this._dateBorn);


  User.Empty();

  //construir JSON con data de entrada
  User.fromJson(Map<String,dynamic>json)
      :  _uid  = json ['uid'],
        _name  = json ['name'],
        _pass = json['pass'],
        _email  = json ['email'],
        _generos =json ['generos'],
        _generosFav = json ['generosFav'];

    //construir Json con data Froms
  Map<String,double>ToJson()=>{

    'uid': _uid,
      'name': _name,
        'pass': _pass,
        'email':_email,
        'generos': _generos,
        'generosFav':_generosFav
  };


  get name => _name;

  set name(value) {
    _name = value;
  }

  get pass => _pass;

  get dateBorn => _dateBorn;

  set dateBorn(value) {
    _dateBorn = value;
  }

  get generosFav => _generosFav;

  set generosFav(value) {
    _generosFav = value;
  }

  get generos => _generos;

  set generos(value) {
    _generos = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  set pass(value) {
    _pass = value;
  }

  get uid => _uid;

  set uid(value) {
    _uid = value;
  }
}