import 'package:flutter/material.dart';
import 'package:match_soccer/detail_page.dart';
import 'package:match_soccer/model/club.dart';
import 'package:match_soccer/model/pertandingan.dart';
import 'list_page.dart';

Club mu = Club(name: 'Manchester United', imgUrl: 'images/manutd.png');
Club arsenal = Club(name: 'Arsenal', imgUrl: 'images/arsenal.png');
Club liverpool = Club(name: 'Liverpool', imgUrl: 'images/liv.png');
Club westham = Club(name: 'West Ham United', imgUrl: 'images/westham.png');
Club mancity = Club(name: 'Manchester City', imgUrl: 'images/mancity.png');
Club watford = Club(name: 'Watford', imgUrl: 'images/watford.png');

var matchList = [
  Pertandingan(home: mu, homeScore: 1, away: westham, awayScore: 0, date: DateTime.parse('2022-01-22')),
  Pertandingan(home: mu, homeScore: 0, away: watford, awayScore: 0, date: DateTime.parse('2022-02-26')),
  Pertandingan(home: mancity, homeScore: 4, away: mu, awayScore: 1, date: DateTime.parse('2022-03-06')),
  Pertandingan(home: arsenal, homeScore: 3, away: mu, awayScore: 1, date: DateTime.parse('2022-04-23')),
  Pertandingan(home: mu, homeScore: 4, away: liverpool, awayScore: 0, date: DateTime.parse('2022-07-12')),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Match Soccer',
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
        primarySwatch: Colors.red,
      ),
      // home: ListPage(),
      initialRoute: ListPage.routeName,
      routes: {
        ListPage.routeName: (context) => ListPage(),

      },
    );

  }
}
