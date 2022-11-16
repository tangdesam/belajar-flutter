import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:latihan_restoapp/data/model/detail_restaurant.dart';
import 'package:latihan_restoapp/data/model/detail_restaurant_result.dart';
import 'package:latihan_restoapp/data/model/list_restaurants_result.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String url = 'https://restaurant-api.dicoding.dev';

  Future<ListRestaurantsResult> listRestaurants() async {
    String listRestaurantsUrl = "${url}/list";

    final response = await http.get(Uri.parse(listRestaurantsUrl));
    if (response.statusCode == 200) {

      // we don't do that here
          // if (response.statusCode == HttpStatus.ok) {
      // HttpStatus is in dart:html package
      // dart:html is available only to web apps

      return ListRestaurantsResult.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load data from API Server');
    }
  }

  Future<DetailRestaurantResult> detailRestaurant(String restaurantId) async {
    String detailRestaurantUrl = "${url}/detail";

    final response = await http.get(Uri.parse(detailRestaurantUrl + '/$restaurantId'));
    if (response.statusCode == 200) {
      return DetailRestaurantResult.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load data from API Server');
    }

  }

}