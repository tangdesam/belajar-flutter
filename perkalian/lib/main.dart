import 'dart:math';

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
      title: 'Latihan Perkalian',
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
      home: Perkalian(),
    );
  }
}

int random10() {
  return 2 + Random().nextInt(8);
}

class Perkalian extends StatefulWidget {
  Perkalian({Key? key}) : super(key: key);

  int a = random10();
  int b = random10();
  String strHasil = '';

  @override
  State<Perkalian> createState() => _PerkalianState();
}

class _PerkalianState extends State<Perkalian> {
  final txtJawabanController = TextEditingController();
  // IconHasil iconHasil = IconHasil();



  @override
  void dispose() {
    txtJawabanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Perkalian'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Text(widget.a.toString()),
                Text('X'),
                Text(widget.b.toString()),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(labelText: 'Jawaban'),
                keyboardType: TextInputType.number,
                controller: txtJawabanController,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      int c = widget.a * widget.b;
                      int jawaban = int.parse(txtJawabanController.text);
                      if (jawaban == c) {
                        widget.strHasil = 'CORRECT';
                      }
                      else {
                        widget.strHasil = 'WRONG';
                      }

                      txtJawabanController.text = '';
                      widget.a = random10();
                      widget.b = random10();
                    });
                  },
                  child: Text('Jawab')),
            ),
            Center(
              widthFactor: double.infinity,
              child: Row(
                children: [
                  widget.strHasil != '' ? (widget.strHasil == 'CORRECT' ? Icon(Icons.done, color: Colors.green,) : Icon(Icons.close, color: Colors.red,)) : Text(''),
                  Text(widget.strHasil),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
