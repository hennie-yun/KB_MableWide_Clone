import 'package:flutter/material.dart';

import '../../constants/CommonColor.dart';

class TradingPrice extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: CommonColor.black, width: 4)),
      child: DefaultTabController(
        length: 3,
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
                        labelPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Tab(text: "호가"),
                          Tab(text: "체결"),
                          Tab(text: "일별"),
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
                    Image.asset("assets/images/chart_fake.png"),
                    Image.asset("assets/images/chart_fake.png"),
                    Image.asset("assets/images/chart_fake.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}