import 'package:Breweries_Web/data/models/brewery_list_model.dart';
import 'package:Breweries_Web/data/repo/HomeRepository.dart';
import 'package:Breweries_Web/di/network_module.dart';
import 'package:Breweries_Web/manager/DatabaseHelper.dart';
import 'package:Breweries_Web/ui/breweries_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BreweriesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BreweriesListState();
  }
}

class BreweriesListState extends State<BreweriesList> {
  final homeRespositoy = HomeRepository();
  Future<List<Breweries>> breweriesList;

  @override
  void initState() {
    super.initState();
     breweriesList = homeRespositoy.storeBreweriesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
          "Breweries",
          style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
      body: FutureBuilder(
        future: breweriesList,
        builder: (BuildContext context, AsyncSnapshot<List<Breweries>> snapshot) {
          if (snapshot.hasData) {
            List<Breweries> lists = snapshot.data;
            return ListView(
              children: lists
                  .map(
                    (Breweries data) => ListTile(
                  title: Text(data.name),
                  subtitle: Text("${data.websiteUrl}"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BreweriesDetail(
                        breweries: data,
                      ),
                    ),
                  ),
                ),
              )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
