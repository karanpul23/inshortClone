import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inshorts_assignment_karan/bloc/feed/news_feed_bloc.dart';
import 'package:inshorts_assignment_karan/bloc/feed/news_feed_event.dart';
import 'package:inshorts_assignment_karan/common/widgets/appbar.dart';
import 'package:inshorts_assignment_karan/controller/feed_controller.dart';
import 'package:inshorts_assignment_karan/controller/provider.dart';
import 'package:provider/provider.dart';

class AppBase extends StatefulWidget {
  const AppBase({Key? key}) : super(key: key);

  @override
  _AppBaseState createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> with AutomaticKeepAliveClientMixin {
  int currentPage = 1;
  late PageController _pageController;
  late FeedProvider provider;

  @override
  void initState() {
    provider = Provider.of<FeedProvider>(context, listen: false);

    BlocProvider.of<NewsFeedBloc>(context).add(
      FetchNewsByCategoryEvent(category: "general"),
    );

    _pageController = PageController(
      initialPage: currentPage,
    );

    provider.setScreenController(_pageController);
    provider.setActiveCategory(1);
    provider.setAppBarTitle('My Feeds');
    FeedController.getCurrentPage((page) {
      _pageController.jumpToPage(page);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Consumer<FeedProvider>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView(
              controller: _pageController,
              onPageChanged: (page) {
                currentPage = _pageController.page!.round();
                if (currentPage == 2) {
                  value.setAppBarVisible(false);
                } else {
                  value.setAppBarVisible(true);
                }
              },
              children: provider.getBaseScreenList,
            ),
            value.getAppBarVisible
                ? Align(
                    alignment: Alignment.topCenter,
                    child: CustomAppBar(
                      index: currentPage,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
