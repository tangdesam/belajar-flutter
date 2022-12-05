import 'package:flutter/material.dart';
import 'package:news_api/data/api/apiservice.dart';
import 'package:news_api/data/models/article_results.dart';

class NewsProvider extends ChangeNotifier{
  final ApiService apiService;
  final String country;
  final String category;

  String _message='';

  NewsProvider({required this.apiService, required this.country, required this.category}) {
    _fetchTopHeadlines();
  }
  late ArticleResults _articleResults;
  late ResultState _state;

  String get message => _message;
  ArticleResults get result => _articleResults;
  ResultState get state => _state;

  Future<dynamic> _fetchTopHeadlines() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final article = await apiService.topHeadlines(country, category);
      if (article.articles.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      }
      else {
        _state = ResultState.hasData;
        notifyListeners();
        return _articleResults = article;
      }
    }
    catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error ---> $e';
    }
  }
}

enum ResultState {
  loading, noData, hasData, error;
}