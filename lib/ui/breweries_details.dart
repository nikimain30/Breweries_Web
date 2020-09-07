import 'package:Breweries_Web/data/models/brewery_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BreweriesDetail extends StatelessWidget {
  final Breweries breweries;

  BreweriesDetail({this.breweries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(breweries.name),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Title:"),
                        subtitle: Text(breweries.name),
                      ),
                      ListTile(
                        title: Text("Type:"),
                        subtitle: Text("${breweries.breweryType}"),
                      ),
                      ListTile(
                        title: Text("Website Url:"),
                        subtitle: Text("${breweries.websiteUrl}"),
                      ),
                      ListTile(
                        title: Text("Contact"),
                        subtitle: Text(breweries.phone),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

