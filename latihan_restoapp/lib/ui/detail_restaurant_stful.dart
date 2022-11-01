import 'package:flutter/material.dart';
import 'package:latihan_restoapp/data/api/api_service.dart';
import 'package:latihan_restoapp/data/model/detail_restaurant.dart';
import 'package:latihan_restoapp/provider/detail_restaurant_provider.dart';
import 'package:latihan_restoapp/ui/detail_restaurant_page.dart';
import 'package:provider/provider.dart';

class DetailRestaurantStful extends StatefulWidget {
  static final routeName = 'detail_restaurant_stful';
  final String restaurantId;
  const DetailRestaurantStful({Key? key, required this.restaurantId}) : super(key: key);

  @override
  State<DetailRestaurantStful> createState() => _DetailRestaurantStfulState();
}

class _DetailRestaurantStfulState extends State<DetailRestaurantStful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<DetailRestaurantProvider>(
        create: (_) => DetailRestaurantProvider(apiService: ApiService(), restaurantId: widget.restaurantId),
        child: DetailRestaurantPage(),
      ),
    );
  }
}
