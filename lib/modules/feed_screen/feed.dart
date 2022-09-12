// Flutter imports:
import 'package:flutter/material.dart';
import 'package:inshorts_assignment_karan/common/widgets/news_appbar.dart';
import 'package:inshorts_assignment_karan/controller/provider.dart';
import 'package:inshorts_assignment_karan/model/news_model.dart';
import 'package:inshorts_assignment_karan/modules/news/news_card/news_card.dart';
import 'package:inshorts_assignment_karan/modules/web_screen/web.dart';

// Package imports:
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  final List<Articles>? articals;
  final int articalIndex;
  final bool isFromSearch;

  const FeedScreen(
      {required this.articalIndex,
       this.articals,
      required this.isFromSearch});

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    PageController _pageController =
        PageController(initialPage: widget.articalIndex);
    PageController _searchPageController = PageController();

    int lastPage = 0;
    final provider = Provider.of<FeedProvider>(context, listen: false);

    provider.setfeedPageController(_pageController);

    return Scaffold(
      backgroundColor: Colors.black,
      body: widget.isFromSearch
          ? PageView(
              controller: _searchPageController,
              children: [
                Stack(
                  fit: StackFit.expand,
                  children: [
                    PageView.builder(
                      onPageChanged: (page) {
                        if (page > lastPage) {
                          provider.setSearchAppBarVisible(false);
                          provider.setAppBarVisible(false);
                        } else {
                          provider.setSearchAppBarVisible(true);
                          provider.setAppBarVisible(true);
                        }
                        provider.setFeedBottomActionbarVisible(false);

                        lastPage = page;
                        provider.setCurentArticalIndex(page);
                      },
                      controller: _pageController,
                      itemCount: widget.articals?.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_, index) {
                        return NewsCard(
                          article: widget.articals![index],
                          isFromSearch: widget.isFromSearch,
                        );
                      },
                    ),
                    widget.isFromSearch
                        ? Consumer<FeedProvider>(
                            builder: (context, value, child) =>
                                value.getSearchAppBarVisible
                                    ? Align(
                                        alignment: Alignment.topCenter,
                                        child: NewsCardAppBar(),
                                      )
                                    : Container(),
                          )
                        : Container()
                  ],
                ),
                WebScreen(
                  url: provider.getNewsURL,
                  isFromBottom: false,
                  pageController: _searchPageController,
                )
              ],
            )
          : Stack(
              fit: StackFit.expand,
              children: [
                PageView.builder(
                  allowImplicitScrolling: false,
                  onPageChanged: (page) {
                    if (page > lastPage) {
                      provider.setSearchAppBarVisible(false);
                      provider.setAppBarVisible(false);
                    } else {
                      provider.setSearchAppBarVisible(true);
                      provider.setAppBarVisible(true);
                    }
                    lastPage = page;
                    provider.setCurentArticalIndex(page);
                    provider.setFeedBottomActionbarVisible(false);
                  },
                  controller: _pageController,
                  itemCount: widget.articals!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    return NewsCard(
                      article: widget.articals![index],
                      isFromSearch: widget.isFromSearch,
                    );
                  },
                ),
                widget.isFromSearch
                    ? Consumer<FeedProvider>(
                        builder: (context, value, child) =>
                            value.getSearchAppBarVisible
                                ? Align(
                                    alignment: Alignment.topCenter,
                                    child: NewsCardAppBar(),
                                  )
                                : Container(),
                      )
                    : Container()
              ],
            ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
