import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:inshorts_assignment_karan/app/app.dart';
import 'package:inshorts_assignment_karan/controller/provider.dart';
import 'package:inshorts_assignment_karan/controller/settings.dart';
import 'package:inshorts_assignment_karan/model/news_model.dart';
import 'package:inshorts_assignment_karan/singletons/NewsSingleton.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final docPath = await getApplicationDocumentsDirectory();
  final jsonResult = await loadGeneralNews();
  final jsonTrendingResult = await loadTrendingNews();
  final parsed = json.decode(jsonResult);
  final trendingParsed = json.decode(jsonTrendingResult);
  // print('Done '+ trendingParsed);
  NewsModel generalNews = NewsModel.fromJson(parsed);
  NewsModel trendingNews = NewsModel.fromJson(trendingParsed);
  // print('Done parsing'+ trendingParsed);
  //
  var newSingleton = NewsSingleton();
  newSingleton.generalNews = generalNews;
  newSingleton.trendingNews = trendingNews;
  Hive.init(docPath.path);
  Hive.registerAdapter(ArticlesAdapter());

  await Hive.openBox('settingsBox');
  await Hive.openBox<Articles>('bookmarks');
  await Hive.openBox<Articles>('unreads');

  final _isDarkModeOn = await Hive.box('settingsBox').get('isDarkModeOn');
  SettingsProvider().darkTheme(_isDarkModeOn ?? false);
  //TODO: Fix this
  // final _lang = await Hive.box('settingsBox').get('activeLang');
  // SettingsProvider().setLang(_lang);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>(
            create: (_) => SettingsProvider()),
        ChangeNotifierProvider<FeedProvider>(create: (_) => FeedProvider()),
      ],
      child: App(),
    ),
  );
}

Future<String> loadGeneralNews() async {
  return await rootBundle.loadString('assets/news_json/general.json');
}

Future<String> loadTrendingNews() async {
  return await rootBundle.loadString('assets/news_json/trending.json');
}
