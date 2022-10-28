import 'package:flutter/material.dart';
import 'package:latihan_restoapp/data/api/api_service.dart';
import 'package:latihan_restoapp/provider/list_restaurants_provider.dart';
import 'package:latihan_restoapp/ui/list_restaurants_page.dart';
import 'package:provider/provider.dart';

class HomeRestaurantsPage extends StatefulWidget {
  static final String routeName = '/home';
  const HomeRestaurantsPage({Key? key}) : super(key: key);

  @override
  State<HomeRestaurantsPage> createState() => _HomeRestaurantsPageState();
}

class _HomeRestaurantsPageState extends State<HomeRestaurantsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<ListRestaurantsProvider>(
        create: (_) => ListRestaurantsProvider(apiService: ApiService()),
        child: ListRestaurantsPage(),
      ),
    );
  }
}
