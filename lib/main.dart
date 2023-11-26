import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/CommonColor.dart';
import 'router/PageRouter.dart';

void main() async{

  try{
    //웹환경에선 연산불가
    if(Platform.isWindows || Platform.isMacOS){
      WidgetsFlutterBinding.ensureInitialized();
      await DesktopWindow.setMinWindowSize(const Size(900,720)); /// 창 최소 크기
      await DesktopWindow.setFullScreen(true);                   /// 전체화면으로 열기
    }
  }
  catch(error){
    print(error);
  }


  // Get.put(GlobalController());
  // await MenuManager.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: CommonColor.bgDarkMode,
          fontFamily: 'Pretendard'),
      title: "sm_mdi",
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade, /// Transition : 화면 전환 모드
      getPages: PageRouter.route,         /// Router ( 화면 - 이름 목록 )
      initialRoute: '/mainPage',        /// 초기화 ( 최초 ) 할 화면의 "이름"을 정의
    );
  }
}

