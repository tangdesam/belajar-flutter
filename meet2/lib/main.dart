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
        // home: const Scaffold(
        //     body: Center(
        //   //child: Judul(tulisan: "Hello world"),
        //   // child: const BiggerText(tulisan: "Hello world"),
        // )),
        home: const FirstScreen());
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white))
        ],
        // leading = menu drawer, garis 3 pojok kiri atas
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      // body: const Center(
      //   child: Text("Hello world"),
      // ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.green, width: 3),
          borderRadius: BorderRadius.circular(10), // buat roundrect
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset:  Offset(3, 6),
              blurRadius: 10,
            )
          ],
        ),
        // color: Colors.blue,
        padding: const EdgeInsets.all(10),
        width: 200,
        height: 100,
        margin: const EdgeInsets.all(10),
        child: Row(
          children: const <Widget>[
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}

class Judul extends StatelessWidget {
  final String tulisan;

  const Judul({Key? key, required this.tulisan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      tulisan,
      style: const TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class BiggerText extends StatefulWidget {
  final String tulisan;

  const BiggerText({Key? key, required this.tulisan}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BiggerTextState();
}

class _BiggerTextState extends State<BiggerText> {
  double _textSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(widget.tulisan, style: TextStyle(fontSize: _textSize)),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _textSize = 32.0;
              });
            },
            child: const Text("perbesar")),
      ],
    );
  }
}
