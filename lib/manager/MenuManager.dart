
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sm_mdi/page/myAssets/MyAssetPage.dart';
import 'package:sm_mdi/page/pickStock/PickStockPage.dart';

import '../page/error/ErrorPage.dart';
import '../page/main/MainContent.dart';

class MenuManager{

  ///싱글톤 구현
  static final MenuManager _instance = MenuManager._();
  static MenuManager get instance => _instance;

  var selectedMenu = 0;

  var _contents =( MainContent() as StatelessWidget).obs;
  Rx<StatelessWidget> get contents => _contents;

  MenuManager._(){
    print("MenuManager is init");
  }


  ///메뉴이동시 menuIndex 인자값 필수!
  void movePage(StatelessWidget widget, {int? menuIndex}){

    // //widget과 menuIndex 중 하나만 넣을 수 있도록 검증
    // if ((widget != null && menuIndex != null) || (widget == null && menuIndex == null)) {
    //   throw ArgumentError("widget또는 menuIndex 하나만 넣을 수 있습니다.");
    // }

    // //메뉴 인덱스로 이동하는 경우
    // if(menuIndex != null){
    //   _contents.value = getPage(menuIndex!);
    // }
    // //직접 클래스를 넣은 경우
    // else{
    // }
    _contents.value = widget;

  }


  StatelessWidget getPage(int menuIndex){

    switch(menuIndex) {
      //홈화면
      case 0:
        return MainContent();
      //찜한 주식
      case 1:
        return PickStockPage();
      //트레이딩
      case 2:
        return MainContent();
      //PRIME CLUB
      case 3:
        return MainContent();
      //내자산
      case 4:
        return MyAssetPage();
      //에러발생
      default:
        return ErrorPage();

    }
  }


}