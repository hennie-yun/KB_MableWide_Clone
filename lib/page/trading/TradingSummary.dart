import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/CommonColor.dart';

class TradingSummary extends StatelessWidget {
  var isPicked = true.obs;
  var  isSelected = false.obs;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: CommonColor.black, width: 4),
      ),
      child: DefaultTabController(
        length: 1,
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 5,
                      child: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: Color(0xFF7D7E85),
                        labelStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        indicatorColor: Colors.transparent,
                        labelColor: Colors.white,
                        labelPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Tab(text: "종목개요"),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      color: CommonColor.white,
                    )
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        jmSummaryContent(),
                          Visibility(
                              visible:
                                  MediaQuery.of(context).size.height > 900 ||
                                      MediaQuery.of(context).size.width > 900,
                              child: jmSummaryPrice()),
                          Visibility(
                              visible: MediaQuery.of(context).size.height > 900,
                              // MediaQuery.of(context).size.width > 900,
                              child: jmDetailPrice()),
                          Visibility(
                              visible: MediaQuery.of(context).size.height > 900,
                              child: jmspec())
                        ],
                      ),
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

  //첫번째 줄
  Widget jmSummaryContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 종목 영어이름 + 한국어 이름 + downArrow + 돋보기 아이콘
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.yellow, fontSize: 48),
                      children: [
                        TextSpan(
                          text: "TSLA ",
                          style: TextStyle(
                            color: CommonColor.fontYellow,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: " 테슬라 ",
                          style: TextStyle(
                            color: CommonColor.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 3),
                  Icon(Icons.keyboard_arrow_down,
                      color: CommonColor.fontdimmedGrey, size: 16),
                  SizedBox(width: 3),
                  Icon(Icons.search,
                      color: CommonColor.fontdimmedGrey, size: 16),
                ],
              ),
            ),
            SizedBox(width: 5),
            // toggleButtons 달러 + 원

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


            // Obx(() {
            //   return Container(
            //     padding: EdgeInsets.all(0),
            //     height: 20,
            //     decoration: BoxDecoration(
            //       border:
            //           Border.all(width: 1, color: CommonColor.fontdimmedGrey),
            //     ),
            //     child: ToggleButtons(
            //       fillColor: CommonColor.bannerDark_GREY,
            //       selectedColor: Colors.white,
            //       selectedBorderColor: Colors.white,
            //       onPressed: (int index) {
            //         for (int buttonIndex = 0;
            //             buttonIndex < isSelected.length;
            //             buttonIndex++) {
            //           isSelected[buttonIndex] = buttonIndex == index;
            //         }
            //       },
            //       isSelected: isSelected,
            //       children: const [
            //         Text('\$',
            //             style: TextStyle(color: Colors.white, fontSize: 10)),
            //         Text('원',
            //             style: TextStyle(color: Colors.white, fontSize: 10)),
            //       ],
            //     ),
            //   );
            // }),
          ],
        ),
        // 각종 이모지들 모음

      SizedBox(
          child: Row(
            children: [
              iconWithSpacing(Icons.add),
              iconWithSpacing(Icons.tag_outlined),
              iconWithSpacing(Icons.create_outlined),
              Obx(() {
                return InkWell(
                  onTap: () {
                    isPicked.value = !isPicked.value;
                  },
                  child: Icon(
                    isPicked.value ? Icons.star : Icons.star_border_outlined,
                    color:
                        isPicked.value ? Colors.yellow : CommonColor.fontGrey,
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget iconWithSpacing(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Icon(icon, color: CommonColor.fontdimmedGrey),
    );
  }

  //가격
  Widget jmSummaryPrice() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Obx(() {
        return Row(
          children: [
            Text(isSelected.value ? '\$ 240.32' : '312,958 원',
                style: TextStyle(
                    color: CommonColor.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),

            Container(
                child: Row(
              children: [
                Icon(Icons.arrow_drop_down, color: CommonColor.fontDown),
                Text(isSelected.value ? '\$ 6.99 (2.90%)' : '9,078 원 (2.90%)',
                    style: TextStyle(color: CommonColor.fontDown))
              ],
            ))
          ],
        );
      }),
    ]);
  }

  //장후 + 오르고 내린 값
  Widget jmDetailPrice() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('장후', style: TextStyle(color: CommonColor.fontdimmedGrey)),
          Text('303,517원', style: TextStyle(color: CommonColor.fontDown)),
          Icon(Icons.arrow_drop_down, color: CommonColor.fontDown),
          Text('597원 (0.20%)', style: TextStyle(color: CommonColor.fontDown)),
        ],
      ),
    );
  }

  //회사 스팩
  Widget jmspec() {
    return Container(
        child: Row(
      children: [
        Text('나스닥', style: TextStyle(color: CommonColor.fontdimmedGrey)),
        SizedBox(width: 13),
        Text('자동차 및 부품 ', style: TextStyle(color: CommonColor.fontdimmedGrey)),
        SizedBox(width: 13),
        Icon(Icons.info_outline, color: CommonColor.fontdimmedGrey, size: 14),
      ],
    ));
  }
}
