import 'package:flutter/material.dart';
import 'package:latihan_restoapp/data/model/detail_restaurant.dart';
import 'package:latihan_restoapp/provider/database_provider.dart';
import 'package:latihan_restoapp/ui/detail_restaurant_stful.dart';
import 'package:latihan_restoapp/ui/home_restaurants_page.dart';
import 'package:latihan_restoapp/ui/list_restaurants_page.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DatabaseProvider()),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RestoApp',
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
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // initialRoute: ListRestaurantsPage.routeName,
      initialRoute: HomeRestaurantsPage.routeName,
      routes: {
        HomeRestaurantsPage.routeName: (context) {
          return HomeRestaurantsPage();
        },
        DetailRestaurantStful.routeName: (context) {
          return DetailRestaurantStful(
            restaurantId: ModalRoute.of(context)?.settings.arguments as String
          );
        }
      },
    );
  }
}
