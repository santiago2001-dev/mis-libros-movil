class User{
  var _name ;
  var _pass ;
  var _email;
  var _generos ;
  var _generosFav;
   var  _dateBorn;


  User(this._name, this._pass, this._email, this._generos, this._generosFav,
      this._dateBorn);

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
}