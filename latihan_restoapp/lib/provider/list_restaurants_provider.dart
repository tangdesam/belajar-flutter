import 'package:flutter/material.dart';
import 'package:latihan_restoapp/data/api/api_service.dart';
import 'package:latihan_restoapp/data/model/list_restaurants_result.dart';

class ListRestaurantsProvider extends ChangeNotifier {
  final ApiService apiService;

  ListRestaurantsProvider({required this.apiService}) {
    _fetchListRestaurants();
  }

  late ListRestaurantsResult _listRestaurantsResult;
  late ResultState _state;
  String _errorMessage = '';


  ListRestaurantsResult get listRestaurantsResult => _listRestaurantsResult;

  Future<dynamic> _fetchListRestaurants() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final listRestaurantsResult = await apiService.listRestaurants();
      if (listRestaurantsResult.error) {
        _state = ResultState.error;
        notifyListeners();
        return _errorMessage = 'Error from API server ---> ${listRestaurantsResult.message}';
      }
      if (listRestaurantsResult.restaurants.isEmpty) {
        // mungkin bisa juga cek dari listRestaurantsResult.count
        _state = ResultState.noData;
        notifyListeners();
        return _errorMessage = 'Empty Data';
      }
      else {
        _state = ResultState.hasData;
        notifyListeners();
        return _listRestaurantsResult = listRestaurantsResult;
      }

    } catch(e) {
      _state = ResultState.error;
      notifyListeners();
      return _errorMessage = 'Error ---> $e';
    }
  }

  ResultState get state => _state;

  String get errorMessage => _errorMessage;
}

enum ResultState {
  loading, noData, hasData, error;
}