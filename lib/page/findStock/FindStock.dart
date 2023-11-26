import 'package:flutter/material.dart';
import 'package:sm_mdi/constants/CommonColor.dart';

class FindStock extends StatelessWidget {
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
              title("내가 원하는 주식 찾기"),
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
                                subTitle("신고가"),
                                SizedBox(height: 10),
                                increase("1", "assets/images/jm_1.png", "태평양물산", "+",
                                    "5,210원", "1,115원", "(27.92%)"),
                                increase("2", "assets/images/jm7.png", "에스와이스틸텍", "+",
                                    "5,210원", "1,115원", "(27.92%)"),
                                increase("3", "assets/images/jm8.png", "삼성증권", "-",
                                    "5,210원", "1,115원", "(27.92%)"),
                                increase("4", "assets/images/jm10.png", "네이버", "+",
                                    "5,210원", "1,115원", "(27.92%)"),
                                increase("5", "assets/images/jm6.png", "SK하이닉스", "-",
                                    "5,210원", "1,115원", "(27.92%)")
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
                                subTitle("신규상장종목"),
                                SizedBox(height: 10),
                                increase(
                                    "1",
                                    "assets/images/jm10.png",
                                    "협진",
                                    "-",
                                    "5,210원",
                                    "1,115원",
                                    "(27.92%)"),
                                increase(
                                    "2",
                                    "assets/images/jm2.png",
                                    "에코프로",
                                    "-",
                                    "5,210원",
                                    "1,115원",
                                    "(27.92%)"),
                                increase(
                                    "3",
                                    "assets/images/jm_1.png",
                                    "에스와이스틸텍",
                                    "-",
                                    "5,210원",
                                    "1,115원",
                                    "(27.92%)"),
                                increase(
                                    "4",
                                    "assets/images/jm3.png",
                                    "캡스톤파트너스",
                                    "-",
                                    "5,210원",
                                    "1,115원",
                                    "(27.92%)"),
                                increase(
                                    "5",
                                    "assets/images/jm4.png",
                                    "큐로셀",
                                    "-",
                                    "5,210원",
                                    "1,115원",
                                    "(27.92%)")
                              ]))),
                  Visibility(
                      visible: MediaQuery.of(context).size.width > 1300,
                      child:  Expanded(
                          flex: MediaQuery.of(context).size.width > 1300? 1 : 0,
                          child: Container(
                              padding: EdgeInsets.only(right: 40),
                              alignment: Alignment.center,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    subTitle("배당률 높은"),
                                    SizedBox(height: 10),
                                    increase(
                                        "1",
                                        "assets/images/jm2.png",
                                        "제주맥주",
                                        "+",
                                        "5,210원",
                                        "1,115원",
                                        "(27.92%)"),
                                    increase(
                                        "2",
                                        "assets/images/jm1.png",
                                        "에스와이스틸텍",
                                        "+",
                                        "5,210원",
                                        "1,115원",
                                        "(27.92%)"),
                                    increase(
                                        "3",
                                        "assets/images/jm4.png",
                                        "디티엔씨알오",
                                        "+",
                                        "5,210원",
                                        "1,115원",
                                        "(27.92%)"),
                                    increase(
                                        "4",
                                        "assets/images/jm3.png",
                                        "나라셀라",
                                        "+",
                                        "5,210원",
                                        "1,115원",
                                        "(27.92%)"),
                                    increase(
                                        "5",
                                        "assets/images/jm_1.png",
                                        "에스와이스틸텍",
                                        "+",
                                        "5,210원",
                                        "1,115원",
                                        "(27.92%)")
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
    return Container(
        height: 24,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: CommonColor.white),
          ),
          Icon(Icons.arrow_forward_ios_rounded,
              size: 16, color: CommonColor.white)
        ]));
  }

  ///탭들
  Widget increase(String rank, String jmimg, String jmname, String jmsign,
      String jmprice, String jmyield, String increase) {
    return Container(
      // width: 450,
      height: 59,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: CommonColor.fontGrey, width: 1)),
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
                Text(rank, style: TextStyle(color: CommonColor.white)),
                Padding (
                  padding : EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Image.asset(jmimg, width: 28, height: 28),
                ),
                Expanded(child: Text(jmname, overflow: TextOverflow.ellipsis, style: TextStyle(color: CommonColor.white)),)
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end, // Align children to the end (right side)
              children: [
                Text(jmprice, style: TextStyle(fontSize: 14, color: CommonColor.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end, // Align the row to the end (right side)
                  children: [

                    Icon(
                      jmsign == "+"
                          ? Icons.arrow_drop_up_rounded
                          : Icons.arrow_drop_down_rounded,
                      color: jmsign == "+" ? CommonColor.fontUp : CommonColor.fontDown,
                    ),
                    Text(
                      jmyield,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: jmsign == "+" ? CommonColor.fontUp : CommonColor.fontDown,
                      ),
                    ),
                    Text(
                      increase,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: jmsign == "+" ? CommonColor.fontUp : CommonColor.fontDown,
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

}
