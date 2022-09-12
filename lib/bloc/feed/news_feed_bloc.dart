// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:inshorts_assignment_karan/bloc/feed/news_feed_event.dart';
import 'package:inshorts_assignment_karan/bloc/feed/news_feed_state.dart';
import 'package:inshorts_assignment_karan/model/news_model.dart';
import 'package:inshorts_assignment_karan/services/news/news_service.dart';

class NewsFeedBloc extends Bloc<NewsFeedEvent, NewsFeedState> {
  NewsFeedRepository repository;

  NewsFeedBloc({required this.repository}) : super(NewsFeedInitialState()) {
    on<FetchNewsByCategoryEvent>((event, emit) async {
      // emit(NewsFeedLoadingState());
      List<Articles> news =
      await repository.getNewsByCategory(event.category);
      emit(NewsFeedLoadedState(news: news));
      // try {
      //   List<Articles> news =
      //       await repository.getNewsByCategory(event.category);
      //   emit(NewsFeedLoadedState(news: news));
      // } catch (e) {
      //   emit(NewsFeedErrorState(message: e.toString()));
      // }
    });
    on<FetchNewsByTopicEvent>((event, emit) async {
      emit(NewsFeedLoadingState());
      try {
        List<Articles> news = await repository.getNewsByTopic(event.topic);
        emit(NewsFeedLoadedState(news: news));
      } catch (e) {
        emit(NewsFeedErrorState(message: e.toString()));
      }
    });
    on<FetchNewsFromLocalStorageEvent>((event, emit) async {
      emit(NewsFeedLoadingState());
      try {
        List<Articles> news = repository.getNewsFromLocalStorage(event.box);
        emit(NewsFeedLoadedState(news: news));
      } catch (e) {
        emit(NewsFeedErrorState(message: e.toString()));
      }
    });
  }
}
