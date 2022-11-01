import 'package:flutter/material.dart';
import 'package:latihan_restoapp/data/model/detail_restaurant.dart';
import 'package:latihan_restoapp/data/model/detail_restaurant_result.dart';
import 'package:latihan_restoapp/provider/list_restaurants_provider.dart';

import '../data/api/api_service.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String restaurantId;

  // DetailRestaurantProvider({required this.apiService});
  DetailRestaurantProvider({required this.apiService, required this.restaurantId}) {
    _fetchDetailRestaurant();
  }

  late DetailRestaurantResult _detailRestaurantResult;

  DetailRestaurantResult get detailRestaurantResult => _detailRestaurantResult;

  late ResultState _resultState;

  ResultState get resultState => _resultState;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<dynamic> _fetchDetailRestaurant() async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      final detailRestaurantResult = await apiService.detailRestaurant(restaurantId);
      if (detailRestaurantResult.error) {
        _resultState = ResultState.error;
        notifyListeners();
        return _errorMessage = 'Error from API server ---> ${detailRestaurantResult.message}';
      }

      if (detailRestaurantResult.restaurant == null) {
        // mungkin bisa juga cek dari listRestaurantsResult.count
        _resultState = ResultState.noData;
        notifyListeners();
        return _errorMessage = 'Empty Data';
      }
      else {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _detailRestaurantResult = detailRestaurantResult;
      }

    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      _errorMessage = 'Error ---> $e';
      return _errorMessage;
    }
  }
}