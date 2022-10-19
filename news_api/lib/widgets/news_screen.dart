import 'package:flutter/material.dart';
import 'package:news_api/data/api/apiservice.dart';
import 'package:news_api/provider/news_provider.dart';
import 'package:provider/provider.dart';

import 'news_list_page.dart';

class NewsScreen extends StatefulWidget {
  static const routeName = '/article_list';
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<NewsProvider>(
        create: (_) => NewsProvider(apiService: ApiService(), category: 'business', country: 'id'),
        child: const NewsListPage(),
      ),
    );
  }
}

