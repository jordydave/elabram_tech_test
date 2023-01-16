import 'package:dartz/dartz.dart';
import 'package:tech_test_elabram/domain/entities/news.dart';
import 'package:tech_test_elabram/utils/failure.dart';

import '../repositories/news_repository.dart';

class GetListNews {
  final NewsRepository repository;

  GetListNews(this.repository);

  Future<Either<Failure, List<News>>> execute() {
    return repository.getListNews();
  }
}
