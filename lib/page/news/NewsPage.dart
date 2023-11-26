import 'package:flutter/material.dart';

import '../../constants/CommonColor.dart';
import '../../manager/MenuManager.dart';
import 'NewsDetail.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 60),
        width: double.infinity,
        height: 250,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title("헤드라인뉴스"),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          newsBox(
                              "원.달러 환율 1296.9원 장 마감", "연합뉴스", "2023/11/15 13:16"),
                          SizedBox(height: 31),
                          newsBox(
                              "코스닥, 미중 화해 무드에 상승전환", "머니투데이", "2023/11/15 13:16"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          newsBox(
                              "아쉬운 '상저하고'..지연되는 기업 실적 회복세", "이투데이", "2023/11/15 13:16"),
                          SizedBox(height: 31),
                          newsBox(
                              "SK어스온, 베트남 광구서 원유 발견 ", "머니투데이", "2023/11/15 13:16"),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: MediaQuery.of(context).size.width > 1300,
                    child: Expanded(
                      flex: MediaQuery.of(context).size.width > 1300 ? 1 : 0,
                      child: Padding(
                        padding: EdgeInsets.only(right: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            newsBox(
                                "[오전 주요 국제 금융뉴스]", "연합뉴스", "2023/11/15 13:16"),
                            SizedBox(height: 31),
                            newsBox(
                                "[오전 주요 국제 금융뉴스]", "연합뉴스", "2023/11/15 13:16"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]));
  }

  ///맨위의 타이틀
  Widget title(String title) {
    return InkWell(
        onTap: () {
          MenuManager.instance.movePage(NewsDetail());
        },
        child: Container(
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
            ])));
  }

  /// news
  Widget newsBox(String title, String company, String date) {
    return Container(
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
                // height: 64,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 16, color: CommonColor.white)),
                    SizedBox(height: 10),
                    Text('$company | $date',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 13, color: CommonColor.fontDimmed)),
                  ],
                )),

              Container(
                    padding: EdgeInsets.only(bottom: 15),
                    child: getImageWidget(newsSource: company))
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
