import 'package:flutter/material.dart';

class Styles {
  static Color scaffoldBackgroundColor = const Color(0xFFe0efff);
  static Color defaultRedColor = const Color(0xffff698a);
  static Color defaultYellowColor = const Color(0xFFfedd69);
  static Color defaultBlueColor = const Color(0xff52beff);
  static Color defaultGreyColor = const Color(0xff77839a);
  static Color defaultLightGreyColor = const Color(0xffc4c4c4);
  static Color defaultLightWhiteColor = const Color(0xFFf2f6fe);

  static double defaultPadding = 18.0;

  static BorderRadius defaultBorderRadius = BorderRadius.circular(20);

  /// isAlwaysShown 작동 안 됨.
  /// 
  /// https://docs.flutter.dev/release/breaking-changes/3-10-deprecations
  /// 
  /// 이 문서를 봤을 때 thumbVisibility로 대체되었고, 이 템플릿 상에서는 true false 값을 요구했기 때문에
  /// 아래 같이 처리함
  static ScrollbarThemeData scrollbarTheme =
      const ScrollbarThemeData().copyWith(
    thumbColor: MaterialStateProperty.all(defaultYellowColor),
    thumbVisibility: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      return states.contains(MaterialState.hovered) ? true : false;
    }),
    interactive: true,
  );
}
