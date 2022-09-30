import 'package:flutter/material.dart';
import 'package:match_soccer/main.dart';
import 'package:match_soccer/model/pertandingan.dart';

class DetailPage extends StatelessWidget {
  Pertandingan currMatch;
  DetailPage({Key? key, required Pertandingan this.currMatch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match Detail', style: TextStyle(
            fontFamily: 'SirinStencil',
            fontSize: 32.0,
            fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(currMatch.home.imgUrl),
                Text(currMatch.home.name),
                Text(currMatch.homeScore.toString() + '-' + currMatch.awayScore.toString()),
                Image.asset(currMatch.away.imgUrl),
                Text(currMatch.away.name),
              ],
            ),
            Image.asset(currMatch.imgLineup)
          ],
        ),
      ),
    );
  }


}