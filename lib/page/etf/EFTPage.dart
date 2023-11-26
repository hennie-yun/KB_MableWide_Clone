import 'package:flutter/material.dart';
import 'package:sm_mdi/constants/CommonColor.dart';

class ETFPage extends StatelessWidget {
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
              title("ETF TOP5"),
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
                                subTitle("인기검색"),
                                SizedBox(height: 10),
                                increase("1", "TIGER 2차전지테마", "27.92%"),
                                increase("2", "TIGER 일본엔선물", "27.92%"),
                                increase("3", "KODEX 코스닥150레버리지", "27.92%"),
                                increase("4", "KODEX 200선물인버스2X", "27.92%"),
                                increase("5", "TIGER 미국나스닥100", "27.92%"),
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
                                subTitle("수익률"),
                                SizedBox(height: 10),
                                increase("1", "에스와이스틸텍", "27.92%"),
                                increase("2", "KBSTAR Fn5테크", "27.92%"),
                                increase("3", "WTI원유선물인버스", "27.92%"),
                                increase("4", "이머징마켓레버리지", "27.92%"),
                                increase("5", "미국나스닥임당", "27.92%"),
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
                                    subTitle("거래대금상세"),
                                    SizedBox(height: 10),
                                    increase("1", "TIGER 2차전지테마", "27.92%"),
                                    increase("2", "TIGER 일본엔선물", "27.92%"),
                                    increase("3", "어쩌고저쩌고", "27.92%"),
                                    increase("4", "ABCEYTE 가나다", "27.92%"),
                                    increase("5", "ZYXQ 라마갸", "27.92%"),
                                  ]))))
                ],
              )
            ]));
  }

  ///맨위의 타이틀
  Widget title(String title) {
    return Container(
        height: 36,
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
        ]));
  }

  ///작은 타이틀
  Widget subTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: CommonColor.white),
    );
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
          Expanded(
            flex: 1 ,
            // padding: const EdgeInsets.fromLTRB(10, 10, 0, 9),
            child: Row(
              children: [
                Text(rank, style: TextStyle(color: CommonColor.white)),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                ),
                Expanded(child: Text(jmname,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: CommonColor.white))),
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
