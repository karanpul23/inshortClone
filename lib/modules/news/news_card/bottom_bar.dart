// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:inshorts_assignment_karan/common/colors.dart';

import 'package:inshorts_assignment_karan/common/typography/typography.dart';
import 'package:inshorts_assignment_karan/l10n/l10n.dart';
import 'package:inshorts_assignment_karan/model/news_model.dart';
import 'package:inshorts_assignment_karan/modules/web_screen/web.dart';

class BottomBar extends StatelessWidget {
  final Articles? articles;

  const BottomBar({this.articles});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebScreen(
              url: articles?.url ?? 'https.//www.google.co.in',
              isFromBottom: true),
        ),
      ),
      child: Container(
        color: Theme.of(context).cardColor,
        // elevation: 0,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              child: articles!.urlToImage != null
                  ? CachedNetworkImage(
                      //TODO: placeholder
                      imageUrl: articles?.urlToImage ?? '',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    )
                  : Container(),
            ),
            Positioned(
              top: 0,
              left: 0,
              height: double.maxFinite,
              width: double.maxFinite,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              color: InShortColors.onBackground.withOpacity(0.6),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    articles!.content?.split(",")[0].replaceAll("\n", "") ?? '',
                    maxLines: 1,
                    style: InShortTextStyle.newsBottomTitle,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    context.l10n.tap_message,
                    style: InShortTextStyle.newsBottomSubtitle,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
