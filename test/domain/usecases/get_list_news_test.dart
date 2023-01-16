import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_test_elabram/domain/entities/news.dart';
import 'package:tech_test_elabram/domain/usecases/get_list_news.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetListNews usecase;
  late MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    usecase = GetListNews(mockNewsRepository);
  });

  final tNews = <News>[];

  test('should get list of news from the repository', () async {
    // arrange
    when(mockNewsRepository.getListNews())
        .thenAnswer((_) async => Right(tNews));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tNews));
  });
}
