import 'package:get/get.dart';
import 'package:sm_mdi/page/main/MainPage.dart';

/// PageRouter
/// 화면 ( page ) 및 이름 ( ex. /splashPage ), 전환 효과 ( transition ) 등 정의
class PageRouter {
  static final route = [
    // 메인페이지
    GetPage(
        name: '/mainPage',
        page: () => MainPage(),
        transition: Transition.upToDown
    ),

  ];

  static GetPageBuilder getPage(String screenKey){
    //route[0].name;
    var page;
    route.forEach((item) {
      if( item.name == "/$screenKey"){
        page = item;
      }
    });
    return page.page;
  }

}

