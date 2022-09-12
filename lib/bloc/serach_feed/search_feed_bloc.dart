// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:inshorts_assignment_karan/model/news_model.dart';
import 'package:inshorts_assignment_karan/services/news/news_service.dart';

// Project imports:
import 'search_feed_event.dart';
import 'search_feed_state.dart';

class SearchFeedBloc extends Bloc<SearchFeedEvent, SearchFeedState> {
  NewsFeedRepository repository;

  SearchFeedBloc({required this.repository}) : super(SearchFeedInitialState()) {
    on<FetchNewsBySearchQueryEvent>(event, emit) async {
      emit(SearchFeedLoadingState());
      try {
        List<Articles> news =
            await repository.getNewsBySearchQuery(event.query);
        emit(SearchFeedLoadedState(news: news));
      } catch (e) {
        emit(SearchFeedErrorState(message: e.toString()));
      }
    }
  }
}
