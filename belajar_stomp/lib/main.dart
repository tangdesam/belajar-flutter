import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Coba Stomp client'),
          actions: [
            ElevatedButton(
              child: const Text('Connect'),
              onPressed: () {

                final stompClient = StompClient(
                  config: StompConfig(
                    url: 'ws://192.168.0.8:8080/chat',
                    onConnect: (StompFrame frame) {
                      print('onconnect...');

                    },
                    beforeConnect: () async {
                      print('waiting to connect...');
                      await Future.delayed(Duration(milliseconds: 200));
                      print('connecting...');
                    },
                    onWebSocketError: (dynamic error) => print(error.toString()),
                    stompConnectHeaders: {'Authorization': 'Bearer yourToken'},
                    webSocketConnectHeaders: {'Authorization': 'Bearer yourToken'},
                  ),
                );
                stompClient.activate();
                print('====== ini kapan? ');
              },
            ),
          ],
        ),
      ),
    );
  }
}

