// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Package imports:
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inshorts_assignment_karan/common/colors.dart';
import 'package:inshorts_assignment_karan/common/typography/text_styles.dart';
import 'package:inshorts_assignment_karan/controller/provider.dart';
import 'package:inshorts_assignment_karan/l10n/l10n.dart';
import 'package:inshorts_assignment_karan/model/news_model.dart';
import 'package:inshorts_assignment_karan/services/news/offline_service.dart';
import 'package:inshorts_assignment_karan/services/news/share_service.dart';
import 'package:provider/provider.dart';

class BottomActionBar extends StatelessWidget {
  final containerKey;
  final Articles? articles;

  const BottomActionBar({
    this.containerKey,
    this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          actionButton(
            title: context.l10n.share,
            icon: Icons.share,
            onTap: () {
              Provider.of<FeedProvider>(context, listen: false)
                  .setWatermarkVisible(true);

              Future.delayed(Duration(seconds: 2),
                  () => convertWidgetToImageAndShare(context, containerKey));
            },
          ),
          WatchBoxBuilder(
            box: Hive.box<Articles>('bookmarks'),
            builder: (context, snap) => actionButton(
              title: context.l10n.bookmark,
              //TODO
              icon: snap.containsKey(articles?.url ?? '')
                  ? Icons.bookmark
                  : Icons.bookmark_border,
              onTap: () {
                handleBookmarks(articles!);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget actionButton({
    required String title,
    required IconData icon,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () => onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: InShortColors.accent,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: InShortTextStyle.bottomActionbar,
          ),
        ],
      ),
    );
  }
}
