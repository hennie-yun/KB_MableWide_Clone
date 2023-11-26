import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../constants/CommonColor.dart';

class SliderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 200;
    double plainRatio = ( 1200 / (MediaQuery.of(context).size.width - 200));
    double carouselWidth = ( 1200 / (MediaQuery.of(context).size.width - 200)) * 0.2;

    /// TODO 2(해현) -> Slider 너비 계산
    /// 1200 : 한 아이템 너비 = 200 & 한번에 총 6개 (대략) 표시
    /// - 200 : 상위 화면에서 좌우패딩 각각 100 이므로 -200
    /// 기본비율(D) plainRatio = ( 1200 / (MediaQuery.of(context).size.width - 200)); ==> ( 컨텐츠 총 너비 ) / ( 화면 전체 너비 )
    /// ** TEST!!
    ///
    /// [ 큰 화면  ] screenWidth = 1500 -> 적정 비율(x) = 0.15  /  기본비율(D) = 0.78534
    /// [ 작은 화면 ] screenWidth = 900 -> 적정 비율(x) = 0.25  /  기본비율(D) = 1.3422
    /// ** 0.15 / 2.5 = 0.6  && 0.78534 / 1.3422 = 0.585
    ///  => 적정 비율에 대한 증감비가 0.6로 근사값인걸 확인. ( 등비 )
    /// 필요값 : 기본비율(D) X 변경 비율(R) = 적정 비율(x) => 등비이므로..
    ///  0.78534 x < 0.2 > = 0.15  &&  1.3422 x < 0.2 > = 0.26 ( 대충 0.25 )
    ///  따라서 기본비율(D)에 0.2를 구해주면 변경 비율을 구할 수 있다.
    ///
    /// ** 결론
    /// 최종 비율 = ( 1200 / (MediaQuery.of(context).size.width - 200)) * 0.2;

    // print("WIDTH - [ Screen :: $screenWidth ] / [ PlainRatio :: $plainRatio ]");

    return CarouselSlider(
      items: [
        _addContainerWidget("코스피", "+", "2,225.67", "0.2%"),
        _addContainerWidget("코스닥", "-", "2767.95", "4.2%"),
        _addContainerWidget("다우 산업", "-", "1,113.58", "12.2%"),
        _addContainerWidget("나스닥", "-", "2,225.67", "1.2%"),
        _addContainerWidget("한국원/달러", "+", "2,225.67", "0.2%"),
        _addContainerWidget("금", "-", "2767.95", "4.2%"),
        _addContainerWidget("원유", "-", "1,113.58", "12.2%"),
      ],
      options: CarouselOptions(
        height: 104,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        aspectRatio: 3.0,
        viewportFraction: carouselWidth,
        enableInfiniteScroll: true,
        padEnds: false
      ),
    );
  }


  Widget _addContainerWidget(
      String jm, String sign, String price, String increase) {
    return Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            color: sign == "+"
                ? CommonColor.bannerBgUp_DK
                : CommonColor.bannerBgDown_DK
        ),

    child : Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(24, 16, 25, 16),
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(jm, style: TextStyle(
              fontSize: 14, color : CommonColor.white)),
                Container(
                  padding: EdgeInsets.only(top: 4),
                  child : Text(price,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color : CommonColor.white))),
                Container(
                child : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children : [
                Icon(
                    sign == "+" ?
                    Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded,
                  color: sign == "+" ? CommonColor.fontUp : CommonColor.fontDown,
                  size: 22
                ),
                    Text(increase,
                    style: TextStyle(
                        fontSize: 14,
                        color: sign == "+"
                            ? CommonColor.fontUp
                            : CommonColor.fontDown))])
            ) ],
           )),

            Image.asset(
                sign == "+"
                    ? 'assets/images/red_chart.png'
                    : 'assets/images/blue_chart.png',
                width: 60,
                height: 50),
          ],
        ));
  }
}
