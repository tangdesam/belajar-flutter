
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(resto.description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            Divider(color: Colors.grey,),
            Container(
              width: 1000,
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: resto.menus.foods.length,
                itemBuilder: (BuildContext context, int index) => Padding(padding: EdgeInsets.all(8.0),
                  child: Card(
                    child: Center(
                      child: Text(resto.menus.foods[index].name.toString()),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
