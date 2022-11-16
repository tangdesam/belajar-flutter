import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:latihan_restoapp/data/model/drinks.dart';
import 'package:latihan_restoapp/data/model/foods.dart';

import 'menus.dart';

class Restaurant extends Equatable {
  static final String parentImageUrl = 'https://restaurant-api.dicoding.dev/images';
  static String prefixImageUrl(String size) {
    // available size: small, medium, large
    return parentImageUrl + '/' + size ;
  }

  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late num rating;
  // Menus menus;

  Restaurant(
      {required this.id,
        required this.name,
        required this.description,
        required this.pictureId,
        required this.city,
        required this.rating
        // , required this.menus
      });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id : json['id'] ?? 'null',
    name : json['name'] ?? 'null',
    description : json['description'] ?? 'null',
    pictureId : json['pictureId'] ?? 'null',
    city : json['city'] ?? 'null',
    rating : json['rating'] ?? 0
    // ,menus : json['menus'] != null ? Menus.fromJson(json['menus']) : Menus(drinks: [Drinks(name: '')], foods: [Foods(name: '')]),
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['pictureId'] = this.pictureId;
    data['city'] = this.city;
    data['rating'] = this.rating;
    // if (this.menus != null) {
    //   data['menus'] = this.menus!.toJson();
    // }
    return data;
  }

  // cara 1, tanpa tambahan library
  // @override
  // bool operator == (Object other) {
  //   return other is Restaurant
  //       && this.id == other.id;
  // }

  // cara 2, pakai 'package:equatable/equatable.dart'
  @override
  List<Object?> get props => [id];

  Map<String, dynamic> toMapDatabase() {
    return {
      "id": id,
      "name": name,
      "pictureId": pictureId,
      "city": city,
      "rating": rating,
      "description": description
    };
  }

  Restaurant.fromMapDatabase(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    pictureId = map["pictureId"];
    rating = map["rating"];
    city = map["city"];
    description = map["description"];
  }

}

