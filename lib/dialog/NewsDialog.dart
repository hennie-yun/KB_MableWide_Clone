import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/CommonColor.dart';

class NewsDialog extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 450,
        height: 450,
        child: Column(
            children: [
            newsBox(
            "news_sum_0".tr, "연합뉴스", "2023/11/15 13:16"),
        Divider(height: 1, color: CommonColor.fontdimmedGrey),
        SizedBox(height: 20),
        Text(
          "news_detail_0".tr, style: TextStyle(color: CommonColor.white)),
          ],
        )
    );
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