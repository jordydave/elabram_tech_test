import 'package:equatable/equatable.dart';
import 'package:tech_test_elabram/data/models/news_model.dart';

class NewsResponse extends Equatable {
  final List<NewsModel> news;

  const NewsResponse({required this.news});

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        news: List<NewsModel>.from(
          json['articles'].map(
            (x) => NewsModel.fromJson(x),
          ),
        ),
      );

  @override
  List<Object?> get props => [news];
}
