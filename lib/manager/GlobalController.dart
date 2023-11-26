import 'package:get/get.dart';


class GlobalController {

  static const _TAG ='GlobalController';

  ///싱글톤 구현
  static final GlobalController _instance = GlobalController._();
  static GlobalController get instance => _instance;

  GlobalController._(){
    print("GlobalController is init");
  }

  ///로그인여부 저장
  var isLogined = false.obs;

  @override
  String getControllerTag() {
    return _TAG;
  }

}
