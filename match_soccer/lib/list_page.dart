import 'package:flutter/material.dart';
import 'package:match_soccer/main.dart';



class ListPage extends StatelessWidget {
  ListPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Soccer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('images/manutd.png'),
            Image.asset('images/liv.png'),
            Image.asset('images/arsenal.png'),
          ],
        ),
      ),
    );
  }
}
