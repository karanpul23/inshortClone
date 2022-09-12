// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inshorts_assignment_karan/common/colors.dart';
import 'package:inshorts_assignment_karan/common/typography/typography.dart';
import 'package:inshorts_assignment_karan/controller/provider.dart';
import 'package:inshorts_assignment_karan/controller/settings.dart';
import 'package:inshorts_assignment_karan/global/global.dart';
import 'package:inshorts_assignment_karan/l10n/l10n.dart';
import 'package:inshorts_assignment_karan/model/news_model.dart';
import 'package:inshorts_assignment_karan/services/news/offline_service.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'bottom_action_bar.dart';
import 'bottom_bar.dart';

class NewsCard extends StatelessWidget {
  final Articles? article;
  final bool isFromSearch;

  const NewsCard({this.article, required this.isFromSearch});

  @override
  build(BuildContext context) {
    final provider = Provider.of<FeedProvider>(context, listen: false);

    provider.setNewsURL(article?.url??'https//www.google.co.in');
    removeArticleFromUnreads(article!);

    if (kDebugMode) {
      print(article?.url);
    }

    return GestureDetector(
      onTap: () {
        provider.setAppBarVisible(!provider.getAppBarVisible);
        provider.setSearchAppBarVisible(!provider.getSearchAppBarVisible);
        provider.setFeedBottomActionbarVisible(
            !provider.getFeedBottomActionbarVisible);
      },
      child: SafeArea(
        bottom: false,
        child: _buildCard(context, provider),
      ),
    );
  }

  Widget _buildCard(BuildContext context, provider) {
    GlobalKey _containerKey = GlobalKey();

    return Consumer<FeedProvider>(builder: (context, value, _) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          constraints: BoxConstraints(
            minHeight: Global.height(context),
            minWidth: double.maxFinite,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.3),
          ),
          child: RepaintBoundary(
            key: _containerKey,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.4,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        article!.urlToImage != null
                            ? Container(
                                decoration: BoxDecoration(
                                  color: InShortColors.surface,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      //TODO: Add PlaceHolder
                                      article?.urlToImage??'',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                color: InShortColors.surface,
                              ),
                        Positioned(
                          top: 0,
                          left: 0,
                          height: double.maxFinite,
                          width: double.maxFinite,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                        ),
                        article!.urlToImage != null
                            ? GestureDetector(
                                // onTap: () => Router.navigator.pushNamed(
                                //   Router.expandedImageView,
                                //   arguments: ExpandedImageViewArguments(
                                //     image: article.urlToImage,
                                //   ),
                                // ),
                                child: Center(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                    //TODO: Placeholder
                                    imageUrl: article?.urlToImage??'',
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.6,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        FractionallySizedBox(
                          alignment: Alignment.topCenter,
                          heightFactor: 0.85,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 25, 16, 16),
                            child: WatchBoxBuilder(
                              box: Hive.box<Articles>('bookmarks'),
                              builder: (context, box) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () => handleBookmarks(article!),
                                    child: Text(
                                      article?.title??'',
                                      style: box.containsKey(article?.url??'')
                                          ? InShortTextStyle.newsTitle
                                              .copyWith(color: InShortColors.accent)
                                          : InShortTextStyle.newsTitle,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    article?.description ?? "",
                                    style: InShortTextStyle.newsSubtitle,
                                    overflow: TextOverflow.fade,
                                    maxLines: 9,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "${context.l10n.swipe_message} ${article?.sourceName} /${article?.publishedAt??"September 12"}"
                                    ,
                                    style: InShortTextStyle.newsFooter,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        FractionallySizedBox(
                          alignment: Alignment.bottomCenter,
                          heightFactor: 0.15,
                          child: BottomBar(
                            articles: article,
                          ),
                        ),
                        value.getFeedBottomActionbarVisible
                            ? FractionallySizedBox(
                                alignment: Alignment.bottomCenter,
                                heightFactor: 0.15,
                                child: BottomActionBar(
                                  containerKey: _containerKey,
                                  articles: article,
                                ))
                            : Container(),
                        value.getWatermarkVisible
                            ? FractionallySizedBox(
                                alignment: Alignment.bottomCenter,
                                heightFactor: 0.17,
                                child: Material(
                                  elevation: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Consumer<SettingsProvider>(
                                              builder:
                                                  (context, theme, child) =>
                                                      FaIcon(
                                                FontAwesomeIcons.github,
                                                size: 20,
                                                color: theme.isDarkThemeOn
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/icons/logo.png",
                                              height: 20,
                                              width: 20,
                                            ),
                                            const SizedBox(width: 8),
                                            const Text("Inshorts"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
