import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sm_mdi/page/trading/TradingSummary.dart';

import 'BuySell.dart';
import 'Chart.dart';
import 'OtherTabs.dart';
import 'RankingPage.dart';
import 'TradingPrice.dart';

class TradingMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: TradingSummary()),
              Expanded(flex: 4, child: RankingPage())
            ],
          )),
      Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: Chart()),
              Expanded(flex: 1, child: OtherTabs())
            ],
          )),
      Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: TradingPrice()),
              Expanded(flex: 1, child:  BuySell())
            ],
          ))
    ]);
  }
}
