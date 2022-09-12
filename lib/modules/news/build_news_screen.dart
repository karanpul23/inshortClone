import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inshorts_assignment_karan/bloc/feed/news_feed_bloc.dart';
import 'package:inshorts_assignment_karan/bloc/feed/news_feed_state.dart';
import 'package:inshorts_assignment_karan/common/loading_shorts.dart';
import 'package:inshorts_assignment_karan/common/typography/typography.dart';
import 'package:inshorts_assignment_karan/controller/provider.dart';
import 'package:inshorts_assignment_karan/l10n/l10n.dart';
import 'package:inshorts_assignment_karan/model/news_model.dart';
import 'package:inshorts_assignment_karan/modules/feed_screen/feed.dart';
import 'package:inshorts_assignment_karan/modules/web_screen/web.dart';
import 'package:provider/provider.dart';

class BuildNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext widgetContext) {
    final provider = Provider.of<FeedProvider>(widgetContext, listen: false);

    return BlocBuilder<NewsFeedBloc, NewsFeedState>(
      builder: (context, state) {
        if (state is NewsFeedInitialState) {
          return Container();
        } else if (state is NewsFeedLoadingState) {
          return LoadingShorts();
        }
        else if (state is NewsFeedLoadedState) {
          if (state.news?.isEmpty ?? true) {
            return Center(
              child: Text(
                '${widgetContext.l10n.not_found}\n',
                style: InShortTextStyle.newsTitle,
              ),
            );
          }

          if (provider.webviwAdded == false) {
            provider.addWebScren(
              WebScreen(
                url: provider.getNewsURL,
                isFromBottom: false,
              ),
            );
          }

          return FeedScreen(
            isFromSearch: false,
            articalIndex: 0,
            articals: state.news as List<Articles>,
          );
        } else if (state is NewsFeedErrorState) {
          provider.setDataLoaded(true);
          if (kDebugMode) {
            print(state.message);
          }
          return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  context.l10n.error,
                  style: InShortTextStyle.newsTitle,
                ),
                const SizedBox(height: 8),
                Text(
                  context.l10n.error_message,
                  style: InShortTextStyle.searchbar,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
