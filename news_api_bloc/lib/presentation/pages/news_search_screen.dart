import 'package:flutter/material.dart';
import 'package:news_api/presentation/bloc/news_search/news_search_bloc.dart';
import 'package:news_api/presentation/pages/news_search_list_page.dart';
import 'package:provider/provider.dart';

class NewsSearchScreen extends StatefulWidget {
  static const routeName = '/article_search_list';
  const NewsSearchScreen({Key? key}) : super(key: key);

  @override
  State<NewsSearchScreen> createState() => _NewsSearchScreenState();
}

class _NewsSearchScreenState extends State<NewsSearchScreen> {
  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Search Screen')
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (query) {
                context.read<NewsSearchBloc>().add(OnQueryNewsChanged(query));
              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16,),
            const Text('Search Result'),
            NewsSearchListPage(),
          ],
        ),
      ),
    );
  }
}
