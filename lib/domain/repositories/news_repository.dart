import 'package:dartz/dartz.dart';
import 'package:tech_test_elabram/domain/entities/news.dart';

import '../../utils/failure.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<News>>> getListNews();
}
