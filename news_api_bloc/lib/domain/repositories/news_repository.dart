import 'package:dartz/dartz.dart';
import 'package:news_api/commons/failure.dart';
import 'package:news_api/data/models/article_results.dart';

abstract class NewsRepository {
  Future<Either<Failure, ArticleResults>> searchNews(String date, String query);
}