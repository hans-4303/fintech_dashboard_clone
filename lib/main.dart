/// 상단은 현재 프로젝트의 lib 폴더 내에 있는 dart 파일들
import 'package:fintech_dashboard_clone/layout/app_layout.dart';

/// 모델 파일, 클래스로 구성되며 생성자로 멤버 대입함
/// 타입과 유사
import 'package:fintech_dashboard_clone/models/card_details.dart';
import 'package:fintech_dashboard_clone/models/enums/card_type.dart';

/// 반응형 구성 파일
import 'package:fintech_dashboard_clone/responsive.dart';

/// 표시할 각 섹션 파일
import 'package:fintech_dashboard_clone/sections/expense_income_chart.dart';
import 'package:fintech_dashboard_clone/sections/latest_transactions.dart';
import 'package:fintech_dashboard_clone/sections/statics_by_category.dart';
import 'package:fintech_dashboard_clone/sections/upgrade_pro_section.dart';
import 'package:fintech_dashboard_clone/sections/your_cards_section.dart';

/// 스타일 파일
import 'package:fintech_dashboard_clone/styles/styles.dart';

/// 이건 C:// 내에 설치한 flutter 패키지 안에 있는 material.dart 파일
/// 그래서 flutter 파일은 접근 권한 필요 없는 폴더 내에 있어야 하고 프로젝트 할 때는 확실히 환경 변수까지 연결되어 있어야 함
import 'package:flutter/material.dart';

/// 메인 메서드에서 앱 실행
void main() {
  runApp(const FintechDasboardApp());
}

/// 클래스 구조로 이루어짐, 최상위에서는 상태 사용 없다 전제한 걸로 보임
class FintechDasboardApp extends StatelessWidget {
  const FintechDasboardApp({Key? key}) : super(key: key);

  /// 위젯 빌드로 이어짐, 빌드 컨텍스트도 있으나 쓰이진 않았음
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Styles.scaffoldBackgroundColor,
        scrollbarTheme: Styles.scrollbarTheme,
      ),
      home: const HomePage(),
    );
  }
}

/// 상위에서는 상태 사용 가능하다 전제한 걸로 보임
///
/// ! key 전달은 자신을 호출하는 상위 위젯에게 전달하는 게 아니라, 상속받은 부모 클래스(위젯) 생성자에게 전달하는 것.
/// key를 전달하는 이유는 프레임워크가 위젯 트리 내에서 각 위젯을 유일하게 식별, 관리할 수 있도록 하기 위함임.
/// key는 특히 위젯 위치나 상태가 동적으로 변경될 때 중요한 역할을 함.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          /// Row를 통해 나열했음
          content: Row(
            /// Row 하나에 children 요소가 둘 형성됐다 볼 수 있음
            children: [
              /// Main Panel, 첫번째 Column이 되어 왼쪽에 정렬
              Expanded(
                child: Column(
                  /// 나열될 요소들을 다시 Column.children으로 만듦,
                  /// 이때는 세로로 나열됨
                  children: [
                    const Expanded(
                      /// 이 flex는 Column.children[0]의 높이 값
                      flex: 2,
                      child: ExpenseIncomeCharts(),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Styles.defaultPadding,
                        ),
                        child: const UpgradeProSection(),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: LatestTransactions(),
                    ),
                  ],
                ),
                /// 이 flex는 Row.children[0]의 너비
                flex: 5,
              ),
              /// Right Panel, 두번째 Column이 되어 오른쪽에 정렬
              Visibility(
                /// Responsive 파일을 통해 정의해놓은 isDesktop 조건으로 보이고 <-> 숨김
                /// context가 넘어가서 MediaQuery.of(context).size.width 조건을 따져줌
                visible: Responsive.isDesktop(context),
                child: Expanded(
                  child: Padding(
                    /// 패널이 어느 정도 패딩 갖는지, 여기서는 왼쪽 패딩으로 사용됨
                    padding: EdgeInsets.only(left: Styles.defaultPadding),
                    /// 패널 안의 child는 Column으로 구성
                    child: Column(
                      children: [
                        /// Column.children[0]을 카드 섹션으로
                        CardsSection(
                          cardDetails: [
                            CardDetails("431421432", CardType.visa),
                            CardDetails("423142231", CardType.mastercard),
                          ],
                        ),
                        /// Column.children[1]을 카테고리 따른 차트로
                        /// 호버링 통해서 스크롤 가능
                        const Expanded(
                          child: StaticsByCategory(),
                        ),
                      ],
                    ),
                  ),
                  flex: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
