import 'package:flutter/widgets.dart';
import 'package:inshorts_assignment_karan/common/colors.dart';

/// Defines the color palette for the InShort UI.
abstract class InShortStyles {

  ///CI Gradient
  static const LinearGradient greenGradient = LinearGradient(
      colors: [
        InShortColors.greenDark,
        InShortColors.greenMedium,
        InShortColors.greenLight,
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,

  );

  ///CI Gradient
  static  LinearGradient blueGradient = LinearGradient(
    colors: [
      InShortColors.blueColor,
      InShortColors.blueColor.withOpacity(0.5),
      InShortColors.lightBlueColor,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,

  );

  static const LinearGradient pinkHorizontalGradient = LinearGradient(
    colors: [
      InShortColors.darkPink,
      InShortColors.lightPink,
      InShortColors.lightPink,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,

  );

  static const LinearGradient pinkDarkGradient = LinearGradient(
    colors: [
      InShortColors.darkPink,
      InShortColors.lightPink,
    ], stops: [
    0.1,
    0.9
  ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );


  ///CI Gradient
  static const LinearGradient goldGradient = LinearGradient(
    colors: [
      InShortColors.goldDark,
      InShortColors.goldMedium,
      InShortColors.goldLight,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static const LinearGradient grayGradient = LinearGradient(
    colors: [
      InShortColors.darkGray,
      InShortColors.gray,
      InShortColors.lightGray,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(
      color: InShortColors.black25.withOpacity(0.3), //color of shadow
      spreadRadius: 3, //spread radius
      blurRadius: 7, // blur radius
      offset: Offset(0, 2), // changes position of shadow
      //first paramerter of offset is left-right
      //second parameter is top to down
    ),
  ];

}
