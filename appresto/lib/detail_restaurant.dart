import 'package:appresto/model/restaurants.dart';
import 'package:flutter/material.dart';

class DetailRestaurantPage extends StatelessWidget {
  static const routeName = '/retaurant_detail';
  final Restaurants resto;
  const DetailRestaurantPage({Key? key, required this.resto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resto.name),
      ),
      body: Text(resto.description),
    );
  }
}
