import 'dart:js';

import 'package:sm_mdi/StoreUtils/StoreUtils.dart';

import '../../base/BasePageController.dart';


class MainPageController extends BasePageController<MainPageController>{

  static const _TAG = 'MainPageController';

  StoreUtils storeUtils = StoreUtils();

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

  }

  @override
  String getControllerTag() {
    return _TAG;
  }
}