import 'dart:convert';
import 'dart:html';

import 'package:Breweries_Web/data/models/brewery_list_model.dart';

class DatabaseHelper {

  //Singleton
  DatabaseHelper._internal();
  static final DatabaseHelper instance = DatabaseHelper._internal();
  factory DatabaseHelper() {
    return instance;
  }

  static const BREWERIES_ID = 'breweries_list_id';

  final Storage _localStorage = window.localStorage;

  void save(List<Breweries> list) {
    _localStorage[BREWERIES_ID] = list.length.toString();

    for (var i = 0; i < list.length; i++) {
      _localStorage['$i'] = jsonEncode(list.elementAt(i));
    }
  }

  List<Breweries> getBreweriesData()  {
   final lists = _localStorage[BREWERIES_ID];
   List<Breweries> list = List();

   for(var i = 0 ; i < lists.length ; i++) {
     list.add(Breweries.fromJson(json.decode(_localStorage['$i'])));
   }
   return list;
  }

  bool checkBreweries() {
    return _localStorage[BREWERIES_ID] != null;
  }

  Future invalidate() async {
    _localStorage.remove(BREWERIES_ID);
  }

}