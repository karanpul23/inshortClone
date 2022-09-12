import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:inshorts_assignment_karan/app/app_base.dart';
import 'package:inshorts_assignment_karan/bloc/feed/news_feed_bloc.dart';
import 'package:inshorts_assignment_karan/bloc/serach_feed/search_feed_bloc.dart';
import 'package:inshorts_assignment_karan/common/theme.dart';
import 'package:inshorts_assignment_karan/common/widgets/animated_fade_in.dart';
import 'package:inshorts_assignment_karan/common/widgets/responsive_layout_builder.dart';
import 'package:inshorts_assignment_karan/l10n/l10n.dart';
import 'package:inshorts_assignment_karan/routes/rouut.dart';
import 'package:inshorts_assignment_karan/services/news/news_service.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeIn(
      child: ResponsiveLayoutBuilder(
        small: (_, __) => MainApp(
          theme: InShortTheme.small,
          darkTheme: InShortTheme.smallDark,
        ),
        medium: (_, __) => MainApp(
          theme: InShortTheme.medium,
          darkTheme: InShortTheme.mediumDark,
        ),
        large: (_, __) => MainApp(
          theme: InShortTheme.standard,
          darkTheme: InShortTheme.standard,
        ),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.theme, required this.darkTheme});

  final ThemeData theme;
  final ThemeData darkTheme;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsFeedBloc>(
          create: (context) =>
              NewsFeedBloc(repository: NewsFeedRepositoryImpl(context)),
        ),
        BlocProvider<SearchFeedBloc>(
          create: (context) =>
              SearchFeedBloc(repository: NewsFeedRepositoryImpl(context)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'InShort',
        theme: theme,
        darkTheme: darkTheme,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: AppBase(),
        // home: Container(
        //   color: Colors.blue,
        // ),
      ),
    );
  }
}
