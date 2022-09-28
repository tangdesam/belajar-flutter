import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meet3/model/game_info.dart';

class DetailPage extends StatelessWidget {
  final GameInfo gameInfo;
  const DetailPage({Key? key, required GameInfo this.gameInfo}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // supaya tidak terlalu atas (tempatnya jam, sinyal, dll)
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(gameInfo.banner),
              Container(
                margin: const EdgeInsets.only(top: 16, left: 16),
                child: Text(gameInfo.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DancingScript',
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(height: 8,),
                        Text(gameInfo.releaseDate)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.account_balance),
                        SizedBox(height: 8,),
                        Text(gameInfo.publisher)
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
              SizedBox( // pembungkus untuk fix height
                height: 150,
                child:
                  ListView(
                    scrollDirection: Axis.horizontal,
                    children: gameInfo.imageUrls.map((url) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child:  Image.network(url),
                          ),
                        );
                    }).toList(),
                    // children: [
                    //   Padding(
                    //     padding: const EdgeInsets.all(4.0),
                    //     child: ClipRRect(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       child:  Image.network('https://cdn.vox-cdn.com/thumbor/EBt6HUM8C3Ro4mTRFXR76EI47e4=/0x0:1920x1080/1200x800/filters:focal(252x242:558x548)/cdn.vox-cdn.com/uploads/chorus_image/image/55523673/Game2_Space_ProtossRush_SpectatorPerspective_01.0.jpg'),
                    //     ),
                    //   ),
                    //   Padding(
                    //     padding: const EdgeInsets.all(4.0),
                    //     child: ClipRRect(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       child: Image.network('https://www.gamespot.com/a/uploads/original/123/1239113/3105107-184087-starcraft.png'),
                    //     ),
                    //   ),
                    //   Padding(
                    //     padding: const EdgeInsets.all(4.0),
                    //     child: ClipRRect(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       child: Image.network('https://assets.reedpopcdn.com/starcraft-remastered-out-this-summer-1490599238622.jpg/BROK/thumbnail/1600x900/format/jpg/quality/80/starcraft-remastered-out-this-summer-1490599238622.jpg'),
                    //     ),
                    //   ),
                    // ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}