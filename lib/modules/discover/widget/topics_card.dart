// Flutter imports:
import 'package:flutter/material.dart';
import 'package:inshorts_assignment_karan/common/colors.dart';
import 'package:inshorts_assignment_karan/common/typography/text_styles.dart';
import 'package:inshorts_assignment_karan/controller/feed_controller.dart';
import 'package:inshorts_assignment_karan/global/global.dart';

class TopicCard extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTap;

  const TopicCard(
      {required Key key,
      required this.icon,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FeedController.addCurrentPage(1);
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        height: Global.height(context) * 0.2,
        decoration: BoxDecoration(
          border: Border.all(
            color: InShortColors.accent,
          ),

          // color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/icons/$icon.png",
                fit: BoxFit.contain,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  title,
                  style: InShortTextStyle.topiccardTitle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
