import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sm_mdi/data/ThemedStock.dart';

class ThemedStockPageController extends GetxController {

  ///json데이터 저장
  List<ThemedStock> themedStockList = [];

  ThemedStockPageController(){
    //init();
  }

  //테마주JSON데이터읽은 후 데이터를 객체에 저장
  Future<void> init() async {
    //json파일 읽어오기

    /// todo a. 파일존재여부 예외처리하기
    final files = await rootBundle.loadString("assets/data/themedStock.json");

    //json to List
    List<dynamic> items = jsonDecode(files);

    //List to List<ThemedStock>
    items.forEach((value) {
      final themedStock = ThemedStock();

      themedStock.subject = value["subject"];
      themedStock.fluctuation_rate = value["fluctuation_rate"];

      List<dynamic> themedStockItems =  value["stocks"];

      themedStockItems.forEach((item) {

        final themedStockItem = ThemedStockItem();
        themedStockItem.jmCode = item["jmCode"];
        themedStockItem.name = item["name"];
        themedStockItem.currentprice = item["currentprice"];
        themedStockItem.fluctuating_price = item["fluctuating_price"];
        themedStockItem.fluctuation_rate = item["fluctuation_rate"];
        themedStockItem.isUp = item["isUp"];

        themedStock.stocks.add(themedStockItem);
      });

      print(themedStock.subject);

      themedStockList.add(themedStock);
    });

    print("items type:");


  }

}