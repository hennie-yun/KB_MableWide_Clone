import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/CommonColor.dart';
import '../../dialog/BasePopUpWindow.dart';
import '../../dialog/NewsDialog.dart';

class NewsDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            // width: 1280,
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title("이 시각 국내 헤드라인 뉴스"),
                SizedBox(height: 20),
                subTitle("11/21", "afternoon"),
                SizedBox(height: 10),
                InkWell(
                    onTap: () {
                      popWindow(context, "뉴스", NewsDialog());
                    },
                    child: news("23/11/21 12:36",
                        "달러화 약세.위안화 강세~~~~~~~~~~~~~~~~", "연합뉴스")),
                InkWell(
                    onTap: () {
                      popWindow(context, "뉴스", NewsDialog());
                    },
                    child:
                        news("23/11/21 12:36", "케이티엔지는 왜 전담에 냉담 한걸까?", "이데일리")),
                InkWell(
                    onTap: () {
                      popWindow(context, "뉴스", NewsDialog());
                    },
                    child: news("23/11/21 12:36",
                        "또 불어온 에이아이 훈풍~~ 이미 최고가 앤디비아의 실체", "이투데이")),
                InkWell(
                    onTap: () {
                      popWindow(context, "뉴스", NewsDialog());
                    },
                    child: news("23/11/21 12:36",
                        "10월 회사채 발행 10% 감소 신용등급 따라 양극화 계속 되어", "머니투데이")),
                InkWell(
                    onTap: () {
                      popWindow(context, "뉴스", NewsDialog());
                    },
                    child: news("23/11/21 12:36",
                        "11월 1~20일 수출 2.2% 증가 무역적자 어쩌고저꺼고~~~ ", "어쩌고뉴스")),
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

  Widget subTitle(String today, String time) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
        width: 1280,
        height: 38,
        color: const Color(0xFF29272E),
        child: Row(children: [
          Text(today, style: TextStyle(color: Color(0xFF91949E), fontSize: 14)),
          SizedBox(width: 15),
          Text(
              time == "monring" ? "오전장 (09:00 ~ 12:00)" : "오후장 (12:00 ~ 15:30)",
              style: TextStyle(color: Color(0xFF91949E), fontSize: 14))
        ]));
  }

  Widget news(String date, String headline, String company) {
    return Container(
        height: 87,
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: CommonColor.fontGrey, width: 1)),
        ),
        child: Row(
          children: [
            Expanded(
                child: Text(date,
                    style:
                        TextStyle(color: CommonColor.fontGrey, fontSize: 13))),
            SizedBox(width: 10),
            Expanded(
                flex: 8,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: headline,
                        style: TextStyle(
                          color: CommonColor.white,
                          fontSize: 16,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(width: 10),
                      ),
                      TextSpan(
                        text: company,
                        style: TextStyle(
                          color: CommonColor.fontGrey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                )),
            getImageWidget(newsSource: company)
          ],
        ));
  }

  Widget getImageWidget({required String newsSource}) {
    String imagePath;
    switch (newsSource) {
      case '연합뉴스':
        imagePath = 'assets/images/yh_news.png';
        break;
      case '머니투데이':
        imagePath = 'assets/images/mt_news.png';
        break;
      case '이데일리':
        imagePath = 'assets/images/edaily_news.png';
        break;
      case '이투데이':
        imagePath = 'assets/images/etoday_news.png';
        break;

      default:
        imagePath = 'assets/images/ic_main_logo.png';
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.asset(
        imagePath,
        width: 64,
        height: 64,
      ),
    );
  }
}
