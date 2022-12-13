import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:news_api/domain/repositories/news_repository.dart';
import 'package:news_api/data/models/article_results.dart';
import 'package:news_api/commons/failure.dart';

class SearchNews {
  final NewsRepository repository;

  SearchNews(this.repository);

  Future<Either<Failure, ArticleResults>> execute(String query) {
    DateTime now = new DateTime.now();
    // DateTime date = new DateTime(now.year, now.month, now.day);
    return repository.searchNews(new DateFormat('yyyy-MM-dd').format(now), query);
  }
}