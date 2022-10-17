import 'dart:convert';
import 'dart:io';

import '../model/article_results.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = "1f9fcbce53437a9fd719403f8e0f4e";
  static const String url = "https://newsapi.org/v2/";
  Future<ArticleResults> topHeadlines(String country, String category) async {
    https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=APIKEY
    final response = await http.get(Uri.parse("${url}top-headlines?country=${country}&category=${category}&apiKey=${apiKey}"));
    // if (response.statusCode == HttpStatus.ok) {
    if (response.statusCode == 200) {
      return ArticleResults.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load data from NewsAPI');
    }
  }
}