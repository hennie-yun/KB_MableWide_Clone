import 'dart:async';

import 'package:get/get.dart';

class MyAssetPageController extends GetxController{

  //선택된 차트영역이 없도록 100을 할당
  var seletedIndex = 100.obs;

  var ratioSection_1 = 20.0.obs;
  var ratioSection_2 = 80.0.obs;


  @override
  void onInit() {
    print("init");
    super.onInit();
    ratioSection_1.value = 80;
    ratioSection_2.value = 20;
  }

  @override
  void onReady() {
    print("onReady");
    super.onReady();
  }

  void initChart(){

    Timer.periodic(Duration(milliseconds: 200), (timer) async {

      ratioSection_1.value = 80;
      ratioSection_2.value = 20;

      timer.cancel();

    });

  }

}