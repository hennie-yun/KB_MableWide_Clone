import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sm_mdi/base/BasePageController.dart';
import 'package:sm_mdi/constants/CommonColor.dart';
import 'package:sm_mdi/data/MenuList.dart';

class MainSideBarController extends BasePageController<MainSideBarController>{

  static const _TAG = 'MainSideBarController';

  //버튼 아이콘 색상
  var homeIconColor = CommonColor.fontGrey.obs;
  var starIconColor = CommonColor.fontGrey.obs;
  var tradeIconColor = CommonColor.fontGrey.obs;
  var primeClubIconColor = CommonColor.fontGrey.obs;
  var myAssetIconColor = CommonColor.fontGrey.obs;

  //버튼 아이콘 크기
  var homeIconSize = 25.0.obs;

  ///json데이터 저장
  List<MenuList> menuList = [];

  ///메뉴데이터 가져오기
  Future<void> getMenuList() async {

    final files = await rootBundle.loadString("assets/data/menuList.json");

    //json to Map
    var items = jsonDecode(files);

    //Map to List
    List<dynamic> menuObject = items["menuList"];

    for (var element in menuObject) {

      final menuObject = MenuList();
      menuObject.menuName = element["menuName"];
      menuObject.menuIcon = element["menuIcon"];

      //List에 MenuList객체 저장
      menuList.add(menuObject);
    }

    print(menuList);

  }


  //버튼 hover 애니메이션
  // void btnAnimation(RxDouble btnSize, int duration, bool ishover){
  //   var count = 0;
  //   Timer.periodic(Duration(microseconds: 1), (timer) {
  //     // 1초마다 실행될 코드
  //     print('Callback executed');
  //
  //     if(ishover){
  //       btnSize.value -= 0.0001;
  //     }
  //     else{
  //       btnSize.value += 0.0001;
  //     }
  //     count++;
  //
  //     if (count >= duration) {
  //       // 횟수가 n에 도달하면 타이머 해제
  //       timer.cancel();
  //       print('Timer canceled');
  //     }
  //   });
  // }


  @override
  String getControllerTag() {
    return _TAG;
  }

}
