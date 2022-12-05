import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:news_api/commons/failure.dart';
import 'package:news_api/data/models/article_results.dart';
import 'package:news_api/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRepositoryImpl remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ArticleResults>> searchNews(String date, String query) {
    try {
      final result = await remoteDataSource.searchNews(date, query);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ConnectionFailure());
    }

  }

}