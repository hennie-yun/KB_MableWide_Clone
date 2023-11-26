import 'package:get/get.dart';

abstract class BasePageController<T> extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }


  void onResume() {
  }

  void onPause() {
  }

  void onForeground() {
  }

  void onBackground() {
  }

  String getControllerTag();
}