import 'package:flutter/material.dart';
import 'package:news_api/data/model/article.dart';
import 'package:news_api/provider/news_provider.dart';
import 'package:news_api/widgets/news_detail.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News List Page'),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return Consumer<NewsProvider> (
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state.state == ResultState.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.articles.length,
            itemBuilder: (context, index) {
              return _buildArticleItem(context, state.result.articles[index]);
            },
          );
        }
        else if (state.state == ResultState.noData) {
          return const Center(
            child: Text('no data found'),
          );
        }
        else if (state.state == ResultState.error) {
          print('error occured: ' + state.message);
          return const Center(
            child: Text('error occured'),
          );
        }
        return const Center(
          child: Text('default text, biar ga null'),
        );
      },
    );
  }
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
