import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../constants/CommonColor.dart';

class PrimeClubPage extends StatelessWidget {
  var topTextBtnStyle = const ButtonStyle(
      overlayColor: MaterialStatePropertyAll(Colors.transparent));

  var broadCastWidth = 372.0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - (broadCastWidth+90+50); //우측 방송 영역과 앱바 사이즈를 빼 줌
    double plainRatio = 1800 / screenWidth;

    double carouselWidth = plainRatio * 0.2;
var a = 1;
    return SingleChildScrollView(
      child: Column(
        children: [
          //상단 타이틀 및 버튼
          SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PRIME CLUB $a",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: CommonColor.white),
                  ),
                  //우측 버튼 (MY PRIM, 1:1상담, PRIME 안내)
                  RichText(
                      text: TextSpan(children: [
                    WidgetSpan(
                        child: TextButton(
                            onPressed: () {
                              a += 1;
                              print(a);
                            },
                            style: topTextBtnStyle,
                            child: Text("MY PRIME",
                                style: TextStyle(
                                    color: CommonColor.fontLightGrey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300)))),
                    WidgetSpan(
                        child: TextButton(
                            onPressed: () {},
                            style: topTextBtnStyle,
                            child: Text("1:1 상담",
                                style: TextStyle(
                                    color: CommonColor.fontLightGrey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300)))),
                    WidgetSpan(
                        child: TextButton(
                            onPressed: () {},
                            style: topTextBtnStyle,
                            child: Text("PRIME 안내",
                                style: TextStyle(
                                    color: CommonColor.fontLightGrey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300))))
                  ]))
                ],
              )),
          //실제 컨텐츠가 나올 영역
          Row(
            children: [
              //좌측컨텐츠(오늘의 콕, 오늘의 주식, 오늘의 전략..)
              Expanded(
                  child: Column(
                    children: [
                      getTitle("오늘의 콕"),
                      getCarouselSlider(
                          height: 350,
                          width: carouselWidth,
                          children: [
                            getCardView(
                              imgPath: "assets/images/prime/img_prime1_5.png",
                              title: "나아진 경제지표로 소폭 상승한 유럽증시",
                              date: "오늘",
                              isPaidContent: false,
                              views: 180,
                              topic: "1분브리핑",
                            ),
                            getCardView(
                              imgPath: "assets/images/prime/img_prime1_4.png",
                              title: "[짠테크콕콕] 통신비 할인 방안 등장! 우리집 고정비 줄여요",
                              date: "오늘",
                              isPaidContent: false,
                              views: 50,
                              topic: "내돈관리",
                            ),
                            getCardView(
                              imgPath: "assets/images/prime/img_prime1_1.png",
                              title: "[내 손안에 월스트리트] 전기차 전환이 가져올 변화",
                              date: "오늘",
                              isPaidContent: false,
                              views: 950,
                              topic: "해외주식",
                            ),
                            getCardView(
                              imgPath: "assets/images/prime/img_prime1_2.png",
                              title: "추수감사절 휴장 앞둔 뉴욕증시 반등",
                              date: "오늘",
                              isPaidContent: false,
                              views: 160,
                              topic: "1분브리핑",
                            ),
                            getCardView(
                              imgPath: "assets/images/prime/img_prime1_3.png",
                              title: "[세금콕콕] 나도 종부세 대상일까? 12월은 종부세 내는 달",
                              date: "2023/11/24",
                              isPaidContent: false,
                              views: 150,
                              topic: "절세",
                            ),
                            getCardView(
                              imgPath: "assets/images/prime/img_prime1_7.png",
                              title: "[KB웰컴북 11월호] 한동안 단기 우량 채권으로 기회 엿보기",
                              date: "2023/11/23",
                              isPaidContent: false,
                              views: 150,
                              topic: "절세",
                            ),
                            getCardView(
                              imgPath: "assets/images/prime/img_prime1_6.png",
                              title: "[채권콕콕] 금리가 내려갈 때, 멀리 내다보고 투자해요",
                              date: "2023/11/23",
                              isPaidContent: false,
                              views: 150,
                              topic: "절세",
                            )
                          ]),
                      SizedBox(
                        height: 50,
                      ),
                      getTitle("오늘의 주식"),
                      getCarouselSlider(
                          height: 350,
                          width: carouselWidth,
                          children: [
                            getCardView(
                              imgPath: "assets/images/prime/img_prime4.png",
                              title: "DDR5 전환으로 빠른 수익성 개선 기대",
                              date: "오늘",
                              writer: "아네뜨",
                              isPaidContent: true,
                              views: 180,
                            ),
                            getCardView(
                              imgPath: "assets/images/prime/img_prime5.png",
                              title: "반도체 기판 고도화 수혜주",
                              date: "오늘",
                              writer: "드림플래너",
                              isPaidContent: false,
                              views: 50,
                            ),
                            getCardView(
                              imgPath: "assets/images/prime/img_prime6.png",
                              title: "인공지능 시대의 반도체 첨단 패키징 검사 수혜주",
                              date: "오늘",
                              writer: "드림플래너",
                              isPaidContent: false,
                              views: 950,
                            ),
                          ]),
                      SizedBox(
                        height: 50,
                      ),
                      getTitle("오늘의 전략"),
                      getCarouselSlider(
                          height: 253,
                          width: carouselWidth,
                          children: [
                            getCardView(
                                imgPath: "assets/images/prime/img_prime3-1.jpg",
                                title: "Today HOT 이슈 및 관련주",
                                date: "오늘",
                                isPaidContent: false,
                                views: 50,
                                imgHeight: 140),
                            getCardView(
                                imgPath: "assets/images/prime/img_prime3-2.jpg",
                                title: "음식료 업황 체크",
                                date: "오늘",
                                isPaidContent: true,
                                views: 380,
                                imgHeight: 140),
                            getCardView(
                                imgPath: "assets/images/prime/img_prime3-3.jpg",
                                title: "헬스케어 등 낙폭주 반등",
                                date: "2023/11/23",
                                isPaidContent: false,
                                views: 950,
                                imgHeight: 140),
                            getCardView(
                                imgPath: "assets/images/prime/img_prime3-1.jpg",
                                title: "지금 기관이 사는 종목 by 아네뜨",
                                date: "2023/11/23",
                                isPaidContent: true,
                                views: 10,
                                imgHeight: 140),
                            getCardView(
                                imgPath: "assets/images/prime/img_prime3-2.jpg",
                                title: "Today HOT 이슈 및 관련주",
                                date: "2023/11/22",
                                isPaidContent: false,
                                views: 150,
                                imgHeight: 140)
                          ]),
                      SizedBox(height: 100)
                    ],
                  )),

              //컨텐츠 분리선
              VerticalDivider(color: CommonColor.white, thickness: 3,width: 3),

              //우측 증권방송 영역
              LayoutBuilder(
                  builder: (context, constraints){
                    //화면width가 900이하일 때 없앰
                    if(MediaQuery.of(context).size.width < 900){
                      broadCastWidth = 0;
                      return Text("");
                    }
                    broadCastWidth = 372;
                    return Container(color: Colors.green , width:broadCastWidth, height: 800)
                    ;
                  }
              )

            ],
          )
        ],
      ),
    );
  }

  //캐러셀 슬라이더 위젯 반환
  Widget getCarouselSlider(
      {required double width,
      required double height,
      required List<Widget> children}) {
    return CarouselSlider(
      items: children,
      options: CarouselOptions(
          height: height,
          autoPlay: false,
          initialPage: 2,
          aspectRatio: 310 / 325,
          viewportFraction: width,
          enableInfiniteScroll: false,
          padEnds: false),
    );
  }

  //CarouselSlider에 들어갈 카드 위젯 반환
  Widget getCardView({
    required String imgPath, //이미지
    required String title, //글제목
    required String date, //작성일
    required bool isPaidContent, //유료컨텐츠 여부
    required int views, //조회수
    String? topic, //해외주식, 1분브리핑 등 분류
    String? writer, //작성자
    double imgHeight = 200, //이미지의 높이 조절
  }) {
    //널체크 및 String연산을 위한 변수
    String? writerString;

    if (writer != null) {
      writerString = "by $writer";
    }

    return Card(
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        color: CommonColor.bannerPrimeClub_DK, //
        child: Column(
          children: <Widget>[
            //이미지
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.asset(imgPath,
                    width: 315, height: imgHeight, fit: BoxFit.fill)),
            //컨텐츠 제목, 작성일 등
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(20),
                    width: 315,
                    child: Stack(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //컨텐츠 제목
                          Positioned(
                              left: 0,
                              right: 0,
                              top: 0,
                              child: Text(
                                  "${isPaidContent ? "[유료] " : ""}${title}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16, color: CommonColor.white))),
                          //컨텐츠 작성자
                          Positioned(
                              right: 0,
                              left: 0,
                              top: 45,
                              child: Text(writerString ?? "",

                                  /// @@ 널체크 다시 확인
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CommonColor.lightGrey,
                                      fontWeight: FontWeight.w600))),
                          //'주제 또는 날짜 • 조회수' 츨력
                          Positioned(
                              right: 0,
                              left: 0,
                              bottom: 0,
                              child: RichText(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: CommonColor.lightGrey,
                                          fontWeight: FontWeight.w600,
                                          height: 1.8,
                                          fontFamily: "Pretendard"),
                                      children: [
                                        TextSpan(text: "${topic ?? date}"),
                                        TextSpan(text: " • "),
                                        TextSpan(text: "$views명이 봤어요")
                                      ])))
                        ]))),
          ],
        ));
  }

  //슬라이더 제목 위젯을 반환
  Widget getTitle(String title) {
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
}
