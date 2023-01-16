import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_test_elabram/domain/entities/news.dart';
import 'package:tech_test_elabram/domain/usecases/get_list_news.dart';
import 'package:tech_test_elabram/presentation/bloc/news_bloc.dart';
import 'package:tech_test_elabram/utils/failure.dart';

import 'news_test.mocks.dart';

@GenerateMocks([GetListNews])
void main() {
  late NewsBloc newsBloc;
  late MockGetListNews mockGetListNews;

  setUp(() {
    mockGetListNews = MockGetListNews();
    newsBloc = NewsBloc(mockGetListNews);
  });

  const tNewsModel = News(
    author: 'author',
    title: 'title',
    description: 'description',
    url: 'url',
    urlToImage: 'urlToImage',
    publishedAt: 'publishedAt',
    content: 'content',
  );
  final tNewsModelList = <News>[tNewsModel];

  test('initial state should be empty', () {
    expect(newsBloc.state, equals(NewsEmpty()));
  });
  blocTest<NewsBloc, NewsState>(
    'Should emit [Loading, HasData] when List News is gotten successfully',
    build: () {
      when(mockGetListNews.execute())
          .thenAnswer((_) async => Right(tNewsModelList));
      return newsBloc;
    },
    act: (bloc) => bloc.add(NewsGetList()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      NewsLoading(),
      NewsHasData(news: tNewsModelList),
    ],
    verify: (bloc) {
      verify(mockGetListNews.execute());
    },
  );

  blocTest<NewsBloc, NewsState>(
    'Should emit [Loading, Error] when List News is unsuccessfull.',
    build: () {
      when(mockGetListNews.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return newsBloc;
    },
    act: (bloc) => bloc.add(NewsGetList()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      NewsLoading(),
      const NewsError(message: 'Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetListNews.execute());
    },
  );
}
