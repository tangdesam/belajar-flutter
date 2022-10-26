import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'menus.dart';

class Restaurant extends Equatable {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  num rating;
  Menus menus;

  Restaurant(
      {required this.id,
        required this.name,
        required this.description,
        required this.pictureId,
        required this.city,
        required this.rating,
        required this.menus});

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id : json['id'],
    name : json['name'],
    description : json['description'],
    pictureId : json['pictureId'],
    city : json['city'],
    rating : json['rating'],
    menus : Menus.fromJson(json['menus'])
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['pictureId'] = this.pictureId;
    data['city'] = this.city;
    data['rating'] = this.rating;
    if (this.menus != null) {
      data['menus'] = this.menus!.toJson();
    }
    return data;
  }

  // cara 1, tanpa tambahan library
  // @override
  // bool operator == (Object other) {
  //   return other is Restaurants
  //       && this.id == other.id;
  // }

  // cara 2, pakai 'package:equatable/equatable.dart'
  @override
  List<Object?> get props => [id];


}

