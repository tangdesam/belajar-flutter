import 'package:flutter/material.dart';
import 'package:latihan_restoapp/data/model/detail_restaurant.dart';
import 'package:latihan_restoapp/data/model/restaurant.dart';
import 'package:latihan_restoapp/provider/detail_restaurant_provider.dart';
import 'package:latihan_restoapp/provider/list_restaurants_provider.dart';
import 'package:provider/provider.dart';

class DetailRestaurantPage extends StatelessWidget {
  const DetailRestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Restaurant'),
      ),
      body: Center(
        // child: Text('Detail '),
        child: _buildDetail(),
      ),
    );
  }

  Widget _buildDetail() {
    return Consumer<DetailRestaurantProvider>(
      builder: (context, value, child) {
        if (value.resultState == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (value.resultState == ResultState.hasData) {
          DetailRestaurant restaurant = value.detailRestaurantResult.restaurant;
          return SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    restaurant.name,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.network(
                  Restaurant.prefixImageUrl('large') + '/' + restaurant.pictureId,
                ),
                Center(
                  child: Text(value.detailRestaurantResult.restaurant.city),
                ),
                Text('Food',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.detailRestaurantResult.restaurant.menus.foods.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(value.detailRestaurantResult.restaurant.menus.foods[index].name!),
                    );
                  },
                ),
              ],
            ),
          );
        }
        else if (value.resultState == ResultState.noData) {
          return const Center(child: Text('No data found'),);
        }
        else if (value.resultState == ResultState.error) {
          print('Error occured, ' + value.errorMessage);
          return const Center(child: Text('Error occured'),);
        }
        else {
          return const Center(child: Text('Unknown status'),);
        }

      },
    );
  }
}

