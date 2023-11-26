import 'package:flutter/material.dart';
import 'package:sm_mdi/constants/CommonColor.dart';
import 'package:sm_mdi/page/themedStock/ThemedStockPage.dart';

import '../../manager/MenuManager.dart';

class MoneyTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 60),
        width: double.infinity,
        height: 403,
        //
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title("요즘 돈이 몰리는 국내 테마"),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          padding: EdgeInsets.only(right: 40),
                          alignment: Alignment.center,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                subTitle("주류업(주정,에탄올 등)", "5.63%"),
                                SizedBox(height: 10),
                                increase("1", "제주맥주", "27.92%"),
                                increase("2", "나라셀라", "27.92%"),
                                increase("3", "국순당", "27.92%"),
                                increase("4", "보해양조", "27.92%"),
                                increase("5", "풍국주정", "27.92%"),
                              ]))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          padding: EdgeInsets.only(right: 40),
                          alignment: Alignment.center,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                subTitle("온실가스(탄소배출권)", "2.70%"),
                                SizedBox(height: 10),
                                increase("1", "에스와이스틸텍", "27.92%"),
                                increase("2", "SK에너지", "27.92%"),
                                increase("3", "한화에너지", "27.92%"),
                                increase("4", "LG에너지 솔루션", "27.92%"),
                                increase("5", "어쩌고저쩌고", "27.92%"),
                              ]))),
                  Visibility(
                      visible: MediaQuery.of(context).size.width > 1300,
                      child: Expanded(
                          flex:
                              MediaQuery.of(context).size.width > 1300 ? 1 : 0,
                          child: Container(
                              padding: EdgeInsets.only(right: 40),
                              alignment: Alignment.center,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    subTitle("창투사", "1.93%"),
                                    SizedBox(height: 10),
                                    increase("1", "캡스톤파트너스", "27.92%"),
                                    increase("2", "대성참투", "27.92%"),
                                    increase("3", "우리기술투자", "27.92%"),
                                    increase("4", "나주IB", "27.92%"),
                                    increase("5", "리더스 기술투자", "27.92%"),
                                  ]))))
                ],
              )
            ]));
  }

  ///맨위의 타이틀
  Widget title(String title) {
    return Container(
        height: 36,
        child: TextButton(
            onPressed: (){
              MenuManager.instance.movePage(ThemedStockPage());
            },
            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent), padding: MaterialStateProperty.all(EdgeInsets.zero)),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: CommonColor.white),
              ),
              Icon(Icons.arrow_forward_ios_rounded,
                  size: 20, color: CommonColor.white)
            ])
          )
        );
  }

  ///작은 타이틀
  Widget subTitle(String title, String percent) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: CommonColor.white),
          ),
          SizedBox(height: 5),
          Text(percent,
              style: TextStyle(
                  color: CommonColor.fontUp,
                  fontSize: 24,
                  fontWeight: FontWeight.w700))
        ]));
  }

  ///탭들
  Widget increase(String rank, String jmname, String increase) {
    return Container(
      // width: 450,
      height: 41,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: CommonColor.fontGrey, width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 9),
            child: Row(
              children: [
                Text(rank, style: TextStyle(color: CommonColor.white)),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                ),
                Text(jmname,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: CommonColor.white)),
              ],
            ),
          ),
          Text(
            increase,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: CommonColor.fontUp),
          ),
        ],
      ),
    );
  }
}
