import 'package:flutter/material.dart';
import 'package:meet3/model/article.dart';
import 'package:meet3/news_detail.dart';

class NewsScreen extends StatelessWidget {
  static const routeName = '/article_list';

  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News List'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString(
            'assets/articles.json'),
        builder: (context, snapshot) {
          final List<Article> articles = parseArticles(snapshot.data);
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return _buildArticleItem(context, articles[index]);
            },
          );
        },
      ),
    );
  }
}


Widget _buildArticleItem(BuildContext context, Article articl) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Image.network(articl.urlToImage, width: 100,),
    title: Text(articl.title),
    subtitle: Text(articl.author),
    onTap: () {
      Navigator.pushNamed(context, DetailNewsScreen.routeName, arguments: articl);
    },
  );
}