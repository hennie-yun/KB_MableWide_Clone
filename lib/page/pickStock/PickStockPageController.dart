
import 'package:get/get.dart';

class PickStockPageController extends GetxController {

  var type = '현재가'.obs;

  void changeType(){
    if (type.value == '현재가') {
      type.value = '예상가';
    } else {
      type.value = '현재가';
    }

  }
}