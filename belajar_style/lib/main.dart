import 'package:belajar_style/styles.dart';
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
      title: 'Belajar Style',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: primary700,
          onPrimary: Colors.white,
          secondary: secondary500,
          error: Colors.red,
        ),
        textTheme: replyTextTheme,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Belajar Style'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('headline1', style: Theme.of(context).textTheme.headline1,),
            Text('reply-h1', style: replyTextTheme.headline1,),
            Text('reply-h2', style: replyTextTheme.headline2,),
            Text('reply-h3', style: replyTextTheme.headline3,),
            Text('reply-h4', style: replyTextTheme.headline4,),
            Text('reply-h5', style: replyTextTheme.headline5,),
            Text('reply-h6', style: replyTextTheme.headline6,),
            Text('subtitle1', style: Theme.of(context).textTheme.subtitle1,),
            Text('subtitle2', style: Theme.of(context).textTheme.subtitle2,),
            Text('bodyText1', style: Theme.of(context).textTheme.bodyText1,),
            Text('bodyText2', style: Theme.of(context).textTheme.bodyText2,),
            Text('button', style: Theme.of(context).textTheme.button,),
            Text('caption', style: Theme.of(context).textTheme.caption,),
            Text('overline', style: Theme.of(context).textTheme.overline,),
          ],
        ),
      ),
    );
  }
}

