// Package imports:
import 'package:equatable/equatable.dart';
import 'package:inshorts_assignment_karan/model/news_model.dart';
import 'package:meta/meta.dart';

// Project imports:

abstract class NewsFeedState extends Equatable {}

class NewsFeedInitialState extends NewsFeedState {
  @override
  List<Object> get props => [];
}

class NewsFeedLoadingState extends NewsFeedState {
  @override
  List<Object> get props => [];
}

class NewsFeedLoadedState extends NewsFeedState {
  final List<Articles>? news;
  NewsFeedLoadedState({required this.news});
  get moviesList => news;

  @override
  List<Object> get props => [news!];
}

class NewsFeedErrorState extends NewsFeedState {
  final String message;
  NewsFeedErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
