import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../data/JmListData.dart';

class LiveChartController extends GetxController {
  RxBool pickCheck = false.obs;

  //Json 데이터 저장 할 리스트
  List<JmListData> jmData = [];

  LiveChartController() {
    // init();
  }

  Future<void> init() async {
    final files = await rootBundle.loadString("assets/data/jmListData.json");

    List<dynamic> items = jsonDecode(files);

    items.forEach((value) {
      final jmStockList = JmListData();
      jmStockList.subject = value["subject"];
      List<dynamic> jmListItems = value["stocks"];

      jmListItems.forEach((item) {
        final jmListItem = JmStockItem();
        jmListItem.jmImg = item["jmImg"];
        jmListItem.jmName = item["jmName"];
        jmListItem.currentPrice = item["currentPrice"];
        jmListItem.beforePrice = item["beforePrice"];
        jmListItem.variation = item["variation"];
        jmListItem.variationRate = item["variationRate"];
        jmListItem.isUp = item["isUp"];

        jmStockList.stocks.add(jmListItem);
      });

      print ("############");

      jmData.add(jmStockList);

      print("Printing jmData:");
      for (JmListData jmListData in jmData) {
        print("Subject: ${jmListData.subject}");

        for (JmStockItem jmListItem in jmListData.stocks) {
          print("  jmImg: ${jmListItem.jmImg}");
          print("  jmName: ${jmListItem.jmName}");
          print("  currentPrice: ${jmListItem.currentPrice}");
          print("  beforePrice: ${jmListItem.beforePrice}");
          print("  variation: ${jmListItem.variation}");
          print("  variationRate: ${jmListItem.variationRate}");
          print("  isUp: ${jmListItem.isUp}");
          print("");
        }
      }
    });
  }
}
