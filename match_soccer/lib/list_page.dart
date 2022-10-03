import 'package:flutter/material.dart';
import 'package:match_soccer/detail_page.dart';
import 'package:match_soccer/main.dart';
import 'package:match_soccer/model/pertandingan.dart';

class ListPage extends StatelessWidget {
  static const routeName = '/list_page';
  ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Match Soccer',
          style: TextStyle(
              fontFamily: 'SirinStencil',
              fontSize: 32.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          Pertandingan currMatch = matchList[index];
          // return Text(currMatch.home.name + ' Vs ' + currMatch.away.name);
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(
                  currMatch: currMatch,
                );
              }));
            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(currMatch.home.imgUrl),
                        Image.asset(currMatch.away.imgUrl),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(currMatch.home.name),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(currMatch.away.name),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(currMatch.homeScore.toString()),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(currMatch.awayScore.toString()),
                        ),
                      ],
                    ),
                    // Icon(Icons.favorite_border, color: Colors.red),
                    const TombolLove(),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: matchList.length,
      ),
    );
  }
}

class TombolLove extends StatefulWidget {
  const TombolLove({Key? key}) : super(key: key);

  @override
  State<TombolLove> createState() => _TombolLoveState();
}

class _TombolLoveState extends State<TombolLove> {
  bool isLoved = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(this.isLoved ? Icons.favorite : Icons.favorite_outline),
      color: Colors.red,
      onPressed: () {
        setState(() {
          this.isLoved = !this.isLoved;
        });
      },
    );
  }
}
