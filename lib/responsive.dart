import 'package:flutter/material.dart';

/// 반응형 제공하기 위한 클래스
class Responsive extends StatelessWidget {
  /// 모바일 혹은 데스크탑 위젯 다룸
  final Widget mobile;
  final Widget desktop;

  /// 호출이 app_layout.dart에서 되었고, 모바일과 데스크탑 두 경우로 나뉘었음
  const Responsive({
    Key? key,
    required this.mobile,
    required this.desktop,
  }) : super(key: key);

  /// bool 메서드들이 Responsive 클래스와 함께 호출된 게 아니라
  /// 모바일, 태블릿, 데스크탑 판별만을 위해 불려나갔다 인지하면 됨
  /// 어차피 static 형식이라 클래스를 생성하지 않고 사용해도 문제되지 않음
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  /// 어떤 위젯을 그리는지 결정
  @override
  Widget build(BuildContext context) {
    /// ? : 레이아웃까지 빌드를 연기하는 위젯을 만듭니다.
    return LayoutBuilder(
      builder: (context, constraints) {
        /// 제약 조건과 최대 너비 지정 가능
        if (constraints.maxWidth >= 650) {
          return desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}
