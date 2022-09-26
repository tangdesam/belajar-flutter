import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // supaya tidak terlalu atas (tempatnya jam, sinyal, dll)
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 16, left: 16),
              child: const Text('StarCraft',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(height: 8,),
                      Text('31-Mar-1998')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.account_balance),
                      SizedBox(height: 8,),
                      Text('Blizzard')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.favorite),
                      SizedBox(height: 8,),
                      Text('2k')
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}