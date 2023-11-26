import 'package:flutter/material.dart';

import '../../constants/CommonColor.dart';

class BuySell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: CommonColor.black, width: 4)
        ),
        child: DefaultTabController(
            length: 2,
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
                              Tab(text: "매수"),
                              Tab(text: "매도"),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '계좌 비밀번호를 입력해주세요',
                                    style: TextStyle(
                                        color: CommonColor.fontdimmedGrey),
                                  ),
                                  SizedBox(height: 5),

                                  Text(
                                    '비밀번호 입력 >',
                                    style: TextStyle(
                                        color: CommonColor.fontdimmedGrey, fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '계좌 비밀번호를 입력해주세요',
                                    style: TextStyle(
                                        color: CommonColor.fontdimmedGrey),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '비밀번호 입력 >',
                                    style: TextStyle(
                                        color: CommonColor.fontdimmedGrey, fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
