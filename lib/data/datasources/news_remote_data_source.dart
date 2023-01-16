import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech_test_elabram/data/models/news_model.dart';
import 'package:tech_test_elabram/data/models/news_response.dart';
import 'package:tech_test_elabram/utils/constant.dart';
import 'package:tech_test_elabram/utils/exception.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getListNews();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final http.Client client;

  NewsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<NewsModel>> getListNews() async {
    final response = await client.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body)).news;
    } else {
      throw ServerException();
    }
  }
}
