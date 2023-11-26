import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_mdi/common/Indicator.dart';
import 'package:sm_mdi/dialog/PortfolioContent.dart';
import 'package:sm_mdi/page/myAssets/MyAssetPageController.dart';

import '../../constants/CommonColor.dart';
import '../../dialog/BasePopUpWindow.dart';
import '../../dialog/PasswordContent.dart';

class MyAssetPage extends StatelessWidget {
  final ContainerWidth = 1600.0;
  var textButtonStyle = ButtonStyle(
      overlayColor: MaterialStatePropertyAll(Colors.transparent),
      padding: MaterialStatePropertyAll(EdgeInsets.zero));
  var lightGreyW500TextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: CommonColor.fontLightGrey,
      fontFamily: 'Pretendard');
  var accountTextStyle = TextStyle(
      color: CommonColor.fontGrey,
      fontSize: 13.5,
      height: 1.8,
      fontWeight: FontWeight.w600,
      fontFamily: 'Pretendard');
  var accountBtnStyle =
      ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero));

  MyAssetPageController controller = MyAssetPageController();

  @override
  Widget build(BuildContext context) {
    controller.initChart();

    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "내자산",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: CommonColor.white),
              ),
              SizedBox(
                  height: 550,
                  child: Column(
                    children: [
                      ///총자산 박스
                      Container(
                          decoration: BoxDecoration(
                              color: CommonColor.bannerLightGrey_DK,
                              borderRadius: BorderRadius.circular(8)),
                          height: 163,
                          margin: EdgeInsets.symmetric(vertical: 25),
                          padding: EdgeInsets.all(30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // @@ 님의 총자산
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("최우성 님의 총자산",
                                            style: TextStyle(
                                                color:
                                                    CommonColor.fontLightGrey,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Pretendard')),
                                        IconButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(0)),
                                            ),
                                            icon: Icon(Icons.refresh_rounded,
                                                size: 15,
                                                color: CommonColor.white)),
                                      ],
                                    ),

                                    //순자산 ~ 거래내역
                                    RichText(
                                        text: TextSpan(
                                            text: "순자산  ",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    CommonColor.fontLightGrey,
                                                fontFamily: 'Pretendard'),
                                            children: [
                                          TextSpan(
                                              text: "30,220원",
                                              style: TextStyle(
                                                  color:
                                                      CommonColor.fontYellow)),

                                          WidgetSpan(
                                              child: SizedBox(width: 10.0)),
                                          //여백

                                          TextSpan(text: "신용대출금액  "),
                                          TextSpan(
                                              text: "0원",
                                              style: TextStyle(
                                                  color:
                                                      CommonColor.fontYellow)),

                                          WidgetSpan(
                                              child: SizedBox(width: 10.0)),
                                          //여백

                                          //투자가능금액 버튼
                                          WidgetSpan(
                                              child: SizedBox(
                                                  height: 16,
                                                  child: TextButton(
                                                      onPressed: () {},
                                                      style: textButtonStyle,
                                                      child: RichText(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text: TextSpan(
                                                            text:
                                                                "총 예수금(투자가능금액)  ",
                                                            style:
                                                                lightGreyW500TextStyle,
                                                            children: [
                                                              TextSpan(
                                                                  text:
                                                                      "7,840원 ",
                                                                  style: TextStyle(
                                                                      color: CommonColor
                                                                          .fontYellow)),
                                                              WidgetSpan(
                                                                  alignment:
                                                                      PlaceholderAlignment
                                                                          .middle,
                                                                  child: Icon(
                                                                      Icons
                                                                          .arrow_forward_ios_rounded,
                                                                      size: 10,
                                                                      color: CommonColor
                                                                          .fontLightGrey)),
                                                            ]),
                                                      )))),

                                          //여백
                                          WidgetSpan(
                                              child: SizedBox(width: 17.0)),

                                          //충전하기 버튼
                                          WidgetSpan(
                                              child: SizedBox(
                                                  height: 16,
                                                  child: TextButton(
                                                      onPressed: () {},
                                                      style: textButtonStyle,
                                                      child: RichText(
                                                        text: TextSpan(
                                                            text: "충전하기  ",
                                                            style:
                                                                lightGreyW500TextStyle,
                                                            children: [
                                                              WidgetSpan(
                                                                  alignment:
                                                                      PlaceholderAlignment
                                                                          .middle,
                                                                  child: Icon(
                                                                      Icons
                                                                          .arrow_forward_ios_rounded,
                                                                      size: 10,
                                                                      color: CommonColor
                                                                          .fontLightGrey)),
                                                            ]),
                                                      )))),

                                          //여백
                                          WidgetSpan(
                                              child: SizedBox(width: 17.0)),

                                          //이체하기 버튼
                                          WidgetSpan(
                                              child: SizedBox(
                                                  height: 16,
                                                  child: TextButton(
                                                      onPressed: () {},
                                                      style: textButtonStyle,
                                                      child: RichText(
                                                        text: TextSpan(
                                                            text: "이체하기  ",
                                                            style:
                                                                lightGreyW500TextStyle,
                                                            children: [
                                                              WidgetSpan(
                                                                  alignment:
                                                                      PlaceholderAlignment
                                                                          .middle,
                                                                  child: Icon(
                                                                      Icons
                                                                          .arrow_forward_ios_rounded,
                                                                      size: 10,
                                                                      color: CommonColor
                                                                          .fontLightGrey)),
                                                            ]),
                                                      )))),

                                          //여백
                                          WidgetSpan(
                                              child: SizedBox(width: 17.0)),

                                          //매매손익 버튼
                                          WidgetSpan(
                                              child: SizedBox(
                                                  height: 16,
                                                  child: TextButton(
                                                      onPressed: () {},
                                                      style: textButtonStyle,
                                                      child: RichText(
                                                        text: TextSpan(
                                                            text: "매매손익  ",
                                                            style:
                                                                lightGreyW500TextStyle,
                                                            children: [
                                                              WidgetSpan(
                                                                  alignment:
                                                                      PlaceholderAlignment
                                                                          .middle,
                                                                  child: Icon(
                                                                      Icons
                                                                          .arrow_forward_ios_rounded,
                                                                      size: 10,
                                                                      color: CommonColor
                                                                          .fontLightGrey)),
                                                            ]),
                                                      )))),

                                          //여백
                                          WidgetSpan(
                                              child: SizedBox(width: 17.0)),

                                          //주문내역 버튼
                                          WidgetSpan(
                                              child: SizedBox(
                                                  height: 16,
                                                  child: TextButton(
                                                      onPressed: () {},
                                                      style: textButtonStyle,
                                                      child: RichText(
                                                        text: TextSpan(
                                                            text: "주문내역  ",
                                                            style:
                                                                lightGreyW500TextStyle,
                                                            children: [
                                                              WidgetSpan(
                                                                  alignment:
                                                                      PlaceholderAlignment
                                                                          .middle,
                                                                  child: Icon(
                                                                      Icons
                                                                          .arrow_forward_ios_rounded,
                                                                      size: 10,
                                                                      color: CommonColor
                                                                          .fontLightGrey)),
                                                            ]),
                                                      )))),

                                          //여백
                                          WidgetSpan(
                                              child: SizedBox(width: 17.0)),

                                          //거래내역 버튼
                                          WidgetSpan(
                                              child: SizedBox(
                                                  height: 16,
                                                  child: TextButton(
                                                      onPressed: () {},
                                                      style: textButtonStyle,
                                                      child: RichText(
                                                        text: TextSpan(
                                                            text: "거래내역  ",
                                                            style:
                                                                lightGreyW500TextStyle,
                                                            children: [
                                                              WidgetSpan(
                                                                  alignment:
                                                                      PlaceholderAlignment
                                                                          .middle,
                                                                  child: Icon(
                                                                      Icons
                                                                          .arrow_forward_ios_rounded,
                                                                      size: 10,
                                                                      color: CommonColor
                                                                          .fontLightGrey)),
                                                            ]),
                                                      )))),
                                        ]))
                                  ],
                                ),
                              ),

                              //우측 총 자산 금액
                              RichText(
                                  textAlign: TextAlign.end,
                                  text: TextSpan(
                                      text: "30,240원\n",
                                      style: TextStyle(
                                          color: CommonColor.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 32,
                                          fontFamily: 'Pretendard'),
                                      children: [
                                        TextSpan(
                                            text: "240원(1.09%)",
                                            style: TextStyle(
                                                color: CommonColor.fontUp,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16)),
                                      ])),
                            ],
                          )),

                      ///계좌, 상품, 포트폴리오 박스
                      Expanded(
                          child: Row(
                        children: [
                          ///계좌목록 박스
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: CommonColor.bannerLightGrey_DK,
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: EdgeInsets.all(30),
                                  margin: EdgeInsets.only(right: 25),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //타이틀
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                              text: TextSpan(
                                                  text: "계좌 ",
                                                  style: TextStyle(
                                                      color: CommonColor
                                                          .fontLightGrey,
                                                      fontSize: 17,
                                                      fontFamily: 'Pretendard'),
                                                  children: [
                                                WidgetSpan(
                                                  alignment:
                                                      PlaceholderAlignment
                                                          .middle,
                                                  child: Tooltip(
                                                      padding:
                                                          EdgeInsets.all(17),
                                                      decoration: BoxDecoration(
                                                          color: Colors.black,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7)),
                                                      message:
                                                          "목록에서 계좌가 보이지 않는다면,\n계좌편집에서 표시여부를 확인해보세요!",
                                                      textStyle: TextStyle(
                                                          color: CommonColor
                                                              .white),
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          child: Container(
                                                              width: 14,
                                                              height: 14,
                                                              color: CommonColor
                                                                  .fontGrey,
                                                              child: Icon(
                                                                Icons
                                                                    .question_mark_rounded,
                                                                size: 11,
                                                                color:
                                                                    CommonColor
                                                                        .white,
                                                              )))),
                                                )
                                              ])),
                                          Icon(Icons.settings_rounded,
                                              color: CommonColor.fontLightGrey)
                                        ],
                                      ),

                                      //계좌 리스트뷰
                                      ListView(
                                        padding: EdgeInsets.only(top: 12),
                                        shrinkWrap: true,
                                        children: [
                                          //구분선
                                          Divider(
                                              thickness: 0.4,
                                              color: CommonColor.fontLightGrey),

                                          //종합위탁 계좌
                                          TextButton(
                                            onPressed: () {
                                              popWindow(
                                                  context,
                                                  "계좌 비밀번호",
                                                  PasswordContent(
                                                      name: "종합위탁",
                                                      number:
                                                          "369-895-663 01"));
                                            },
                                            style: accountBtnStyle,
                                            child: ListTile(
                                                contentPadding:
                                                    EdgeInsets.all(0),
                                                title: RichText(
                                                    text: TextSpan(
                                                        text: "종합위탁\n",
                                                        style: accountTextStyle,
                                                        children: [
                                                      TextSpan(
                                                          text:
                                                              "369-895-663 01 최우성")
                                                    ])),
                                                //subtitle: Text("444222"),
                                                trailing: RichText(
                                                    textAlign: TextAlign.end,
                                                    text: TextSpan(
                                                        text: "30,170원\n",
                                                        style: TextStyle(
                                                            color: CommonColor
                                                                .white,
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.4),
                                                        children: [
                                                          TextSpan(
                                                              text:
                                                                  "170원(0.76%)",
                                                              style: TextStyle(
                                                                  color:
                                                                      CommonColor
                                                                          .fontUp,
                                                                  fontSize: 14))
                                                        ]))),
                                          ),

                                          //구분선
                                          Divider(
                                              thickness: 0.4,
                                              color: CommonColor.fontLightGrey),

                                          //CMA
                                          TextButton(
                                              onPressed: () {
                                                popWindow(
                                                    context,
                                                    "계좌 비밀번호",
                                                    PasswordContent(
                                                        name: "CMA",
                                                        number:
                                                            "369-895-663 02"));
                                              },
                                              style: accountBtnStyle,
                                              child: ListTile(
                                                  contentPadding:
                                                      EdgeInsets.all(0),
                                                  title: RichText(
                                                      text: TextSpan(
                                                          text: "CMA\n",
                                                          style:
                                                              accountTextStyle,
                                                          children: [
                                                        TextSpan(
                                                            text:
                                                                "369-895-663 02 최우성")
                                                      ])),
                                                  //subtitle: Text("444222"),
                                                  trailing: RichText(
                                                      textAlign: TextAlign.end,
                                                      text: TextSpan(
                                                          text: "0원\n",
                                                          style: TextStyle(
                                                              color: CommonColor
                                                                  .white,
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              height: 1.4),
                                                          children: [
                                                            TextSpan(
                                                                text:
                                                                    "0원(0.0%)",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14))
                                                          ]))))
                                        ],
                                      )
                                    ],
                                  ))),

                          ///상품종류 박스
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: CommonColor.bannerLightGrey_DK,
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: EdgeInsets.all(30),
                                  margin: EdgeInsets.only(right: 25),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("상품 ",
                                          style: TextStyle(
                                              color: CommonColor.fontLightGrey,
                                              fontSize: 17)),

                                      //계좌 리스트뷰
                                      ListView(
                                        padding: EdgeInsets.only(top: 12),
                                        shrinkWrap: true,
                                        children: [
                                          //구분선
                                          Divider(
                                              thickness: 0.4,
                                              color: CommonColor.fontLightGrey),

                                          //국내주식
                                          ListTile(
                                              contentPadding: EdgeInsets.all(0),
                                              title: RichText(
                                                  text: TextSpan(
                                                text: "국내주식\n",
                                                style: accountTextStyle,
                                              )),
                                              trailing: RichText(
                                                  textAlign: TextAlign.end,
                                                  text: TextSpan(
                                                      text: "30,170원\n",
                                                      style: TextStyle(
                                                          color:
                                                              CommonColor.white,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 1.4),
                                                      children: [
                                                        TextSpan(
                                                            text: "170원(0.76%)",
                                                            style: TextStyle(
                                                                color:
                                                                    CommonColor
                                                                        .fontUp,
                                                                fontSize: 14))
                                                      ]))),

                                          //구분선
                                          Divider(
                                              thickness: 0.4,
                                              color: CommonColor.fontLightGrey),

                                          //해외주식
                                          ListTile(
                                              contentPadding: EdgeInsets.all(0),
                                              title: RichText(
                                                  text: TextSpan(
                                                text: "해외주식\n",
                                                style: accountTextStyle,
                                              )),
                                              //subtitle: Text("444222"),
                                              trailing: RichText(
                                                  textAlign: TextAlign.end,
                                                  text: TextSpan(
                                                      text: "0원\n",
                                                      style: TextStyle(
                                                          color:
                                                              CommonColor.white,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 1.4),
                                                      children: [
                                                        TextSpan(
                                                            text: "0원(0.0%)",
                                                            style: TextStyle(
                                                                fontSize: 14))
                                                      ]))),

                                          //구분선
                                          Divider(
                                              thickness: 0.4,
                                              color: CommonColor.fontLightGrey),

                                          //금융상품
                                          ListTile(
                                              contentPadding: EdgeInsets.all(0),
                                              title: RichText(
                                                  text: TextSpan(
                                                text: "금융상품\n",
                                                style: accountTextStyle,
                                              )),
                                              //subtitle: Text("444222"),
                                              trailing: RichText(
                                                  textAlign: TextAlign.end,
                                                  text: TextSpan(
                                                      text: "0원\n",
                                                      style: TextStyle(
                                                          color:
                                                              CommonColor.white,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 1.4),
                                                      children: [
                                                        TextSpan(
                                                            text: "0원(0.0%)",
                                                            style: TextStyle(
                                                                fontSize: 14))
                                                      ])))
                                        ],
                                      )
                                    ],
                                  ))),

                          ///포트폴리오 박스
                          Expanded(
                              child: Container(
                                  constraints: BoxConstraints(
                                    minWidth: 1500,
                                  ),
                                  decoration: BoxDecoration(
                                      color: CommonColor.bannerLightGrey_DK,
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: EdgeInsets.all(30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //타이틀
                                      SizedBox(
                                          height: 20,
                                          child: TextButton(
                                              onPressed: () {
                                                popWindow(context, "종목별 비중",
                                                    PortfolioContent());
                                              },
                                              style: ButtonStyle(
                                                  overlayColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.transparent),
                                                  padding:
                                                      MaterialStatePropertyAll(
                                                          EdgeInsets.zero)),
                                              child: RichText(
                                                  textAlign: TextAlign.right,
                                                  text: TextSpan(
                                                      text: "포트폴리오 ",
                                                      style: TextStyle(
                                                          color: CommonColor
                                                              .fontLightGrey,
                                                          fontSize: 17),
                                                      children: [
                                                        WidgetSpan(
                                                            alignment:
                                                                PlaceholderAlignment
                                                                    .middle,
                                                            child: Icon(
                                                                Icons
                                                                    .arrow_forward_ios_rounded,
                                                                size: 10,
                                                                color: CommonColor
                                                                    .fontLightGrey))
                                                      ])))),

                                      //여백
                                      SizedBox(height: 12),

                                      //파이 차트
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          //포트폴리오 차트
                                          SizedBox(
                                              width: 180,
                                              height: 180,
                                              child: Obx(
                                                () => PieChart(
                                                  PieChartData(
                                                    pieTouchData: PieTouchData(
                                                      touchCallback:
                                                          (FlTouchEvent event,
                                                              pieTouchResponse) {
                                                        if (!event
                                                                .isInterestedForInteractions ||
                                                            pieTouchResponse ==
                                                                null ||
                                                            pieTouchResponse
                                                                    .touchedSection ==
                                                                null) {
                                                          controller
                                                              .seletedIndex
                                                              .value = -1;
                                                          return;
                                                        }
                                                        controller.seletedIndex
                                                                .value =
                                                            pieTouchResponse
                                                                .touchedSection!
                                                                .touchedSectionIndex;
                                                      },
                                                    ),
                                                    borderData: FlBorderData(
                                                      show: false,
                                                    ),
                                                    sectionsSpace: 0,
                                                    centerSpaceRadius: 40,
                                                    sections: showingSections(),
                                                  ),
                                                  swapAnimationDuration:
                                                      Duration(
                                                          milliseconds: 150),
                                                ),
                                              )),

                                          //여백
                                          SizedBox(width: 20),

                                          // 차트 레이블
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Indicator(
                                                  color:
                                                      CommonColor.chartColor_1,
                                                  text: '국내주식',
                                                  isSquare: true,
                                                  textColor: CommonColor.white,
                                                  ratio: 80),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Indicator(
                                                  color:
                                                      CommonColor.chartColor_2,
                                                  text: '예수금',
                                                  isSquare: true,
                                                  textColor: CommonColor.white,
                                                  ratio: 20),
                                              SizedBox(
                                                height: 4,
                                              )
                                            ],
                                          )
                                        ],
                                      ))

                                      // //계좌 리스트뷰
                                      // ListView(
                                      //   padding: EdgeInsets.only(top:12),
                                      //   shrinkWrap:true,
                                      //   children: [
                                      //
                                      //
                                      //
                                      //   ],
                                      // )
                                    ],
                                  ))),
                        ],
                      ))
                    ],
                  )),

              //여백
              SizedBox(height: 60),

              //하단 탭바 영역
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    //탭바 영역
                    Container(
                        height: 50,
                        child: Stack(
                          children: [
                            //탭바 하단 구분선
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: SizedBox(
                                    height: 0.5,
                                    child: Ink(color: CommonColor.white))),

                            //탭바
                            Positioned(
                                width: 300,
                                height: 50,
                                left: 0,
                                top: 0,
                                child: TabBar(
                                  overlayColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  tabs: [
                                    Tab(text: "국내주식 2"),
                                    Tab(text: "해외주식 0"),
                                    Tab(text: "금융상품 0")
                                  ],
                                  indicatorColor: CommonColor.btnYellow,
                                ))
                          ],
                        )),
                    //탭바 컨텐츠 영역
                    SizedBox(
                        height: 450,
                        child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              //클라우드인증 페이지
                              chartContents(),
                              getEmptyContent(isInternationalStock: true),
                              getEmptyContent(isInternationalStock: false),
                            ]))
                  ],
                ),
              ),
            ],
          )),
    );
  }

  //해외주식이 비었을 때 페이지를 반환
  Widget getEmptyContent({bool isInternationalStock = true}) {
    return Align(
        alignment: Alignment.center,
        child: SizedBox(
            width: 500,
            height: 230,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/img_empty_search_dark.png",
                    width: 96, height: 96),
                Text("아직 ${isInternationalStock ? "해외주식" : "금융상품"}을 가지고 있지 않아요",
                    style: TextStyle(color: CommonColor.white, fontSize: 17)),

                Text(
                    isInternationalStock
                        ? "어떤 주식을 사야할 지 모르겠다면?"
                        : "금융상품을 가입할 경우 M-able을 이용해 주세요",
                    style:
                        TextStyle(color: CommonColor.fontGrey, fontSize: 14)),

                //버튼
                Visibility(
                    visible: isInternationalStock,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.fromLTRB(30, 20, 30, 20)),
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            backgroundColor: MaterialStatePropertyAll(
                                CommonColor.btnYellow)),
                        child: Text("해외주식 보러가기",
                            style: TextStyle(color: CommonColor.black))))
              ],
            )));
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == controller.seletedIndex.value;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: CommonColor.chartColor_1,
            value: controller.ratioSection_1.value,
            radius: radius,
            title: "",
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: CommonColor.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: CommonColor.chartColor_2,
            value: controller.ratioSection_2.value,
            radius: radius,
            title: "",
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: CommonColor.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  //주식 보유항목 표 리턴
  Widget chartContents() {
    return DataTable(
      border: const TableBorder(
        verticalInside: BorderSide(
          width: 1,
          color: Color(0xFF74737f),
        ),
        horizontalInside: BorderSide(
          width: 1,
          color: Color(0xFF74737f),
        ),
      ),
      columns: const [
        DataColumn(
            label: Expanded(
          flex: 10,
          child: Text('종목명',
              textAlign: TextAlign.left, style: TextStyle(color: Colors.white)),
        )),
        DataColumn(
            label: Expanded(
          flex: 2,
          child: Text('보유수량',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
        )),
        DataColumn(
            label: Expanded(
          flex: 2,
          child: Text('평가금액',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
        )),
        DataColumn(
            label: Expanded(
          flex: 2,
          child: Text('평가손익',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
        )),
        DataColumn(
            label: Expanded(
          flex: 2,
          child: Text('손익률',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
        )),
        DataColumn(
            label: Expanded(
          flex: 2,
          child: Text('현재가',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
        )),
        DataColumn(
            label: Expanded(
          flex: 2,
          child: Text('등락률',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
        )),
        DataColumn(
            label: Expanded(
          flex: 2,
          child: Text('평균매수단가',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
        )),
        DataColumn(
            label: Expanded(
          flex: 2,
          child: Text('총매수금액',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
        )),
        DataColumn(
            label: Expanded(
          flex: 1,
          child: Text('구분',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
        )),
        DataColumn(
            label: Expanded(
          flex: 2,
          child: Text('계좌번호',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white)),
        )),
      ],
      rows: [
        buildDataRow(
            jmImg: "assets/images/jm11.png",
            jmName: "한국전력",
            stockCount: 1,
            sign: "+",
            marketValue: "19,060",
            jmCurrentPrice: "19,060",
            jmPriceBefore: "380",
            jmProfitPercent: "2.13%",
            avgBuyPrice: "17,760",
            amountBuyPrice: "17,760",
            gubun: "현금",
            account: "396-895-663 01"),
        buildDataRow(
            jmImg: "assets/images/jm12.png",
            jmName: "상상인",
            stockCount: 1,
            sign: "-",
            marketValue: "4,350",
            jmCurrentPrice: "4,350",
            jmPriceBefore: "50",
            jmProfitPercent: "1.13%",
            avgBuyPrice: "4,400",
            amountBuyPrice: "4,400",
            gubun: "현금",
            account: "396-895-663 01"),
      ],
    );
  }

  /// DataRow 모음
  DataRow buildDataRow(
      {required String jmImg,
      required String jmName,
      required int stockCount,
      required String sign,
      required String marketValue,
      required String jmCurrentPrice,
      required String jmPriceBefore,
      required String jmProfitPercent,
      required String avgBuyPrice,
      required String amountBuyPrice,
      required String gubun,
      required String account}) {
    return DataRow(cells: [
      // 종목명
      DataCell(
        Row(
          children: [
            Image.asset(
              jmImg,
              width: 28,
              height: 28,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(jmName,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: CommonColor.white)),
            )
          ],
        ),
      ),
      //보유수량
      DataCell(
        Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: Text("${stockCount}주",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: CommonColor.fontLightGrey)),
            )),
        showEditIcon: false,
      ),
      //평가금액
      DataCell(
        Align(
          alignment: Alignment.centerRight,
          child: Text("${marketValue}원",
              textAlign: TextAlign.right,
              style: TextStyle(color: CommonColor.fontLightGrey)),
        ),
        showEditIcon: false,
      ),
      //평가손익
      DataCell(
        Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                    sign == "+"
                        ? Icons.arrow_drop_up_outlined
                        : Icons.arrow_drop_down_outlined,
                    color: sign == "+"
                        ? CommonColor.fontUp
                        : CommonColor.fontDown),
                Text(jmPriceBefore,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: sign == "+"
                            ? CommonColor.fontUp
                            : CommonColor.fontDown)),
              ],
            )),
        showEditIcon: false,
      ),
      //손익률
      DataCell(
        Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                    sign == "+"
                        ? Icons.arrow_drop_up_outlined
                        : Icons.arrow_drop_down_outlined,
                    color: sign == "+"
                        ? CommonColor.fontUp
                        : CommonColor.fontDown),
                Text(jmProfitPercent,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: sign == "+"
                            ? CommonColor.fontUp
                            : CommonColor.fontDown)),
              ],
            )),
        showEditIcon: false,
      ),
      //현재가
      DataCell(
        Align(
          alignment: Alignment.centerRight,
          child: Text("${jmCurrentPrice}원",
              textAlign: TextAlign.right,
              style: TextStyle(color: CommonColor.fontLightGrey)),
        ),
        showEditIcon: false,
      ),
      //등락률
      DataCell(
        Align(
          alignment: Alignment.centerRight,
          child: Text("${jmPriceBefore}원(${sign + jmProfitPercent})",
              textAlign: TextAlign.right,
              style: TextStyle(color: Color(0xFFB2B4Bf))),
        ),
        showEditIcon: false,
      ),
      //평균매수단가(평단가)
      DataCell(
        Align(
          alignment: Alignment.centerRight,
          child: Text("${avgBuyPrice}원",
              textAlign: TextAlign.right,
              style: TextStyle(color: Color(0xFFB2B4BF))),
        ),
        showEditIcon: false,
      ),
      //총매수금액
      DataCell(
        Align(
          alignment: Alignment.centerRight,
          child: Text("${amountBuyPrice}원",
              textAlign: TextAlign.right,
              style: TextStyle(color: Color(0xFFB2B4BF))),
        ),
        showEditIcon: false,
      ),
      //구분
      DataCell(
        Align(
          alignment: Alignment.centerRight,
          child: Text(gubun,
              textAlign: TextAlign.right,
              style: TextStyle(color: Color(0xFFB2B4BF))),
        ),
        showEditIcon: false,
      ),
      //계좌번호
      DataCell(
        Align(
          alignment: Alignment.centerRight,
          child: Text(account,
              textAlign: TextAlign.right,
              style: TextStyle(color: Color(0xFFB2B4BF))),
        ),
        showEditIcon: false,
      ),
    ]);
  }
}
