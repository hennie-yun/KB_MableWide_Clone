import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_mdi/base/BasePageController.dart';
import 'package:sm_mdi/constants/CommonColor.dart';


class MainAppBarController extends BasePageController<MainAppBarController>{

  static const _TAG = 'MainPageController';

  //실시간 순위 페이지 번호 저장
  var trendCurrentPage = 0;

  //실시간 순위 데이터
  var trendRank = ['1. 삼성전자', '2. 영풍제지', '3. 에코프로', '4. 에코프로비엠', '5. LG에너지솔루션', '6. STX'];

  ///버튼 색상
  var downloadIconColor = CommonColor.fontGrey.obs;
  var notiIconColor = CommonColor.fontGrey.obs;

  ///검색 위젯
  //포커스 관리
  FocusNode searchFocus = FocusNode();
  //검색 위젯 길이
  var searchWidth = 200.0.obs;

  //화면이 삭제되었을 때 Timer도 삭제되로록 변수에 저장
  late Timer myTimer;

  //3초마다 실시간 순위 페이지가 전환되도록 하는 타이머
  void startTimer(PageController pageController, int trendLength){
    myTimer = Timer.periodic(Duration(seconds: 3), (Timer timer) {

      if (trendCurrentPage < trendLength) {
        trendCurrentPage++;
        //현재 페이지 변경
        pageController.animateToPage(trendCurrentPage,duration:Duration(milliseconds:200), curve: Curves.easeIn);
      } else {
        trendCurrentPage = 0;
        //페이지 초기화
        pageController.animateToPage(trendCurrentPage,duration:Duration(milliseconds:200), curve: Curves.bounceOut);
      }

    });
  }

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();


  }

  @override
  void onClose() {
    super.onClose();
    myTimer.cancel();
  }

  @override
  String getControllerTag() {
    return _TAG;
  }

}