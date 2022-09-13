// Flutter imports:
import 'package:flutter/material.dart';
import 'package:inshorts_assignment_karan/common/colors.dart';
import 'package:inshorts_assignment_karan/global/global.dart';
import 'package:inshorts_assignment_karan/model/news_model.dart';

// Package imports:
import 'package:intl/intl.dart';

class SearchNewsCard extends StatelessWidget {
  final List<Articles>? articles;
  final int? index;

  SearchNewsCard({this.articles, this.index});

  @override
  Widget build(BuildContext context) {
    Articles? article = articles![index!];

    return GestureDetector(
      //TODO: Handle this
      onTap: () {
        // FeedScreenArguments
      },
      child: Padding(
        padding: const EdgeInsets.only(
          right: 16,
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: Global.width(context) * 0.18,
              child: Row(
                children: <Widget>[
                  Container(
                    width: Global.width(context) * 0.18,
                    height: Global.width(context) * 0.18,
                    color: InShortColors.surface,
                    child: article.urlToImage != null
                        //TODO
                        ? Image.network(
                            article.urlToImage ?? '',
                            fit: BoxFit.cover,
                          )
                        : Container(),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
                      child: Text(
                        article.title ?? '',
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            // color: AppColor.onBackground,
                            fontSize: 14,
                            height: 1.2,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        article.publishedAt??'',
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Global.width(context) * 0.22,
              ),
              child: const Divider(
                height: 1,
                color: InShortColors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
