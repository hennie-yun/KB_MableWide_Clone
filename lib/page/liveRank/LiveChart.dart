import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../StoreUtils/StoreUtils.dart';
import '../../constants/CommonColor.dart';
import 'LiveChartController.dart';

class LiveChart extends StatelessWidget {
  final LiveChartController controller = Get.put(LiveChartController());

  final int initialTabIndex;

  LiveChart({required this.initialTabIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [title("실시간 국내주식 랭킹"), tabBar()],
        ));
  }

  Widget title(String title) {
    return SizedBox(
        height: 34,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 24,
              color: CommonColor.white,
              fontWeight: FontWeight.w600),
        ));
  }

  Widget tabBar() {
    return Container(
      // width: 1000,
      height: 500,
      child: DefaultTabController(
        length: 5,
        initialIndex: initialTabIndex,
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Align(
                alignment: Alignment.centerLeft, // Align the tabs to the left
                child: TabBar(
                  isScrollable: true,
                  labelColor: Color(0xFFf2f219),
                  unselectedLabelColor: Color(0xFF7D7E85),
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 16,
                  ),
                  indicatorColor: Color(0xFFf2f219),
                  indicatorWeight: 2,
                  indicatorSize: TabBarIndicatorSize.tab,
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  indicatorPadding: EdgeInsets.only(top: 12),
                  tabs: [
                    Tab(text: "많이 오른"),
                    Tab(text: "많이 내린"),
                    Tab(text: "거래 대금"),
                    Tab(text: "거래량"),
                    Tab(text: "시가총액"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    chartContents(),
                    const Center(
                      child: Text('내용 2'),
                    ),
                    const Center(
                      child: Text('내용 3'),
                    ),
                    const Center(
                      child: Text('내용 4'),
                    ),
                    const Center(
                      child: Text('내용 5'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget chartContents() {
    return DataTable(
      border: const TableBorder(
        verticalInside: BorderSide(
          width: 1,
          color: Color(0xFF74737f),
        ),
        horizontalInside: BorderSide(
          width: 1,
          color: Color(0xFF74737f),
        ),
      ),
      columns: const [
        DataColumn(
            label: Expanded(
          flex: 10,
          child: Text('종목명',
              textAlign: TextAlign.left, style: TextStyle(color: Colors.white)),
        )),
        DataColumn(
            label: Expanded(
          flex: 1,
          child: Text('현재가',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
        )),
        DataColumn(
            label: Expanded(
          flex: 1,
          child: Text('전일대비',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
        )),
        DataColumn(
            label: Expanded(
          flex: 1,
          child: Text('등락률',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
        )),
        DataColumn(
            label: Expanded(
          flex: 1,
          child: Center(
            child: Text('찜하기',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)),
          ),
        )),
      ],
      rows: [
        buildDataRow(
            "assets/images/jm2.png", "제주맥주", "+", "19,060", "8,060", "76.5%"),
        buildDataRow(
            "assets/images/jm2.png", "삼성증권", "-", "19,060", "8,060", "56.5%"),
      ],
    );
  }

  /// DataRow 모음
  DataRow buildDataRow(String jmImg, String jmName, String sign,
      String jmCurrentPrice, String jmPriceBefore, String jmYield) {
    return DataRow(cells: [
      DataCell(
        Row(
          children: [
            Image.asset(
              jmImg,
              width: 28,
              height: 28,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(jmName,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: CommonColor.white)),
            )
          ],
        ),
      ),
      DataCell(
        Align(
          alignment: Alignment.centerRight,
          child: Text(jmCurrentPrice,
          textAlign: TextAlign.right,
          style: TextStyle(
              color:
                  sign == "+" ? CommonColor.fontUp : CommonColor.fontDown)),
        ),
        showEditIcon: false,
      ),
      DataCell(
        Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                    sign == "+"
                        ? Icons.arrow_drop_up_outlined
                        : Icons.arrow_drop_down_outlined,
                    color: sign == "+"
                        ? CommonColor.fontUp
                        : CommonColor.fontDown),
                Text(jmPriceBefore,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: sign == "+"
                            ? CommonColor.fontUp
                            : CommonColor.fontDown)),
              ],
            )),
        showEditIcon: false,
      ),
      DataCell(
        Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                    sign == "+"
                        ? Icons.arrow_drop_up_outlined
                        : Icons.arrow_drop_down_outlined,
                    color: sign == "+"
                        ? CommonColor.fontUp
                        : CommonColor.fontDown),
                Text(jmYield,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: sign == "+"
                            ? CommonColor.fontUp
                            : CommonColor.fontDown)),
              ],
            )),
        showEditIcon: false,
      ),
      DataCell(
        Center(
          child: FutureBuilder<bool?>(
            future: StoreUtils.instance.checkStar(jmName), // jmName 전달
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // 로딩 중 표시
              } else {
                bool isPicked = snapshot.data ?? false;
                return InkWell(
                  onTap: () async {
                    await StoreUtils.instance.pick(jmName); // pick 메서드를 비동기로 실행
                  },
                  child: Icon(
                    isPicked ? Icons.star : Icons.star_border_outlined,
                    color: isPicked ? Colors.yellow : CommonColor.fontGrey,
                  ),
                );
              }
            },
          ),
        ),
        showEditIcon: false,
      ),
    ]);
  }
}
