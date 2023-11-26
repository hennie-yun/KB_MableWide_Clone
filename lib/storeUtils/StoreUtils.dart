import 'package:shared_preferences/shared_preferences.dart';

class StoreUtils {
  static final StoreUtils _instance = StoreUtils();

  static StoreUtils get instance => _instance;

  SharedPreferences? _box;

  Future<void> init() async {
    _box = await SharedPreferences.getInstance();
  }


  Future<void> hidePage() async {
    if (_box == null) {
      await init();
    }

    DateTime now = DateTime.now();
    _box!.setInt('lastHideTime', now.millisecondsSinceEpoch);
  }

  Future<bool> checkShowPage() async {
    if (_box == null) {
      await init();
    }
    int? lastHideTime = _box!.getInt('lastHideTime');

    if (lastHideTime != null) {
      DateTime lastTime = DateTime.fromMillisecondsSinceEpoch(lastHideTime);
      DateTime now = DateTime.now();
      return now.difference(lastTime).inMinutes >= 60;
    } else {
      return true;
    }
  }




  Future<void> pick(String jmNameString) async {
    if (_box == null) {
      await init();
    }
    String combinedKey = 'pick$jmNameString';

    bool? currentPickValue = _box!.getBool(combinedKey);

    if (currentPickValue == null || !currentPickValue) {
      _box!.setBool(combinedKey, true);
    } else {
      _box!.setBool(combinedKey, false);
    }
  }

  Future<bool> checkStar(String jmName) async {
    if (_box == null) {
      await init();
    }
    String combinedKey = 'pick$jmName';
    bool? pick = _box!.getBool(combinedKey);
    return pick ?? false;
  }


}
