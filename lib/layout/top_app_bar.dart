/// 반응형 정하는 클래스
import 'package:fintech_dashboard_clone/responsive.dart';

/// iOS 옵션
import 'package:flutter/cupertino.dart';
/// 머티리얼 파일
import 'package:flutter/material.dart';

/// 상태 없는 위젯으로 간주
class TopAppBar extends StatelessWidget {
  /// 키를 가질 수 있음
  const TopAppBar({Key? key}) : super(key: key);

  /// 호출될 때의 context에 따라 다르게 호출됨
  @override
  Widget build(BuildContext context) {
    /// 자신 박스에 대한 패딩
    return Padding(
      padding: const EdgeInsets.all(18.0),
      /// 자식으로 Row를 가짐, 나머지 컨텐츠는 가로로 나열
      child: Row(
        children: [
          /// Row.children[0], Overview 텍스트
          /// 
          /// Responsive.isDesktop과 context에 따라서 보이거나 안 보임
          Visibility(
            visible: Responsive.isDesktop(context),
            /// 자식으로 패딩을 가져 텍스트 영역이 한번 더 감싸짐
            child: const Padding(
              padding: EdgeInsets.only(right: 30.0),
              /// 본문 텍스트, 인수로 내용과 스타일을 지정
              child: Text(
                "Overview",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
          ),
          /// Row.children[1], 검색 바
          Expanded(
            /// flex를 2만큼 가짐
            flex: 2,
            /// 자식으로 Container를 가짐
            child: Container(
              /// 패딩을 갖되 대칭적 수직 및 수평 오프셋 사용하여 삽입물 만들 수 있음
              /// 아래 옵션으로는 가로 여백이 15 픽셀, 세로 여백이 없음
              /// 
              /// 다른 예: 위 아래 여백이 8픽셀, 가로 여백 없음
              /// -> const EdgeInsets.symmetric(vertical: 8.0)
              padding: const EdgeInsets.symmetric(horizontal: 15),
              /// 장식을 갖되 세부 정의 가능 : 박스 데코레이션
              decoration: BoxDecoration(
                /// 테두리를 지름만큼 둥글게, 여기서는 지름 25
                borderRadius: BorderRadius.circular(25),
                /// 색상 하얗게
                color: Colors.white,
              ),
              /// 입력이 가능한 TextField
              child: const TextField(
                /// 장식 갖되 세부 정의 가능 : 인풋 데코레이션
                decoration: InputDecoration(
                  /// TextField 영역을 색상으로 채우기
                  fillColor: Colors.white,
                  /// hintText == placeholder
                  hintText: "Search something...",
                  /// Icon 정의하고 인수에 해당하는 아이콘 불러오기
                  icon: Icon(CupertinoIcons.search),
                  /// 테두리 없애기
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          /// Row.children[2], 이름 및 프로필 사진
          Expanded(
            /// child 부르되 위젯 뱉는 메서드로 처리함, 그러기 위해 context, 이름, 이미지 주소 값 넘김
            child: _nameAndProfilePicture(
              context,
              "Emily Smith",
              "https://image.freepik.com/free-photo/dreamy-girl-biting-sunglasses-looking-away-with-dreamy-face-purple-background_197531-7085.jpg",
            ),
          ),
        ],
      ),
    );
  }

  /// 이 메서드로 위젯을 반환, context와 이름, 이미지 주소를 받음
  Widget _nameAndProfilePicture(
      BuildContext context, String username, String imageUrl) {
    /// Row를 생성하고 내용들은 가로로 나열
    return Row(
      /// ? : 자식의 가로 배열을 만듭니다.
      /// 
      /// [crossAxisAlignment]가 [CrossAxisAlignment.baseline]인 경우 [textBaseline]은 null이 아니어야 합니다.
      /// [textDirection] 인수는 기본적으로 주변 [방향성](있는 경우)으로 설정됩니다.
      /// 
      /// 주변 방향이 없고 레이아웃 순서를 결정하거나(행에 자식이 없거나 하나만 없는 경우가 아니면 항상 해당)
      /// [mainAxisAlignment]의 시작 또는 끝 값을 명확하게 하기 위해 텍스트 방향이 필요한 경우 의 경우 [textDirection]은 null이 아니어야 합니다.
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        /// Row.children[0], 이름
        /// 내용 입력하고 스타일 지정
        Text(
          username,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        /// Row.children[1], 아이콘
        /// 아이콘 간격 지정하고 모양 및 사이즈 결정
        /// 
        /// 대개 이 아이콘 클릭 시 보조 UI가 나와야 할 것,
        /// 메서드로 구현 가능할 것 같음.
        const Padding(
          padding: EdgeInsets.only(left: 6.0),
          child: Icon(
            CupertinoIcons.chevron_down,
            size: 14,
          ),
        ),
        /// Row.children[2], 프사
        /// 모바일 아닐 때만 보이고 패딩 주기
        /// 
        /// 서클 아바타 부르고 배경 이미지에 NetworkImage 결과 대입
        Visibility(
          visible: !Responsive.isMobile(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              /// ? : 주어진 URL에서 이미지를 가져오는 객체를 생성합니다.
              /// [scale] 인수는 이 이미지를 그리기 위한 선형 배율 인수입니다.
              /// 의도한 크기입니다. 자세한 내용은 [ImageInfo.scale]을 참조하세요.
              /// 
              /// ? : const factory NetworkImage(String url, { double scale, Map<String, String>? headers }) = network_image.NetworkImage;
              /// 
              /// 1. 이미지를 가져올 URL
              /// 
              /// 2. 이미지의 [ImageInfo] 개체에 배치할 크기
              /// 
              /// 3. 네트워크에서 이미지를 가져오기 위해 [HttpClient.get]과 함께 사용되는 HTTP 헤더
              /// -> 웹에서 Flutter를 실행할 때 헤더는 사용되지 않습니다.
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
        ),
      ],
    );
  }
}
