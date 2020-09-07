import 'package:flutter/material.dart';

class Breweries {
  int id;
  String name;
  String breweryType;
  String street;
  String city;
  String state;
  String postalCode;
  String phone;
  String websiteUrl;
  String updatedAt;
  String longitude;
  String latitude;

  Breweries({@required this.id,@required this.name,@required this.breweryType,@required this.street,@required this.city,@required this.state,@required this.postalCode,@required this.phone,@required this.websiteUrl,@required this.updatedAt,@required this.latitude,@required this.longitude});

  factory Breweries.fromJson(Map<String, dynamic> json) {
    return Breweries(
      id: json['id'] as int,
      name: json['name'] as String,
      breweryType: json['brewery_type'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      postalCode: json['postal_code'] as String,
      phone: json['phone'] as String,
      websiteUrl: json['website_url'] as String,
      updatedAt: json['updated_at'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'brewery_type': breweryType,
    'street': street,
    'city': city,
    'state': state,
    'postal_code': postalCode,
    'phone': phone,
    'website_url': websiteUrl,
    'updated_at': updatedAt,
    'latitude': latitude,
    'longitude': longitude,
  };
}


