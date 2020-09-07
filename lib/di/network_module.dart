import 'dart:convert';

import 'package:Breweries_Web/data/models/brewery_list_model.dart';
import 'package:http/http.dart';

class NetworkModule {

  //Singleton
  NetworkModule._internal();
  static final NetworkModule instance = NetworkModule._internal();
  factory NetworkModule() {
    return instance;
  }

  final String breweriesList = "https://api.openbrewerydb.org/breweries";

  Future<List<Breweries>> getBreweriesList() async {
    Response res = await get(breweriesList);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Breweries> list = body
          .map(
            (dynamic item) => Breweries.fromJson(item),
      )
          .toList();

      return list;
    } else {
      throw "Failed to load data";
    }
  }

}

