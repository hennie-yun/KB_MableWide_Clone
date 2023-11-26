import 'package:flutter/material.dart';

import '../../constants/CommonColor.dart';
import '../myAssets/MyAssetPage.dart';
import '../news/NewsDetail.dart';

class OtherTabs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: CommonColor.black, width: 4)),
      child : tabBar()
    );
  }

  Widget tabBar() {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 5,
                    child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Color(0xFF7D7E85),
                      labelStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      indicatorColor: Colors.transparent,
                      // Set indicatorColor to transparent
                      labelColor: Colors.white,
                      labelPadding: EdgeInsets.all(10),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(text: "잔고"),
                        Tab(text: "주문내역"),
                        Tab(text: "뉴스"),
                        Tab(text: "기업정보"),
                        Tab(text: "공시"),
                        Tab(text: "증권방송"),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.more_vert_outlined,
                    color: CommonColor.white,

                  )
                ],
              ),
            ),
             Expanded(
              child: TabBarView(
                children: [

                    MyAssetPage(),

                  Center(
                    child: Text('Tab2', style: TextStyle(color: Colors.white)),
                  ),


                   
                    NewsDetail(),

                  Center(
                    child: Text('Tab4', style: TextStyle(color: Colors.white)),
                  ),
                  Center(
                    child: Text('Tab5', style: TextStyle(color: Colors.white)),
                  ),
                  Center(
                    child: Text('Tab6', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}