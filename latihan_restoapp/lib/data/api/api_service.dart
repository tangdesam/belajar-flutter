import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:latihan_restoapp/data/model/list_restaurants_result.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String url = 'https://restaurant-api.dicoding.dev';

  Future<ListRestaurantsResult> listRestaurants() async {
    String listRestaurantsUrl = "${url}/list";

    final response = await http.get(Uri.parse(listRestaurantsUrl));
    if (response.statusCode == HttpStatus.ok) {
      return ListRestaurantsResult.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load data from API Server');
    }

  }
}