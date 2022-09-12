import 'package:inshorts_assignment_karan/model/news_model.dart';

class NewsSingleton {
  static final NewsSingleton _singleton = NewsSingleton._internal();

  factory NewsSingleton() {
    return _singleton;
  }

  NewsSingleton._internal();

  late NewsModel _generalNews;
  late NewsModel _trendingNews;

  NewsModel get trendingNews => _trendingNews;

  set trendingNews(NewsModel value) {
    _trendingNews = value;
  }

  NewsModel get generalNews => _generalNews;

  set generalNews(NewsModel value) {
    _generalNews = value;
  }
}
