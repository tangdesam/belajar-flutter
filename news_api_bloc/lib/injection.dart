import 'package:get_it/get_it.dart';
import 'package:news_api/data/datasources/news_remote_data_source.dart';
import 'package:news_api/data/repositories/news_repository_impl.dart';
import 'package:news_api/domain/repositories/news_repository.dart';
import 'package:news_api/domain/usecases/search_news.dart';
import 'package:news_api/presentation/bloc/news_search/news_search_bloc.dart';

final locator = GetIt.instance;

void init() {
  // daftarkan satu per satu bloc nya
  locator.registerFactory(() => NewsSearchBloc(locator()));

  // yang ada difolder usecase didaftarkan sebagai singleton
  locator.registerLazySingleton(() => SearchNews(locator()));

  locator.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(remoteDataSource: locator()));
  // locator.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSourceImpl());

}