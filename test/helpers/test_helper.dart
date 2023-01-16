import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:tech_test_elabram/data/datasources/news_remote_data_source.dart';
import 'package:tech_test_elabram/domain/repositories/news_repository.dart';

@GenerateMocks([
  NewsRepository,
  NewsRemoteDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
