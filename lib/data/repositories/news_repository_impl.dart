import 'package:dartz/dartz.dart';
import 'package:tech_test_elabram/domain/entities/news.dart';
import 'package:tech_test_elabram/domain/repositories/news_repository.dart';
import 'package:tech_test_elabram/utils/failure.dart';

import '../../utils/exception.dart';
import '../datasources/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<News>>> getListNews() async {
    try {
      final result = await remoteDataSource.getListNews();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }
}
