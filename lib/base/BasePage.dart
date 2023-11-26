import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_mdi/constants/CommonColor.dart';

import 'BasePageController.dart';

abstract class BasePage<T> extends StatelessWidget {

  late BasePageController ctrl;
  BasePageController getController();

  BasePage({T? controller}) {
    if(controller != null){
      ctrl = Get.put(controller as BasePageController);
    }
    else{
      ctrl = Get.put(getController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: CommonColor.bgDarkMode);
  }

}