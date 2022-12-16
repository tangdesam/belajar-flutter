import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/data/models/article.dart';
import 'package:news_api/presentation/bloc/news_search/news_search_bloc.dart';
import 'package:news_api/presentation/pages/more_news.dart';
import 'package:news_api/presentation/pages/news_search_screen.dart';
import 'package:news_api/presentation/widgets/news_detail.dart';
import 'package:news_api/presentation/widgets/news_screen.dart';
import 'package:provider/provider.dart';
import 'injection.dart' as di; // di = dependency injection

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: ((context) => di.locator<NewsSearchBloc>())),
      ],
      child: MaterialApp(
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
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: const Text('News API'),
        //   ),
        // ),

        // initialRoute: NewsScreen.routeName,
        initialRoute: NewsSearchScreen.routeName,

        routes: {
          NewsScreen.routeName: (context)=>const NewsScreen(),
          DetailNewsScreen.routeName: (context) => DetailNewsScreen(
              article: ModalRoute.of(context)?.settings.arguments as Article
          ),
          MoreNewsScreen.routeName: (context) => MoreNewsScreen(
              url: ModalRoute.of(context)?.settings.arguments as String
          ),
          NewsSearchScreen.routeName: (context) => NewsSearchScreen(),
        },
      ),
    );
  }
}

