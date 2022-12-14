// Flutter imports:
import 'package:flutter/material.dart';
import 'package:inshorts_assignment_karan/common/typography/typography.dart';
import 'package:inshorts_assignment_karan/global/global.dart';
import 'package:inshorts_assignment_karan/l10n/l10n.dart';


class LoadingShorts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            constraints: BoxConstraints(
              minHeight: Global.height(context),
              minWidth: double.maxFinite,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 0.3),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/icons/loading.png",
                    fit: BoxFit.contain,
                    width: double.maxFinite,
                    height: Global.height(context) * 0.5,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    context.l10n.loading_message,
                    style: InShortTextStyle.loading,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
