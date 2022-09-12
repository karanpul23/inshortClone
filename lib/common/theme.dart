import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inshorts_assignment_karan/common/colors.dart';
import 'package:inshorts_assignment_karan/common/typography/typography.dart';

const _smallTextScaleFactor = 0.80;

/// Namespace for the InShort [ThemeData].
class InShortTheme {
  /// Standard `ThemeData` for InShort UI.
  static ThemeData get standard {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(accentColor: InShortColors.charcoal),
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textTheme: _textTheme,
      dialogBackgroundColor: InShortColors.whiteBackground,
      dialogTheme: _dialogTheme,
      tooltipTheme: _tooltipTheme,
      bottomSheetTheme: _bottomSheetTheme,
      tabBarTheme: _tabBarTheme,
      dividerTheme: _dividerTheme,
      bottomNavigationBarTheme: _bottomNavigationBarThemeData,
    );
  }

  static ThemeData get standardDark {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(accentColor: InShortColors.charcoal),
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textTheme: _textTheme,
      dialogBackgroundColor: InShortColors.whiteBackground,
      dialogTheme: _dialogTheme,
      tooltipTheme: _tooltipTheme,
      bottomSheetTheme: _bottomSheetTheme,
      tabBarTheme: _tabBarTheme,
      dividerTheme: _dividerTheme,
      bottomNavigationBarTheme: _bottomNavigationBarThemeData,
    );
  }

  /// `ThemeData` for InShort UI for small screens.
  static ThemeData get small {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  static ThemeData get smallDark {
    return standardDark.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for InShort UI for medium screens.
  static ThemeData get medium {
    return standardDark.copyWith(textTheme: _smallTextTheme);
  }

  static ThemeData get mediumDark {
    return standardDark.copyWith(textTheme: _smallTextTheme);
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headline1: InShortTextStyle.headline1,
      headline2: InShortTextStyle.headline2,
      headline3: InShortTextStyle.headline3,
      headline4: InShortTextStyle.headline4,
      headline5: InShortTextStyle.headline5,
      headline6: InShortTextStyle.headline6,
      subtitle1: InShortTextStyle.subtitle1,
      subtitle2: InShortTextStyle.subtitle2,
      bodyText1: InShortTextStyle.bodyText1,
      bodyText2: InShortTextStyle.bodyText2,
      caption: InShortTextStyle.caption,
      overline: InShortTextStyle.overline,
      button: InShortTextStyle.button,
    );
  }

  static TextTheme get _smallTextTheme {
    return TextTheme(
      headline1: InShortTextStyle.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _smallTextScaleFactor,
      ),
      headline2: InShortTextStyle.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _smallTextScaleFactor,
      ),
      headline3: InShortTextStyle.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _smallTextScaleFactor,
      ),
      headline4: InShortTextStyle.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _smallTextScaleFactor,
      ),
      headline5: InShortTextStyle.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _smallTextScaleFactor,
      ),
      headline6: InShortTextStyle.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle1: InShortTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle2: InShortTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText1: InShortTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText2: InShortTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyText2!.fontSize! * _smallTextScaleFactor,
      ),
      caption: InShortTextStyle.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _smallTextScaleFactor,
      ),
      overline: InShortTextStyle.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _smallTextScaleFactor,
      ),
      button: InShortTextStyle.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _smallTextScaleFactor,
      ),
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      color: InShortColors.darkGray,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: InShortColors.black,
        fontWeight: InShortFontWeight.bold,
      ),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 2),
        primary: InShortColors.charcoal,
        minimumSize: const Size(132, 32),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        side: const BorderSide(color: InShortColors.white, width: 2),
        padding: const EdgeInsets.symmetric(vertical: 16),
        primary: InShortColors.white,
        minimumSize: const Size(208, 54),
      ),
    );
  }

  static TooltipThemeData get _tooltipTheme {
    return const TooltipThemeData(
      decoration: BoxDecoration(
        color: InShortColors.charcoal,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.all(10),
      textStyle: TextStyle(color: InShortColors.white),
    );
  }

  static DialogTheme get _dialogTheme {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: InShortColors.whiteBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  static BottomNavigationBarThemeData get _bottomNavigationBarThemeData {
    return const BottomNavigationBarThemeData(
      selectedItemColor: InShortColors.charcoal,
      unselectedItemColor: InShortColors.black54,
      selectedLabelStyle: TextStyle(fontWeight: InShortFontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: InShortFontWeight.medium),
      type: BottomNavigationBarType.fixed,
    );
  }

  static TabBarTheme get _tabBarTheme {
    return const TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2,
          color: InShortColors.charcoal,
        ),
      ),
      labelColor: InShortColors.charcoal,
      unselectedLabelColor: InShortColors.black25,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  static DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      space: 0,
      thickness: 1,
      color: InShortColors.black25,
    );
  }
}
