class Store {
  var _id;

  var _name;

  var _urlPicture;
  var _addres;

  var _phone;
  var _shedule;

  var _longitude;
  var _latitude;


  Store();

  get latitude => _latitude;

  set latitude(value) {
    _latitude = value;
  }

  get longitude => _longitude;

  set longitude(value) {
    _longitude = value;
  }

  get shedule => _shedule;

  set shedule(value) {
    _shedule = value;
  }

  get phone => _phone;

  set phone(value) {
    _phone = value;
  }

  get addres => _addres;

  set addres(value) {
    _addres = value;
  }

  get urlPicture => _urlPicture;

  set urlPicture(value) {
    _urlPicture = value;
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