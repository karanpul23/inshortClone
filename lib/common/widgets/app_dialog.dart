import 'package:flutter/material.dart';
import 'package:inshorts_assignment_karan/common/colors.dart';

/// Displays a dialog above the current contents of the app.
Future<T?> showAppDialog<T>({
  required BuildContext context,
  required Widget child,
  bool barrierDismissible = true,
}) =>
    showDialog<T>(
      context: context,
      barrierColor: InShortColors.charcoal,
      barrierDismissible: barrierDismissible,
      builder: (context) => AppDialog(child: child),
    );

// ignore: public_member_api_docs
class AppDialog extends StatelessWidget {
  // ignore: public_member_api_docs
  const AppDialog({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      child: Container(
        width: 900,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              InShortColors.whiteBackground,
              InShortColors.white,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
