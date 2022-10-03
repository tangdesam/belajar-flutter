import 'package:flutter/material.dart';
import 'package:meet3/home_screen.dart';
import 'package:meet3/new_screen.dart';

import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Korean Drama App',
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
        // supaya resolusi sesuai dengan dpi device
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: news,
      // home: const DetailPage(),
      // home: HomeScreen(),
      initialRoute: NewsScreen.routeName,
      routes: {
        NewsScreen.routeName: (context)=>const NewsScreen(),
      },
    );
  }
}

