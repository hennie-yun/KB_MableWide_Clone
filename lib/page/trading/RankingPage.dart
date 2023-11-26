import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/CommonColor.dart';

class RankingPage extends StatelessWidget {
  var  isSelected = false.obs;


  @override
  Widget build(BuildContext context) {
    return Container(
        // width: 355,
        decoration: BoxDecoration(
          border: Border.all(color: CommonColor.black, width: 4)),
        child: tabBar());
  }

  Widget tabBar() {
    return DefaultTabController(
      length: 2,
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
                      // Set indicatorColor to transparent
                      labelColor: Colors.white,
                      labelPadding: EdgeInsets.all(10),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(text: "찜한주식"),
                        Tab(text: "실시간뱅킹"),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        pickStock(),
                        chooselist('한국전력', '+', '18,700원', '550원', '(3.03%)'),
                        chooselist('한국전력', '+', '18,700원', '550원', '(3.03%)'),
                        chooselist('한국전력', '+', '18,700원', '550원', '(3.03%)')

                        ///탭 내용으로 들어갈 자리
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        liveBanking(),
                        chooselist('한국전력', '+', '18,700원', '550원', '(3.03%)'),
                        chooselist('한국전력', '+', '18,700원', '550원', '(3.03%)'),
                        chooselist('한국전력', '+', '18,700원', '550원', '(3.03%)')

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //찜한 주식 탭
  Widget pickStock() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: CommonColor.fontdimmedGrey,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '관심 종목',
            style: TextStyle(
              fontSize: 14,
              color: CommonColor.white,
            ),
          ),
          Icon(Icons.arrow_drop_down, color: CommonColor.white),
        ],
      ),
    );
  }

  //주식 리스트
  Widget chooselist(String jmname, String jmsign, String jmprice,
      String jmyield, String increase) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 60,
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: CommonColor.fontGrey, width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            // padding: const EdgeInsets.fromLTRB(10, 10, 0, 9),
            child: Row(
              children: [
                Expanded(
                  child: Text(jmname,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: CommonColor.white)),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(jmprice,
                    style: TextStyle(fontSize: 14, color: CommonColor.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // Align the row to the end (right side)
                  children: [
                    Icon(
                      jmsign == "+"
                          ? Icons.arrow_drop_up_rounded
                          : Icons.arrow_drop_down_rounded,
                      color: jmsign == "+"
                          ? CommonColor.fontUp
                          : CommonColor.fontDown,
                    ),
                    Text(
                      jmyield,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: jmsign == "+"
                            ? CommonColor.fontUp
                            : CommonColor.fontDown,
                      ),
                    ),
                    Text(
                      increase,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: jmsign == "+"
                            ? CommonColor.fontUp
                            : CommonColor.fontDown,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  //실시간랭킹 탭
  Widget liveBanking() {
    List<String> dropdownList = ['많이 오른', '많이 내린', '거래 대금', '거래량'];

    var selectedDropdown = '많이 오른'.obs;

    return Row(
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
                          isSelected.value = !isSelected.value;
                        },
                        style:
                        ElevatedButton.styleFrom(
                            backgroundColor: isSelected.value? CommonColor.fontGrey : CommonColor.bgDarkMode,
                            minimumSize: Size(60, 40)),
                        child:
                        Text('국내', style: TextStyle(color: Colors.white))),
                    TextButton(
                        onPressed: () {
                          isSelected.value = !isSelected.value;
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: isSelected.value? CommonColor.bgDarkMode : CommonColor.fontGrey,
                            minimumSize: Size(60, 40)),
                        child:
                        Text('해외', style: TextStyle(color: Colors.white))),
                  ],
                ));
          }),
          SizedBox(width: 200),
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
        ],
      );
  }
}
