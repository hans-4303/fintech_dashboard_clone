// 네비게이션 아이템
import 'package:fintech_dashboard_clone/models/enums/navigation_items.dart';
// 반응형 제공 클래스
import 'package:fintech_dashboard_clone/responsive.dart';
// 네비게이션 버튼 클래스
import 'package:fintech_dashboard_clone/widgets/navigation_button.dart';
// flutter 내장 material.dart
import 'package:flutter/material.dart';

/// 네비게이션 패널
class NavigationPanel extends StatefulWidget {
	/// 화면의 축
  final Axis axis;
	/// 키는 가질 수 있고 axis는 반드시 필요, key는 받으면 부모 클래스까지 전달
  const NavigationPanel({Key? key, required this.axis}) : super(key: key);

	/// 현재 패널에 대한 상태 만들기, 아래 상태 클래스로 연결
  @override
  State<NavigationPanel> createState() => _NavigationPanelState();
}

/// 네비게이션 패널에 대한 상태 클래스
class _NavigationPanelState extends State<NavigationPanel> {
	/// 동작하는 탭 초기화
  int activeTab = 0;
	
	/// 빌드 옵션 정의 및 빌드될 context 파라미터로 받기, Container 하나가 반환
  @override
  Widget build(BuildContext context) {
    return Container(
			/// 제약조건
      constraints: const BoxConstraints(minWidth: 80),
			/// 데코레이션 == CSS
      decoration: BoxDecoration(
				/// 컬러
        color: Colors.white,
				/// 모서리 둥글기
        borderRadius: BorderRadius.circular(20),
      ),
      /// 마진 값은 Responsive 클래스의 isDesktop 기준 결정하고, context에서 따짐
			margin: Responsive.isDesktop(context)
          ? const EdgeInsets.symmetric(horizontal: 30, vertical: 20)
          : const EdgeInsets.all(10),
			/// 현재 위젯 가로 축이 열 형태인지 행 형태인지 살피기
			/// Column과 Row로 나뉠 단계부터 자식 요소를 수직으로 놓고 싶은지 수평으로 놓고 싶을지 결정됨
      child: widget.axis == Axis.vertical
          ? Column(
							/// 공간 띄워가며 배치
              mainAxisAlignment: MainAxisAlignment.spaceAround,
							/// 실제 위치할 자식 요소들
              children: [
								/// 로고
                Image.asset("assets/logo.png", height: 50),
								/// 수직으로 놓을 자식 요소들
                Column(
									/// 공간 띄워가며 배치
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
									/// 요소 enum과 값 따지고 순회하기
                  children: NavigationItems.values
                      .map(
												/// 버튼 UI 호출하기
                        (e) => NavigationButton(
													/// 눌렀을 때 액션
                          onPressed: () {
														/// 상태 변경
                            setState(() {
                              activeTab = e.index;
                            });
                          },
													/// 아이콘 호출
                          icon: e.icon,
													/// isActive는 값 순회하면서 결정
                          isActive: e.index == activeTab,
                        ),
                      )
                      .toList(), /// 순회할 수 있는 요소임을 뜻함
                ),
                Container()
              ],
            )
          : Row(
							/// 공간 띄워가며 배치
              mainAxisAlignment: MainAxisAlignment.spaceAround,
							/// 로고
              children: [
                Image.asset("assets/logo.png", height: 20),
								/// 수평으로 놓을 자식들
                Row(
									/// 메인 축 정렬 없음
									/// 요소 enum과 값 따지고 순회하기
                  children: NavigationItems.values
                      .map(
												/// 버튼 UI 호출하기
                        (e) => NavigationButton(
													/// 눌렀을 때 액션
                          onPressed: () {
														/// 상태 변경
                            setState(() {
                              activeTab = e.index;
                            });
                          },
													/// 아이콘 호출
                          icon: e.icon,
													/// isActive는 값 순회하면서 결정
                          isActive: e.index == activeTab,
                        ),
                      )
                      .toList(), /// 순회할 수 있는 요소임을 뜻함
                ),
                Container()
              ],
            ),
    );
  }
}
