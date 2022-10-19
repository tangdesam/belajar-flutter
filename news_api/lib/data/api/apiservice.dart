import 'dart:convert';

import '../model/article_results.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = "NEWSAPI_KEY";
  static const String url = "https://newsapi.org/v2";
  Future<ArticleResults> topHeadlines(String country, String category) async {
    // https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=APIKEY
    String urlTopHeadlines = "${url}/top-headlines?country=${country}&category=${category}&apiKey=${apiKey}";
    final response = await http.get(Uri.parse(urlTopHeadlines));
    // if (response.statusCode == HttpStatus.ok) {
    if (response.statusCode == 200) {
      return ArticleResults.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load data from NewsAPI');
    }
  }

  Future<ArticleResults> searchHeadlines(String query, String date) async {
    // https://newsapi.org/v2/everything?q=tesla&from=2022-09-19&sortBy=publishedAt&apiKey=APIKEY
    final response = await http.get(Uri.parse("${url}/everything?q=${query}&from=${date}&apiKey=${apiKey}"));
    // if (response.statusCode == HttpStatus.ok) {
    if (response.statusCode == 200) {
      return ArticleResults.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load data from NewsAPI');
    }
  }
}