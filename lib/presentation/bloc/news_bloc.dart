import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:tech_test_elabram/domain/entities/news.dart';
import 'package:tech_test_elabram/domain/usecases/get_list_news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetListNews _getListNews;

  NewsBloc(this._getListNews) : super(NewsEmpty()) {
    on<NewsGetList>((event, emit) async {
      emit(NewsLoading());
      final result = await _getListNews.execute();
      result.fold(
        (failure) => emit(NewsError(message: failure.message)),
        (news) => emit(NewsHasData(news: news)),
      );
    });
  }
}
