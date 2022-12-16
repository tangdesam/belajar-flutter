import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:news_api/data/models/article_results.dart';
import 'package:news_api/domain/usecases/search_news.dart';
import 'package:rxdart/rxdart.dart';

part 'news_search_event.dart';
part 'news_search_state.dart';

class NewsSearchBloc extends Bloc<NewsSearchEvent, NewsSearchState> {
  // NewsSearchBloc(super.initialState);

  NewsSearchBloc(SearchNews searchNews) : super(NewsSearchInitial()){
    on<NewsSearchEvent>((event, emit) async {
      if (event is OnQueryNewsChanged) {
        final query = event.query;
        if (query.isEmpty) {
          emit(NewsSearchInitial());
          return;
        }
        emit(NewsSearchLoading());
        final result = await searchNews.execute(query);
        result.fold((failure) {
          final resultState = NewsSearchError('Server Failure', retry: () {
            add(OnQueryNewsChanged(query));
          });
          emit(resultState);
        },(data) async {
          if (data.articles.isNotEmpty) {
            final resultState = NewsSearchHasData(data);
            emit(resultState);
          }
          else {
            emit(NewsSearchEmpty('No news found $query'));
          }
        });
      }
    }, transformer: debounce(const Duration(milliseconds: 500))); // transformer contohnya untuk nahan supaya waktu ketik ga langsung disend
  }
  EventTransformer<NewsSearchEvent> debounce<NewsSearchEvent> (Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}