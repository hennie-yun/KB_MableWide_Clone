import 'package:flutter/material.dart';
import 'package:sm_mdi/page/advertisement/Advertisement.dart';
import 'package:sm_mdi/page/article/Article.dart';
import 'package:sm_mdi/page/moneyTheme/MoneyTheme.dart';

import '../etf/EFTPage.dart';
import '../findStock/FindStock.dart';
import '../liveRank/LiveRank.dart';
import '../news/NewsPage.dart';
import '../pick/PickCard.dart';
import '../slider/SliderPage.dart';

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView (
        child : Column (
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // MainAppBar(),
              Container(
                  padding : const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child :SliderPage()
              ),
              Container(
                  padding : const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child : NewsPage()
              ),
              Container(
                padding : const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child :  LiveRank(),
              ),
              Container(
                  padding : const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child : FindStock()
              ),
              Container(
                padding : const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child :  Advertisement(),
              ),
              Container(
                padding : const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child :  MoneyTheme(),
              ),
              Container(
                  padding : const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child : Article()
              ),
              Container(
                padding : const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child :  ETFPage(),
              ),
              Container(
                padding : const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child :  PickCard(),
              ),
              Container(
                padding : const EdgeInsets.fromLTRB(0, 50, 0, 0),
              ),

            ]
        )
    );
  }

}