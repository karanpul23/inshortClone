// Flutter imports:
import 'package:flutter/material.dart';
import 'package:inshorts_assignment_karan/common/colors.dart';
import 'package:inshorts_assignment_karan/common/typography/typography.dart';
import 'package:inshorts_assignment_karan/global/global.dart';

class CategoryCard extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTap;
  final bool active;

   CategoryCard(
      {required this.icon,
      required this.title,
      required this.onTap,
      this.active = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // onTap();
        // FeedController.addCurrentPage(1);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        height: Global.height(context) * 0.14,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Opacity(
              opacity: active ? 1 : 0.5,
              child: Image.asset(
                "assets/icons/$icon.png",
                height: 70,
                width: 70,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              title,
              style: active
                  ? InShortTextStyle.categoryTitle.copyWith(
                      color: InShortColors.accent,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)
                  : InShortTextStyle.categoryTitle,
            ),
          ],
        ),
      ),
    );
  }
}
