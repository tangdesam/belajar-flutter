import 'package:flutter/material.dart';
import 'package:latihan_restoapp/data/api/api_service.dart';
import 'package:latihan_restoapp/data/model/restaurant.dart';
import 'package:latihan_restoapp/provider/list_restaurants_provider.dart';
import 'package:provider/provider.dart';

class ListRestaurantsPage extends StatelessWidget {
  static final String routeName = "/list";
  const ListRestaurantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Restaurants'),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return Consumer<ListRestaurantsProvider>(
      builder: ((context, value, child) {
        if (value.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (value.state == ResultState.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: value.listRestaurantsResult.restaurants.length,
            itemBuilder: (context, index) {
              return _buildRestaurantItem(context, value.listRestaurantsResult.restaurants[index]);
            },
          );
        }
        else if (value.state == ResultState.noData) {
          return const Center(child: Text('No data found'),);
        }
        else if (value.state == ResultState.error) {
          print('Error occured, ' + value.errorMessage);
          return const Center(child: Text('Error occured'),);
        }
        else {
          return const Center(child: Text('Unknown status'),);
        }
      }),
    );
  }
}

Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
  return Material(
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(
        restaurant.prefixImageUrl('small') + '/' + restaurant.pictureId,
        width: 100,
      ),
      title: Text(restaurant.name),
      subtitle: Text(restaurant.city),
      onTap: () {
        // Navigator.pushNamed(context, DetailNewsScreen.routeName,
        //     arguments: article);
      },
    ),
  );
}
