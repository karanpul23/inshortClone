// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:inshorts_assignment_karan/controller/provider.dart';
import 'package:inshorts_assignment_karan/model/news_model.dart';
import 'package:inshorts_assignment_karan/services/news/offline_service.dart';
import 'package:inshorts_assignment_karan/singletons/NewsSingleton.dart';
import 'package:provider/provider.dart';

abstract class NewsFeedRepository {
  Future<List<Articles>> getNewsByTopic(String topic);

  Future<List<Articles>> getNewsByCategory(String category);

  Future<List<Articles>> getNewsBySearchQuery(String query);

  List<Articles> getNewsFromLocalStorage(String box);
}

class NewsFeedRepositoryImpl implements NewsFeedRepository {
  final BuildContext context;

  NewsFeedRepositoryImpl(this.context);

  @override
  Future<List<Articles>> getNewsByTopic(String topic) async {
    final provider = Provider.of<FeedProvider>(context, listen: false);
    NewsSingleton().generalNews;
    provider.setDataLoaded(false);
    provider.setLastGetRequest("getNewsByTopic", topic);
    if (kDebugMode) {
      print("getNewsByTopic" + " " + topic);
    }
    List<Articles>? articles = NewsSingleton().generalNews.articles;
    provider.setDataLoaded(true);
    addArticlesToUnreads(articles!);
    return articles;
  }

  @override
  Future<List<Articles>> getNewsByCategory(String category) async {
    final provider = Provider.of<FeedProvider>(context, listen: false);
    NewsSingleton().generalNews;

    provider.setDataLoaded(false);
    provider.setLastGetRequest("getNewsByTopic", category);
      List<Articles>? articles = NewsSingleton().generalNews.articles;

      provider.setDataLoaded(true);
      addArticlesToUnreads(articles!);

      return articles;
  }

  @override
  Future<List<Articles>> getNewsBySearchQuery(String query) async {
    final provider = Provider.of<FeedProvider>(context, listen: false);

    provider.setDataLoaded(false);
    //TODO Handle Data
    final String url = "everything?q=$query";

    List<Articles>? articles = NewsSingleton().generalNews.articles;

    addArticlesToUnreads(articles!);
    provider.setDataLoaded(true);
    return articles;
  }

  @override
  List<Articles> getNewsFromLocalStorage(String fromBox) {
    List<Articles> articles = [];
    final Box<Articles> hiveBox = Hive.box<Articles>(fromBox);
    final provider = Provider.of<FeedProvider>(context, listen: false);

    provider.setLastGetRequest("getNewsFromLocalStorage", fromBox);

    if (kDebugMode) {
      print(fromBox);
    }

    if (hiveBox.length > 0) {
      for (int i = 0; i < hiveBox.length; i++) {
        Articles? article = hiveBox.getAt(i);
        articles.add(article!);
      }
      provider.setDataLoaded(true);

      return articles;
    } else {
      provider.setDataLoaded(true);
      List<Articles> articles = [];
      return articles;
    }
  }
}
