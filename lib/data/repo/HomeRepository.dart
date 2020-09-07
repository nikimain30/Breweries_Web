import 'package:Breweries_Web/data/models/brewery_list_model.dart';
import 'package:Breweries_Web/di/network_module.dart';
import 'package:Breweries_Web/manager/DatabaseHelper.dart';
import 'package:flutter/foundation.dart';

class HomeRepository {
  final networkModule = new NetworkModule();
  final db_helper = new DatabaseHelper();

  Future<List<Breweries>> storeBreweriesList() async{
    List<Breweries> breweries;
    if (db_helper.checkBreweries()) {
      db_helper.getBreweriesData();
    } else {
      breweries = await networkModule.getBreweriesList();
      try {
        if(kIsWeb && breweries != null) {
          db_helper.save(breweries);
        }
      } catch(e){
        print(e);
      }
    }
  }



}