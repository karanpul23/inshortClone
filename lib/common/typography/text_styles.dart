import 'package:flutter/widgets.dart';
import 'package:inshorts_assignment_karan/common/colors.dart';
import 'package:inshorts_assignment_karan/common/typography/typography.dart';

/// UVida Text Style Definitions
class InShortTextStyle {
  static const TextStyle appBarTitle = TextStyle(
    fontFamily: 'Mont',
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle newsTitle = TextStyle(
    fontFamily: 'Mont',
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle newsSubtitle = TextStyle(
    fontFamily: 'Mont',
    fontSize: 15,
    height: 1.5,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle newsFooter = TextStyle(
    fontFamily: 'Mont',
    color: InShortColors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle newsBottomTitle = TextStyle(
    fontFamily: 'Mont',
    color: InShortColors.onPrimary,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle newsBottomSubtitle = TextStyle(
    fontFamily: 'Mont',
    color: InShortColors.onPrimary,
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle headline = TextStyle(
    fontFamily: 'Mont',
    // color: InShortColors.onBackground,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle topiccardTitle = TextStyle(
    // color: InShortColors.onBackground,
    fontFamily: 'Mont',

    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle categoryTitle = TextStyle(
    color: InShortColors.iconGrey,
    fontFamily: 'Mont',
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle searchbar = TextStyle(
    // color: InShortColors.onBackground,
    fontFamily: 'Mont',
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle bottomActionbar = TextStyle(
    fontFamily: 'Mont',
    color: InShortColors.iconGrey,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const loading = TextStyle(
    fontFamily: 'Mont',
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const _baseTextStyle = TextStyle(
    fontFamily: 'Mont',
    color: InShortColors.black,
    fontWeight: InShortFontWeight.regular,
  );
  static const _secondaryTextStyle = TextStyle(
    fontFamily: 'HaveAGreatDay',
    color: InShortColors.black,
    fontWeight: InShortFontWeight.regular,
  );

  /// Headline 1 Text Style
  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontSize: 56,
      fontWeight: InShortFontWeight.medium,
    );
  }

  /// Headline 2 Text Style
  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: 30,
      fontWeight: InShortFontWeight.regular,
    );
  }

  /// Headline 3 Text Style
  static TextStyle get headline3 {
    return _baseTextStyle.copyWith(
      fontSize: 24,
      fontWeight: InShortFontWeight.regular,
    );
  }

  /// Headline 4 Text Style
  static TextStyle get headline4 {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: InShortFontWeight.bold,
    );
  }

  /// Headline 5 Text Style
  static TextStyle get headline5 {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: InShortFontWeight.medium,
    );
  }

  /// Headline 6 Text Style
  static TextStyle get headline6 {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: InShortFontWeight.bold,
    );
  }


  /// Subtitle 1 Text Style
  static TextStyle get subtitle1 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: InShortFontWeight.bold,
    );
  }

  /// Subtitle 2 Text Style
  static TextStyle get subtitle2 {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: InShortFontWeight.bold,
    );
  }

  /// Body Text 1 Text Style
  static TextStyle get bodyText1 {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: InShortFontWeight.medium,
    );
  }

  /// Body Text 2 Text Style (the default)
  static TextStyle get bodyText2 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: InShortFontWeight.regular,
    );
  }

  /// Caption Text Style
  static TextStyle get caption {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: InShortFontWeight.regular,
    );
  }

  /// Overline Text Style
  static TextStyle get overline {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: InShortFontWeight.regular,
    );
  }

  /// Button Text Style
  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: InShortFontWeight.medium,
    );
  }
}
