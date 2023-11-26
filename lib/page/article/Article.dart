import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../constants/CommonColor.dart';

class Article extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    //전체 화면에서 여백 100씩 준거 뺴
    double screenWidth = MediaQuery.of(context).size.width - 200;

    //아이템 width = 288 * 5 = 1440 을 나눠
    double plainRatio = 1400 / screenWidth;

    //
    double carouselWidth = plainRatio * 0.25;

    return Column(
        children: [
          title("쉽게 읽는 투자 정보"),
          SizedBox(height: 10),
          Padding(padding: EdgeInsets.only(right : 80),
              child : CarouselSlider(
                items: [
                  _addContainerWidget("assets/images/list1.png"),
                  _addContainerWidget("assets/images/list2.png"),
                  _addContainerWidget("assets/images/list3.png"),
                  _addContainerWidget("assets/images/list4.png"),
                  _addContainerWidget("assets/images/list5.png"),
                ],
                options: CarouselOptions(
                  height: 150,
                  autoPlay: false,
                  aspectRatio: 2.5,
                  viewportFraction: carouselWidth ,
                  enableInfiniteScroll: true,
                  padEnds: false
                ),
              )
          )

        ]
    );
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

  Widget _addContainerWidget(String imgPath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(
        imgPath,
        width: 280,
        fit: BoxFit.fill,
      ),
    );
  }
}
