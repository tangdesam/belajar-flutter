import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:news_api/data/models/article_results.dart';
import 'package:news_api/domain/usecases/search_news.dart';

part 'news_search_event.dart';
part 'news_search_state.dart';

class NewsSearchBloc extends Bloc<NewsSearchEvent, NewsSearchState> {
  NewsSearchBloc(super.initialState);

  // TODO: masih error
  // NewsSearchBloc(SearchNews searchNews);
}