import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/data/models/article.dart';
import 'package:news_api/presentation/bloc/news_search/news_search_bloc.dart';
import 'package:news_api/presentation/widgets/news_detail.dart';

class NewsSearchListPage extends StatelessWidget {
  const NewsSearchListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    return BlocBuilder<NewsSearchBloc, NewsSearchState>(
      builder: (context, state) {
        if (state is NewsSearchLoading) {
          return const Center(child: CircularProgressIndicator(),);
        }
        else if (state is NewsSearchHasData) {
          final result = state.data;
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: result.articles.length,
              itemBuilder: (context, index) {
                return _buildArticleItem(context, result.articles[index]);
              },
            ),
          );
        }
        else if (state is NewsSearchError) {
          return Center(
            child: state.retry == null ? Material(
              child: Text(state.message),
            ) : Material(
              child: Text("${state.message} retry: ${state.retry}"),
            ),
          );
        }
        else if (state is NewsSearchEmpty) {
          return Center(
            child: Text(state.message),
          );
        }
        else {
          print(">>> State tidak diketahui (unspecified state), state.toString(): " + state.toString());
          return const Center(
            child: Text('State tidak diketahui (unspecified state)'),
          );
        }
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
