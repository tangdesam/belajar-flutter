// Mocks generated by Mockito 5.3.2 from annotations
// in news_api/test/presentation/bloc/search_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:news_api/commons/failure.dart' as _i6;
import 'package:news_api/data/models/article_results.dart' as _i7;
import 'package:news_api/domain/repositories/news_repository.dart' as _i2;
import 'package:news_api/domain/usecases/search_news.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeNewsRepository_0 extends _i1.SmartFake
    implements _i2.NewsRepository {
  _FakeNewsRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SearchNews].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchNews extends _i1.Mock implements _i4.SearchNews {
  MockSearchNews() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.NewsRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeNewsRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.NewsRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.ArticleResults>> execute(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [query],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, _i7.ArticleResults>>.value(
                _FakeEither_1<_i6.Failure, _i7.ArticleResults>(
          this,
          Invocation.method(
            #execute,
            [query],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.ArticleResults>>);
}
