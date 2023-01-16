import 'package:get_it/get_it.dart';
import 'package:tech_test_elabram/data/datasources/news_remote_data_source.dart';
import 'package:tech_test_elabram/domain/repositories/news_repository.dart';
import 'package:tech_test_elabram/presentation/bloc/news_bloc.dart';

import 'data/repositories/news_repository_impl.dart';
import 'domain/usecases/get_list_news.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // Blocs
  locator.registerFactory(() => NewsBloc(locator()));

  // Use cases
  locator.registerLazySingleton(() => GetListNews(locator()));

  // Repository
  locator.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // Data sources
  locator.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(client: locator()),
  );

  // Others
  locator.registerLazySingleton(() => http.Client());
}
