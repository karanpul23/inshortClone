// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inshorts_assignment_karan/bloc/feed/news_feed_bloc.dart';
import 'package:inshorts_assignment_karan/bloc/feed/news_feed_event.dart';
import 'package:inshorts_assignment_karan/common/colors.dart';
import 'package:inshorts_assignment_karan/common/typography/typography.dart';
import 'package:inshorts_assignment_karan/controller/feed_controller.dart';
import 'package:inshorts_assignment_karan/controller/provider.dart';
import 'package:inshorts_assignment_karan/global/global.dart';
import 'package:inshorts_assignment_karan/l10n/l10n.dart';
import 'package:inshorts_assignment_karan/modules/settings_screen/settings.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final int index;

  const CustomAppBar({this.index = 1});

  @override
  Widget build(BuildContext widgetContext) {
    return Consumer<FeedProvider>(
      builder: (context, value, child) => SafeArea(
        child: Material(
          // color: Colors.white,
          child: Container(
            height: 52,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: index != 1
                          ? IconButton(
                              icon: const Icon(
                                Icons.settings,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            SettingsScreen()));
                              },
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  onPressed: () {
                                    FeedController.addCurrentPage(0);
                                  },
                                ),
                                Text(
                                  widgetContext.l10n.discover,
                                  style: InShortTextStyle.appBarTitle,
                                )
                              ],
                            ),
                    )),
                    Expanded(
                      child: Text(
                        index == 1
                            ? value.getAppBarTitle != null
                                ? value.getAppBarTitle
                                : widgetContext.l10n.my_feed
                            : widgetContext.l10n.discover,
                        style: InShortTextStyle.appBarTitle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            index != 1
                                ? Text(
                                    value.getAppBarTitle != null
                                        ? value.getAppBarTitle
                                        : context.l10n.my_feed,
                                    style: InShortTextStyle.appBarTitle,
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.rtl,
                                  )
                                : Container(),
                            getIcon(context)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: Global.width(context) * 0.1,
                  height: 3,
                  color: InShortColors.accent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void bringToTop(PageController pageController) {
    pageController.animateToPage(0,
        duration: Duration(milliseconds: 700), curve: Curves.ease);
  }

  IconButton getIcon(context) {
    final provider = Provider.of<FeedProvider>(context, listen: false);

    if (index != 1) {
      return IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            FeedController.addCurrentPage(1);
          });
    } else {
      if (provider.gethasDataLoaded) {
        return provider.getCurentArticalIndex == 0
            ? IconButton(
                icon: const Icon(Icons.refresh_sharp),
                onPressed: () {

                  reloade(context);
                })
            : IconButton(
                icon: const Icon(Icons.arrow_upward),
                onPressed: () => bringToTop(provider.getfeedPageController));
      } else {
        /// TODO loading icon
        return const IconButton(icon: Icon(Icons.language), onPressed: null);
      }
    }
  }

  void reloade(context) {
    final provider = Provider.of<FeedProvider>(context, listen: false);
    print(provider.getLastGetRequest.elementAt(0));

    switch (provider.getLastGetRequest.elementAt(0)) {
      case "getNewsByTopic":
        BlocProvider.of<NewsFeedBloc>(context).add(
          FetchNewsByTopicEvent(topic: provider.getLastGetRequest.elementAt(1)),
        );
        break;
      case "getNewsByCategory":
        BlocProvider.of<NewsFeedBloc>(context).add(
          FetchNewsByCategoryEvent(
              category: provider.getLastGetRequest.elementAt(1)),
        );
        break;
      case "getNewsFromLocalStorage":
        BlocProvider.of<NewsFeedBloc>(context).add(
          FetchNewsFromLocalStorageEvent(
              box: provider.getLastGetRequest.elementAt(1)),
        );
        break;
      default:
        return;
    }
  }
}
