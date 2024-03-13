/// 프로젝트 내 layout 안 파일 참조
import 'package:fintech_dashboard_clone/layout/navigation_panel.dart';
import 'package:fintech_dashboard_clone/layout/top_app_bar.dart';

/// 반응형 설정 위한 클래스
import 'package:fintech_dashboard_clone/responsive.dart';

/// iOS 대상으로 할 때 필요한 파일
import 'package:flutter/cupertino.dart';

/// 앱 레이아웃은 상태 갖지 않는다 전제
class AppLayout extends StatelessWidget {
  final Widget content;

  /// 키는 있어도 없어도 되지만 하위 컨텐츠를 받아가게 요구함
  /// 만약 키가 있다면 부모 클래스의 생성자에 대입
  const AppLayout({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 반응형 클래스 리턴, 모바일과 데스크탑 경우 따짐
    return Responsive(
      /// 모바일이라면 Column 하나에 생성
      mobile: Column(
        children: [
          /// 앱 바가 맨 위에
          const TopAppBar(),
          /// 컨텐츠는 중간에
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: content,
            ),
          ),
          /// 내비게이션 패널은 아래에
          const NavigationPanel(
            /// 정렬 축을 가로로
            axis: Axis.horizontal,
          ),
        ],
      ),
      /// 데스크탑이라면 Row 생성, 나머지 내용을 가로로 놓기
      desktop: Row(
        children: [
          /// Row.children[0] == NavigationPanel로 하고, 정렬 축을 세로로
          const NavigationPanel(
            axis: Axis.vertical,
          ),
          /// Row.children[1] == 앱 바 및 컨텐츠로
          Expanded(
            /// flex: 5만큼 가로 차지
            flex: 5,
            /// 자식 박스 영역
            child: Padding(
              /// 자식 박스 영역에 패딩
              padding: const EdgeInsets.only(right: 10.0, bottom: 20.0),
              /// 내부 자식을 Column으로 함
              child: Column(
                /// 안에서 세로 정렬하기
                /// 
                /// ? : 자식의 수직 배열을 만듭니다.
                /// 
                /// [crossAxisAlignment]가 [CrossAxisAlignment.baseline]인 경우 [textBaseline]은 null이 아니어야 합니다.
                /// [textDirection] 인수는 기본적으로 주변 [방향성](있는 경우)으로 설정됩니다.
                /// 
                /// 주변 방향이 없고 [crossAxisAlignment]의 시작 또는 끝 값을 명확하게 하기 위해 텍스트 방향이 필요한 경우
                /// [textDirection]은 null이 아니어야 합니다.
                mainAxisSize: MainAxisSize.min,
                /// 현재 Column 내부의 자식
                children: [
                  /// 박스 영역 생성하고 높이를 100으로, child에 TopAppBar 생성
                  const SizedBox(height: 100, child: TopAppBar()),
                  /// 나머지는 content로 채우기
                  Expanded(child: content),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
