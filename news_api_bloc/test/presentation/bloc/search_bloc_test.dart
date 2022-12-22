import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_api/commons/failure.dart';
import 'package:news_api/data/models/article.dart';
import 'package:news_api/data/models/article_results.dart';
import 'package:news_api/data/models/source.dart';
import 'package:news_api/domain/usecases/search_news.dart';
import 'package:news_api/presentation/bloc/news_search/news_search_bloc.dart';

import 'search_bloc_test.mocks.dart';

@GenerateMocks([SearchNews])
void main() {
  late MockSearchNews mockSearchNews;
  late NewsSearchBloc newsSearchBloc;
  setUp(
    () {
      mockSearchNews = MockSearchNews();
      newsSearchBloc = NewsSearchBloc(mockSearchNews);
    },
  );

  final tArticle = <Article>[
    Article(
        source: Source(id: null, name: "Detik.com"),
        author: "Agus Tri Haryanto",
        title:
            "Layanan IndiHome dan Telkomsel Alami Gangguan, Ini Jawaban Telkom - detikInet",
        description:
            "Para pengguna IndiHome dan Telkomsel teriak alami gangguan pada Rabu (21/12/2022) dan mereka kemudian berkeluh kesah di lini masa.",
        url:
            "https://inet.detik.com/telecommunication/d-6474396/layanan-indihome-dan-telkomsel-alami-gangguan-ini-jawaban-telkom",
        urlToImage:
            "https://awsimages.detik.net.id/api/wm/2022/11/10/indihome_169.png?wid=54&w=650&v=1&t=jpeg",
        publishedAt: DateTime.parse("2022-12-21T15:40:14Z"),
        content:
            "Jakarta - Sebagian pengguna IndiHome dan Telkomsel teriak alami gangguan pada Rabu (21/12/2022). Mereka kemudian berkeluh kesah di linimasa.\r\nAda netizen yang membagikan tangkapan layar di layanan pe… [+1426 chars]")
  ];

  final tArticleResults =
      ArticleResults(status: "ok", totalResults: 30, articles: tArticle);

  test(
    'Should be a subclass of ArticleResults.entity',
    () {
      // final result = tArticle;
      final result = tArticleResults.toEntity();
      expect(result, tArticleResults);
    },
  );

  test(
    'Should be initial state',
    () {
      expect(newsSearchBloc.state, NewsSearchInitial());
    },
  );

  final tNewsModel = tArticleResults;
  final tQuery = "tesla";
  blocTest(
    'Should emit [Loading, Has Data] if successful',
    build: () {
      when(mockSearchNews.execute(tQuery)).thenAnswer(
        (realInvocation) async {
          return Right(tNewsModel);
        },
      );
      return newsSearchBloc;
    },
    act: (NewsSearchBloc bloc) {
      bloc.add(OnQueryNewsChanged(tQuery));
    },
    wait: const Duration(milliseconds: 500),
    expect: () {
      return [NewsSearchLoading(), NewsSearchHasData(tNewsModel)];
    },
    verify: (NewsSearchBloc bloc) {
      verify(mockSearchNews.execute(tQuery));
    },
  );

  blocTest(
    'Should emit [Initial] when query is empty',
    build: () {
      return newsSearchBloc;
    },
    act: (NewsSearchBloc bloc) {
      return bloc.add(OnQueryNewsChanged(''));
    },
    wait: const Duration(milliseconds: 500),
    expect: () {
      return [NewsSearchInitial()];
    },
  );

  blocTest(
    'Should emit [Loading, Empty] if data unavailable',
    build: () {
      when(mockSearchNews.execute(tQuery)).thenAnswer(
            (realInvocation) async {
          return Right(ArticleResults(status: "", totalResults: 0, articles: []));
        },
      );
      return newsSearchBloc;
    },
    act: (NewsSearchBloc bloc) {
      return bloc.add(OnQueryNewsChanged(tQuery));
    },
    wait: const Duration(milliseconds: 500),
    expect: () {
      return [NewsSearchLoading(), NewsSearchEmpty('Memang kosong')];
    },
  );

  blocTest(
    'Should emit [Loading, Error] when error',
    build: () {
      when(mockSearchNews.execute(tQuery)).thenAnswer(
            (realInvocation) async {
          return Left(ServerFailure());
        },
      );
      return newsSearchBloc;
    },
    act: (NewsSearchBloc bloc) {
      bloc.add(OnQueryNewsChanged(tQuery));
    },
    wait: const Duration(milliseconds: 500),
    expect: () {
      return [NewsSearchLoading(), NewsSearchError("Server Failure", retry: (){})];
    },
    verify: (NewsSearchBloc bloc) {
      verify(mockSearchNews.execute(tQuery));
    },
  );

}
