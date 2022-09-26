import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // supaya tidak terlalu atas (tempatnya jam, sinyal, dll)
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('images/starcraft.jpg'),
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
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
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
              Container(
                margin: const EdgeInsets.only(top: 16, left: 16),
                child: const Text("StarCraft is a military science fiction media franchise created by Chris Metzen and James Phinney and owned by Blizzard Entertainment.[1] The series, set in the beginning of the 26th century, centers on a galactic struggle for dominance among four species—the adaptable and mobile Terrans, the ever-evolving insectoid Zerg, the powerful and enigmatic Protoss, and the godlike Xel'Naga creator race—in a distant part of the Milky Way galaxy known as the Koprulu Sector. The series debuted with the video game StarCraft in 1998. It has grown to include a number of other games as well as eight novelizations, two Amazing Stories articles, a board game, and other licensed merchandise such as collectible statues and toys. ",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Image.network('https://www.gamespot.com/a/uploads/original/123/1239113/3105107-184087-starcraft.png'),

            ],
          ),
        ),

      ),
    );
  }
}