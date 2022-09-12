// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inshorts_assignment_karan/bloc/feed/news_feed_bloc.dart';
import 'package:inshorts_assignment_karan/bloc/feed/news_feed_event.dart';
import 'package:inshorts_assignment_karan/common/widgets/headline.dart';
import 'package:inshorts_assignment_karan/controller/provider.dart';
import 'package:inshorts_assignment_karan/l10n/l10n.dart';
import 'package:inshorts_assignment_karan/modules/discover/widget/app_bar.dart';
import 'package:inshorts_assignment_karan/modules/discover/widget/category_card.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  var bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<NewsFeedBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext widgetContext) {
    final provider = Provider.of<FeedProvider>(widgetContext, listen: false);
    provider.setAppBarVisible(true);
    String searchMessage = widgetContext.l10n.search_message;
    return Scaffold(
      appBar: appSearchBar(widgetContext, searchMessage),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            headLine(widgetContext.l10n.categories),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    CategoryCard(
                      title: widgetContext.l10n.my_feed,
                      icon: "all",
                      active: provider.getActiveCategory == 1,
                      onTap: () {
                        provider.setActiveCategory(1);
                        provider.setAppBarTitle(widgetContext.l10n.my_feed);
                        bloc.add(
                          FetchNewsByCategoryEvent(category: "general"),
                        );
                      },
                    ),
                    CategoryCard(
                      title: widgetContext.l10n.trending,
                      icon: "trending",
                      active:true,
                      onTap: () {
                        provider.setActiveCategory(2);
                        provider.setAppBarTitle(widgetContext.l10n.trending);
                        bloc.add(
                          FetchNewsByTopicEvent(topic: "trending"),
                        );
                        provider.getScreenController.jumpToPage(2);
                      },
                    ),
                    CategoryCard(
                      title: widgetContext.l10n.bookmark,
                      icon: "bookmark",
                      active: true,
                      onTap: () {
                        provider.setActiveCategory(3);
                        provider.setAppBarTitle(widgetContext.l10n.bookmark);
                        bloc.add(
                          FetchNewsFromLocalStorageEvent(box: 'bookmarks'),
                        );
                        provider.getfeedPageController.jumpToPage(3);
                      },
                    ),
                    CategoryCard(
                      title: widgetContext.l10n.unreads,
                      icon: "unread",
                      active: true,
                      onTap: () {
                        provider.setActiveCategory(4);
                        provider.setAppBarTitle(widgetContext.l10n.unreads);
                        bloc.add(
                          FetchNewsFromLocalStorageEvent(box: 'unreads'),
                        );
                        provider.getfeedPageController.jumpToPage(4);
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
