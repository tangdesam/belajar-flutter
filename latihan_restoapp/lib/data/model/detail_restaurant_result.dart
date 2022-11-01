import 'package:latihan_restoapp/data/model/detail_restaurant.dart';

class DetailRestaurantResult {
  bool error;
  String message;
  DetailRestaurant restaurant;

  DetailRestaurantResult({required this.error, required this.message, required this.restaurant});

  factory DetailRestaurantResult.fromJson(Map<String, dynamic> json) => DetailRestaurantResult(
    error: json["error"],
    message: json["message"],
    restaurant: DetailRestaurant.fromJson(json['restaurant']),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "restaurant": restaurant,
  };

}