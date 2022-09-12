// Flutter imports:
import 'package:flutter/material.dart';
import 'package:inshorts_assignment_karan/common/colors.dart';
import 'package:inshorts_assignment_karan/modules/search_screen/search.dart';

appSearchBar(
  context,
  String searchMessage,
) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(142),
    child: Material(
      elevation: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => SearchScreen()));
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 98, 16, 16),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: InShortColors.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.search,
                color: InShortColors.iconGrey,
              ),
              const SizedBox(width: 16),
              Text(
                searchMessage,
                style: const TextStyle(
                  color: InShortColors.iconGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
