import 'package:flutter/material.dart';
import 'package:latihan_restoapp/data/model/restaurant.dart';
import 'package:latihan_restoapp/data/utils/database_helper.dart';

class DatabaseProvider extends ChangeNotifier {
  List<Restaurant> _arrRestaurants = [];
  List<Restaurant> get restaurants => _arrRestaurants;
  late DatabaseHelper _dbHelper;

  DatabaseProvider() {
    _dbHelper = DatabaseHelper();
    _getAllVisitedRestaurants();
  }

  void _getAllVisitedRestaurants() async {
    _arrRestaurants = await _dbHelper.getRestaurants();
    notifyListeners();
  }

  Future<void> addVisitedRestaurants(Restaurant restaurant) async {
    await _dbHelper.insertRestaurant(restaurant);
    _getAllVisitedRestaurants();
  }

  Future<bool> isVisited(String restaurantId) async {
    return _dbHelper.isExists(restaurantId);
  }

}