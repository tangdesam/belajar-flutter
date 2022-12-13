part of 'news_search_bloc.dart';

abstract class NewsSearchState extends Equatable {
  const NewsSearchState();

  @override
  List<Object> get props {
    return [];
  }
}

class NewsSearchInitial extends NewsSearchState { }

class NewsSearchEmpty extends NewsSearchState {
  final String message;

  NewsSearchEmpty(this.message);
}

class NewsSearchError extends NewsSearchState {
  final String message;
  final Function? retry;

  NewsSearchError(this.message, {this.retry});

  @override
  List<Object> get props {
    return [message, retry!=null];
  }
}

class NewsSearchHasData extends NewsSearchState {
  final ArticleResults data;

  NewsSearchHasData(this.data);

  @override
  List<Object> get props => [data];
}