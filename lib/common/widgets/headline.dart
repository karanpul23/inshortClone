// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:inshorts_assignment_karan/common/colors.dart';
import 'package:inshorts_assignment_karan/common/typography/typography.dart';

Widget headLine(String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: InShortTextStyle.headline3,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: 36,
          height: 2.5,
          color: InShortColors.gray,
        ),
      ],
    ),
  );
}
