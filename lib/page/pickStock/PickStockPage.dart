import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../constants/CommonColor.dart';
import 'PickStockPageController.dart';

class PickStockPage extends StatelessWidget {
  PickStockPageController controller = PickStockPageController();
  RxBool show = true.obs;
 var  isSelected = false.obs;
 var isSelling = true.obs;
  List<String> dropdownList = [
    '국민은행 402402-04-136-462',
    '신한은행 402402-04-136-462',
    '하나은행 402402-04-136-462'
  ];
  var selectedDropdown = '국민은행 402402-04-136-462'.obs;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            // height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.fromLTRB(15, 50, 15, 0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title("찜한 주식"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    tabBar(),
                    Obx(() {
                      return Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                  color: CommonColor.borderGrey, width: 4.5),
                            ),
                          ),
                          child: Visibility(
                              visible: show.value,
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: 330,
                                child: toggleContent(),
                              )));
                    })
                  ],
                )
              ],
            )));
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
    return Expanded(
        flex: 2,
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          width: 1000,
          height: 500,
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: TabBar(
                            isScrollable: true,
                            unselectedLabelColor: const Color(0xFF7D7E85),
                            labelStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            unselectedLabelStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            indicatorColor: Colors.white,
                            indicatorWeight: 2,
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 3.5,
                            ),
                            indicatorPadding:
                                const EdgeInsets.fromLTRB(0, 9, 0, 9),
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0XFF2f2f3b),
                              shape: BoxShape.rectangle,
                            ),
                            tabs: [
                              const Tab(text: "최근조회"),
                              const Tab(text: "보유종목"),
                              const Tab(text: "관심그룹001"),
                              const Tab(text: "관심그룹002"),
                            ],
                          )),
                          Expanded(
                              child: Container(
                                  width: 200,
                                  height: 35,

                                  //타입 바꾸기
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Obx(() {
                                        return InkWell(
                                            onTap: () {
                                              controller.changeType();
                                            },
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 2, 5, 2),
                                                width: 80,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                  child: Text(
                                                    '${controller.type.value}',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                )));
                                      }),
                                      const SizedBox(width: 5),
                                      //차트버튼
                                      SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: TextButton(
                                              onPressed: () {},
                                              child: Icon(Icons.insert_chart,
                                                  color: CommonColor.white),
                                              style: ButtonStyle(
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          const EdgeInsets.all(
                                                              0))))),
                                      //설정버튼
                                      SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: TextButton(
                                              onPressed: () {},
                                              child: Icon(
                                                  Icons.settings_rounded,
                                                  color: CommonColor.white),
                                              style: ButtonStyle(
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          const EdgeInsets.all(
                                                              0))))),
                                      //토글 버튼
                                      SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: TextButton(
                                          onPressed: () {
                                            show.value = !show.value;
                                            print(show.value);
                                          },
                                          child: Obx(() {
                                            return Icon(
                                              show.value
                                                  ? Icons
                                                      .keyboard_double_arrow_right
                                                  : Icons
                                                      .keyboard_double_arrow_left,
                                              color: CommonColor.white,
                                              size: 30,
                                            );
                                          }),
                                          style: ButtonStyle(
                                            // Adjust padding as needed, or remove this line
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.all(8)),
                                          ),
                                        ),
                                      )
                                    ],
                                  )))
                        ]),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  /// DataColumn모음
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
          child: Text('요약차트',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
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
          child: Text('거래량',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
        )),
        DataColumn(
            label: Expanded(
          flex: 1,
          child: Text('시가총액',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
        )),
      ],
      rows: [
        buildDataRow("assets/images/jm2.png", "제주맥주", "+", "22,500", "10,200",
            "55.5%", "7,800,000원", "1,234"),
        buildDataRow("assets/images/jm2.png", "삼성증권", "-", "15,800", "6,500",
            "68.2%", "4,500,000원", "5,678"),
        buildDataRow("assets/images/jm3.png", "SK하이닉스", "+", "32,150", "12,350",
            "45.8%", "9,120,000원", "9,101"),
        buildDataRow("assets/images/jm4.png", "카카오", "-", "18,920", "7,800",
            "61.2%", "5,600,000원", "1,122"),
        buildDataRow("assets/images/jm5.png", "LG에너지솔루션", "+", "25,300",
            "11,500", "54.5%", "8,200,000원", "3,344"),
        buildDataRow("assets/images/jm6.png", "한화", "-", "20,750", "9,800",
            "47.3%", "6,900,000원", "5,566"),
        buildDataRow("assets/images/jm7.png", "한진", "-", "28,600", "13,200",
            "55.8%", "10,500,000원", "7,788"),
        buildDataRow("assets/images/jm8.png", "카카오모빌리티", "-", "16,480", "7,000",
            "59.2%", "4,800,000원", "9,900"),
        buildDataRow("assets/images/jm9.png", "토스", "+", "30,700", "14,500",
            "48.1%", "11,200,000원", "1,122"),
        buildDataRow("assets/images/jm10.png", "아오", "+", "21,800", "10,000",
            "54.1%", "7,600,000원", "3,344"),
      ],
    );
  }

  /// DataRow 모음
  DataRow buildDataRow(
      String jmImg,
      String jmName,
      String sign,
      String jmCurrentPrice,
      String jmPriceBefore,
      String jmYield,
      String amount,
      String totalStock) {
    return DataRow(cells: [
      // 종목명
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
      //요약차트
      DataCell(
        Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
                sign == "+"
                    ? 'assets/images/red_chart.png'
                    : 'assets/images/blue_chart.png',
                width: 60,
                height: 50)),
        showEditIcon: false,
      ),
      //현재가
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
      //전일대비
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
      //등락률
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
      //거래량
      DataCell(
        Align(
          alignment: Alignment.centerRight,
          child: Text(amount,
              textAlign: TextAlign.right,
              style: const TextStyle(color: Color(0xFFB2B4Bf))),
        ),
        showEditIcon: false,
      ),
      //시가총액
      DataCell(
        Align(
          alignment: Alignment.centerRight,
          child: Text(totalStock,
              textAlign: TextAlign.right,
              style: const TextStyle(color: Color(0xFFB2B4BF))),
        ),
        showEditIcon: false,
      ),
    ]);
  }

  Widget toggleContent() {
    return Container(
        // decoration: BoxDecoration(color: Colors.lightGreen),
        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //종목명 + 아이콘들
            name(),
            // 국가랑 어떤 산업인지
            info(),
            //금액 + 토글 버튼
            price(),
            //이미지
            Image.asset('assets/images/fav_img.png'),
            //매수매도 토글 + 계좌
            account(),
            //주문 유형
            selectOrder(),
            //구매가 + 최대 인지 반틈인지  버튼
            selectPrice(),
            //수량 + 계산기 버튼
            amountCal(),
            //쿠폰 선택> -> 오른쪽 정렬
            coupon(),
            //차트 + 현금 매수 버튼
            buttons()
          ],
        ));
  }

  //종목명 + 아이콘들
  Widget name() {
    var isPicked = true.obs;
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.yellow, fontSize: 48),
                children: [
                  TextSpan(
                      text: "TSLA",
                      style: TextStyle(
                          color: CommonColor.fontYellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  TextSpan(
                      text: "테슬라",
                      style: TextStyle(
                          color: CommonColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(width: 80),
            Container(
                child: Row(
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 3),
                    width: 60,
                    height: 20,
                    color: CommonColor.lineGrey,
                    child: Text(
                      '실시간Lite',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: CommonColor.white, fontSize: 11),
                    )),
                const SizedBox(width: 5),
                Icon(Icons.insert_chart, color: CommonColor.white),
                const SizedBox(width: 5),
                Obx(() {
                  return InkWell(
                      onTap: () {
                        isPicked.value = !isPicked.value;
                      },
                      child: Icon(
                        isPicked.value
                            ? Icons.star
                            : Icons.star_border_outlined,
                        color: isPicked.value
                            ? Colors.yellow
                            : CommonColor.fontGrey,
                      ));
                }),
              ],
            ))
          ],
        ));
  }

  // 국가랑 어떤 산업인지
  Widget info() {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
        child: Row(
          children: [
            Text('미국', style: TextStyle(color: CommonColor.fontdimmedGrey)),
            const SizedBox(width: 15),
            Text('나스닥', style: TextStyle(color: CommonColor.fontdimmedGrey)),
            const SizedBox(width: 15),
            Text('자동차 및 부품',
                style: TextStyle(color: CommonColor.fontdimmedGrey)),
          ],
        ));
  }

  //금액 + 토글 버튼
  Widget price() {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Obx(() {
            return Text(isSelected.value ? '\$ 240.32' : '312,958 원',
                style: TextStyle(
                    color: CommonColor.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold));
          }),
          Obx(() {
            return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: CommonColor.fontGrey, width: 1)),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          isSelected.value = !isSelected.value;
                        },
                        style:
                            ElevatedButton.styleFrom(
                                backgroundColor: isSelected.value? CommonColor.fontGrey : CommonColor.bgDarkMode,
                                minimumSize: Size(40, 40)),
                        child:
                            Text('\$', style: TextStyle(color: Colors.white))),
                    TextButton(
                        onPressed: () {
                          isSelected.value = !isSelected.value;
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: isSelected.value? CommonColor.bgDarkMode : CommonColor.fontGrey,
                            minimumSize: Size(40, 40)),
                        child:
                            Text('원', style: TextStyle(color: Colors.white))),
                  ],
                ));
          })
        ]));
  }

  //매수매도 토글 + 계좌
  Widget account() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: CommonColor.fontGrey, width: 1)),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          isSelling.value = !isSelling.value;
                        },
                        style:
                        ElevatedButton.styleFrom(
                            backgroundColor: isSelling.value? CommonColor.fontGrey : CommonColor.bgDarkMode,
                            minimumSize: const Size(60, 40)),
                        child:
                        const Text('매수', style: TextStyle(color: Colors.white))),
                    TextButton(
                        onPressed: () {
                          isSelling.value = !isSelling.value;
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: isSelling.value? CommonColor.bgDarkMode : CommonColor.fontGrey,
                            minimumSize: const Size(60, 40)),
                        child:
                        const Text('매도', style: TextStyle(color: Colors.white))),
                  ],
                ));
          }),
          SizedBox(width: 10),
          Obx(() {
            return Expanded(
              child: Container(
                width: 170,

                child: DropdownButton(
                  isExpanded: true, // Set this to true
                  value: selectedDropdown.value,
                  dropdownColor : CommonColor.fontdimmedGrey,
                  items: dropdownList.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        '$item',
                        style: TextStyle(
                          color: CommonColor.white ,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (dynamic value) {
                    selectedDropdown.value = value;
                  },
                ),
              ),
            );
          }),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
            },
            child: Container(
              width: 40,
              height: 40,
              color: CommonColor.bannerDark_GREY,
              padding: const EdgeInsets.all(5),
              child: Icon(Icons.lock_open, color: CommonColor.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }





  //주문 유형
  /// popup 띄어서 안에 title 바꾸어야 함
  Widget selectOrder() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: CommonColor.fontdimmedGrey,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '지정가',
                    style: TextStyle(
                      fontSize: 14,
                      color: CommonColor.white,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: CommonColor.white),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

//구매가 + 최대 인지 반틈인지  버튼
  Widget selectPrice() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: CommonColor.fontdimmedGrey,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '-',
                      style: TextStyle(
                        fontSize: 24,
                        color: CommonColor.bannerDark_GREY,
                      ),
                    ),
                  ),
                  Text(
                    ' 240.54 ',
                    style: TextStyle(
                      fontSize: 14,
                      color: CommonColor.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 24,
                        color: CommonColor.bannerDark_GREY,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        CommonColor.bannerDark_GREY,
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        CommonColor.white,
                      ),
                      fixedSize: MaterialStateProperty.all<Size>(
                        const Size.fromHeight(40),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(0),
                      ),
                    ),
                    child: const Text('최대', style: TextStyle(fontSize: 12)),
                  ),
                ),
                const SizedBox(width: 3),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        CommonColor.bannerDark_GREY,
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        CommonColor.white,
                      ),
                      fixedSize: MaterialStateProperty.all<Size>(
                        const Size.fromHeight(40),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(0),
                      ),
                    ),
                    child: const Text('1/2', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //수량 + 계산기
  Widget amountCal() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 2,
              child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: CommonColor.fontdimmedGrey,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(5.0) // POINT
                            ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text('-',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: CommonColor.bannerDark_GREY))),
                        Text(' 수량 ',
                            style: TextStyle(
                                fontSize: 14,
                                color: CommonColor.bannerDark_GREY)),
                        TextButton(
                            onPressed: () {},
                            child: Text('+',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: CommonColor.bannerDark_GREY))),
                      ]))),
          const SizedBox(width: 10),
          Expanded(
              child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(CommonColor.bannerDark_GREY),
              foregroundColor:
                  MaterialStateProperty.all<Color>(CommonColor.white),
              fixedSize:
                  MaterialStateProperty.all<Size>(const Size.fromHeight(40)),
            ),
            child: const Text('계산기', style: TextStyle(fontSize: 14)),
          )),
        ],
      ),
    );
  }

  //쿠폰 선택
  Widget coupon() {
    return Container(
        padding: const EdgeInsets.fromLTRB(250, 10, 0, 0),
        child: Text('쿠폰선택 >',
            textAlign: TextAlign.right,
            style: TextStyle(color: CommonColor.fontdimmedGrey)));
  }

//차트 + 현금 매수 버튼
  Widget buttons() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    CommonColor.bannerDark_GREY),
                foregroundColor:
                    MaterialStateProperty.all<Color>(CommonColor.white),
                fixedSize:
                    MaterialStateProperty.all<Size>(const Size.fromHeight(48)),
              ),
              child: Icon(Icons.add_chart_outlined, color: CommonColor.white),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 4,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                fixedSize:
                    MaterialStateProperty.all<Size>(const Size.fromHeight(48)),
              ),
              child: const Text('현금매수',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
