// 스타일 파일
import 'package:fintech_dashboard_clone/styles/styles.dart';
// 자체 material.dart
import 'package:flutter/material.dart';

/// 네비게이션 버튼 클래스, 상태 없는 위젯
class NavigationButton extends StatelessWidget {
  /// 생성자
  /// 키 받을 시 부모로 전달
  /// onPressed, icon을 필수 정보로 받음
  /// isActive는 false로 초기화
  const NavigationButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.isActive = false,
  }) : super(key: key);

  /// 클릭 시 void로 끝나는 콜백
  final VoidCallback onPressed;
  /// 아이콘 데이터
  final IconData icon;
  /// 작동 중 뜻하는 bool
  final bool isActive;

  /// 빌드 시, 빌드 중 context를 파라미터로 받음
  @override
  Widget build(BuildContext context) {
    /// 컨테이너 반환
    return Container(
      /// 각 버튼의 마진 값
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      /// 각 버튼 장식
      decoration: BoxDecoration(
        /// 색상
        color: isActive
            ? Styles.defaultYellowColor
            : Styles.defaultLightWhiteColor,
        /// 모양
        shape: BoxShape.circle,
      ),
      /// 자식이 있다?
      child: IconButton(
        /// 버튼 동작 대한 prop, 콜백 대입
        onPressed: onPressed,
        /// 아이콘 생성
        icon: Icon(
          /// 아이콘 모양
          icon,
          /// 사이즈
          size: 20,
          /// 색상
          color: isActive ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
