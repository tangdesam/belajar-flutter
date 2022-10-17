import 'dart:convert';
import 'package:appresto/detail_restaurant.dart';
import 'package:appresto/model/restaurants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: ResturantListPage(),
      initialRoute: ResturantListPage.routeName,
      routes: {
        ResturantListPage.routeName: (context) => ResturantListPage(),
        DetailRestaurantPage.routeName: (context) => DetailRestaurantPage(
          resto: ModalRoute.of(context)?.settings.arguments as Restaurants
        ),
        DoneRestaurantListPage.routeName: (context) => DoneRestaurantListPage(
          doneRestaurantList: ModalRoute.of(context)?.settings.arguments as List<Restaurants>
        ),
      },
    );
  }
}

class ResturantListPage extends StatefulWidget {
  static const routeName = '/restaurant_list';

  const ResturantListPage({Key? key}) : super(key: key);

  @override
  State<ResturantListPage> createState() => _ResturantListPageState();
}

class _ResturantListPageState extends State<ResturantListPage> {
  final List<Restaurants> doneRestaurantsList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resturant App'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, DoneRestaurantListPage.routeName, arguments: doneRestaurantsList);
              },
              icon: Icon(Icons.done)
          ),
        ],
      ),
      body: RestaurantList(doneRestaurantsList: doneRestaurantsList,),
    );
  }


}


class RestaurantList extends StatefulWidget {
  final List<Restaurants> doneRestaurantsList;

  const RestaurantList({Key? key, required this.doneRestaurantsList}) : super(key: key);

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  // final List<Restaurants> _doneRestaurants = const [];
  // List<Restaurants> _doneRestaurants ;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String> (
      future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        final List<Restaurants> restaurants = parseRestaurants(snapshot.data);
        return ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            // return _buildRestaurantItem(context, restaurants[index]);

            return RestaurantItem(resto: restaurants[index],
              isDone: widget.doneRestaurantsList.contains(restaurants[index]),
              onClick: () {
                setState(() {
                  widget.doneRestaurantsList.add(restaurants[index]);
                });
              },
            );
          },
        );
      },
    );
  }


}



class RestaurantItem extends StatelessWidget {
  final Restaurants resto;
  final bool isDone;
  final Function() onClick;

  // const RestaurantItem({Key? key, required this.resto}) : super(key: key);
  const RestaurantItem({Key? key, required this.resto, required this.isDone, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return _buildRestaurantItem(context, resto);
    return Material(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Image.network(resto.pictureId, width: 100,),
        title: Text(resto.name),
        // subtitle: Text(resto.description),
        subtitle: Column(
          children: [
            Row(
              children: [
                Icon(Icons.add_location),
                Text(resto.city),
              ],
            ),
            Row(
              children: [
                Icon(Icons.star),
                Text(resto.rating.toString()),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, DetailRestaurantPage.routeName, arguments: resto);
        },
        trailing: isDone ? Icon(Icons.done) : ElevatedButton(
          onPressed: onClick,
          child: Text('visited'),
        ),
      ),
    );
  }
}


List<Restaurants> parseRestaurants(String? data) {
  if (data == null){
    return[];
  }
  final List parsed = jsonDecode(data)["restaurants"]; // jsonDecode dari dart:convert
  return parsed.map((json) => Restaurants.fromJson(json)).toList();
}

Widget _buildRestaurantItem(BuildContext context, Restaurants resto) {
  return Material (
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(
        resto.pictureId,
        width: 100,
      ),
      title: Text(resto.name),
      subtitle: Column(
        children: [
          Row(
            children: [
              Icon(Icons.add_location),
              Text(resto.city),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star),
              Text(resto.rating.toString()),
            ],
          ),
        ],
      ),
      trailing: ElevatedButton(
        child: Text("Done"),
        onPressed: (){

        },
      ),
      onTap: () {
        Navigator.pushNamed(context, DetailRestaurantPage.routeName,arguments: resto);
      },
    ),
  );
}

class DoneRestaurantListPage extends StatelessWidget {
  static final routeName = '/visited_restaurant';
  final List<Restaurants> doneRestaurantList;
  const DoneRestaurantListPage({Key? key, required this.doneRestaurantList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visisted Restaurant'),
      ),
      body: ListView.builder(
        itemCount: doneRestaurantList.length,
        itemBuilder: (context, index) {
          return _buildRestaurantItem(context, doneRestaurantList[index]);
        },
      ),
    );
  }
}




