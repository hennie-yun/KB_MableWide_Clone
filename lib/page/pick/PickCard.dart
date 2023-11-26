import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sm_mdi/constants/CommonColor.dart';

class PickCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 200;
    double plainRatio = 1800 / screenWidth;

    double carouselWidth = plainRatio * 0.2 ;

    return Column(children: [
      title("국내 투자고수의 PICK"),
      SizedBox(height: 10),
      Padding(
          padding: EdgeInsets.only(right: 80),
          child: CarouselSlider(
            items: [
              cardView("assets/images/pick1.png",
                  "손익의 흐름을 잘 아는 고수가 어제 무슨 종목을 매도 했을까?", "이익관리 고수"),
              cardView(
                  "assets/images/pick2.png", "손절매 고수가 지금 매도하는 종목은?", "손절매 고수"),
              cardView("assets/images/pick3.png",
                  "소액과 고액사이! 그 틈새의 고수들은 지금 어떤 종목을 매수 했을까?", "중액투자 고수"),
              cardView("assets/images/pick4.png", "진~득하게 길게 투자하는 고수의 종목은?",
                  "장기보유 고수"),
              cardView("assets/images/pick5.png",
                  "소액보다는 많이 투자하는 고수들이 보유하고 있는 종목은?", "중액투자 고수"),
              cardView(
                  "assets/images/pick6.png", "불타기 고수가 전일 매수한 종목은?", "불타기 고수"),
            ],
            options: CarouselOptions(
              height: 234,
              autoPlay: false,
              initialPage: 0,
              aspectRatio: 3.0,
              viewportFraction:  carouselWidth,
              enableInfiniteScroll: true,
              padEnds: false
            ),
          ))
    ]);
  }

  Widget title(String title) {
    return SizedBox(
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

  Widget cardView(String imgPath, String title, String gosu) {
    return  Card(
            elevation: 30,
            color: CommonColor.bgDarkMode,
            child: Column(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(imgPath,
                        width: 230, height: 120, fit: BoxFit.fill)),
                Container(
                    padding: EdgeInsets.all(20),
                    width: 230,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16, color: CommonColor.white)),
                          SizedBox(height: 10),
                          Text(gosu,
                              style: TextStyle(
                                  fontSize: 12, color: CommonColor.lightGrey))
                        ])),
              ],
            ));
  }
}
