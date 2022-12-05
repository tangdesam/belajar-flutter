import 'dart:convert';

import 'package:news_api/commons/constants.dart';
import 'package:news_api/data/models/article_results.dart';
import 'package:http/http.dart' as http;

abstract class NewsRemoteDataSource {
  Future<ArticleResults> searchNews(String date, String query);
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final http.Client client;

  NewsRemoteDataSourceImpl({required this.client});

  // @override
  // Future<List<ArticleResults>> searchNews(String date, String query) {
  //   // TODO: implement searchNews
  //   throw UnimplementedError();
  // }

  @override
  Future<ArticleResults> searchNews(String query, String date) async {
    // https://newsapi.org/v2/everything?q=tesla&from=2022-09-19&sortBy=publishedAt&apiKey=APIKEY
    final response = await http.get(Uri.parse("${BASE_URL}/everything?q=${query}&from=${date}&apiKey=${API_KEY}"));
    // if (response.statusCode == HttpStatus.ok) {
    if (response.statusCode == 200) {
      return ArticleResults.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load data from NewsAPI');
    }
  }

}