// Flutter imports:
import 'package:flutter/material.dart';
import 'package:inshorts_assignment_karan/common/colors.dart';
import 'package:inshorts_assignment_karan/common/typography/text_styles.dart';
import 'package:inshorts_assignment_karan/controller/provider.dart';

// Package imports:
import 'package:provider/provider.dart';


class NewsCardAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: SizedBox(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            color: InShortColors.accent,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Text(
                            "Search",
                            style: InShortTextStyle.appBarTitle,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Consumer<FeedProvider>(
                    builder: (context, value, child) =>
                        value.getCurentArticalIndex != 0
                            ? IconButton(
                                icon: const Icon(Icons.arrow_upward),
                                onPressed: () {
                                  value.getfeedPageController.animateToPage(0,
                                      duration: const Duration(milliseconds: 700),
                                      curve: Curves.easeInBack);
                                })
                            : Container(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
