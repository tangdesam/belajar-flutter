import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet3/model/article.dart';
import 'package:meet3/news_detail.dart';
import 'package:meet3/widgets/platform_widget.dart';

class NewsScreen extends StatelessWidget {
  static const routeName = '/article_list';

  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}

FutureBuilder<String> buildFutureBuilder(BuildContext context) {
  return FutureBuilder<String>(
    future: DefaultAssetBundle.of(context).loadString('assets/articles.json'),
    builder: (context, snapshot) {
      final List<Article> articles = parseArticles(snapshot.data);
      return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return _buildArticleItem(context, articles[index]);
        },
      );
    },
  );
}

Widget _buildAndroid(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: const Text('News List'),
      ),
      body: buildFutureBuilder(context));
}

Widget _buildIos(BuildContext context) {
  return CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('News List'),
      transitionBetweenRoutes: false,
    ),
    child: buildFutureBuilder(context),
  );
}

Widget _buildArticleItem(BuildContext context, Article article) {
  return Material(
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(
        article.urlToImage,
        width: 100,
      ),
      title: Text(article.title),
      subtitle: Text(article.author),
      onTap: () {
        Navigator.pushNamed(context, DetailNewsScreen.routeName,
            arguments: article);
      },
    ),
  );
}
