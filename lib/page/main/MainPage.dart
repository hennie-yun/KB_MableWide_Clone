import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../StoreUtils/StoreUtils.dart';
import '../../dialog/BasePopUpWindow.dart';
import '../../dialog/MainDialog.dart';
import '../../manager/MenuManager.dart';
import 'MainAppBar.dart';
import 'MainDrawer.dart';
import 'MainSideBar.dart';

class MainPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// true 면 24시간 지났음 false 는 24시간 안지났음
  final containerWidth = 1100.0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: StoreUtils.instance.checkShowPage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            key: _scaffoldKey,
            drawer: MainDrawer(scaffoldKey: _scaffoldKey),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.hasError || snapshot.data == true) {
            Future.delayed(Duration.zero, () {
              popWindow(context, "", MainDialog());
            });
          }

          return Scaffold(
            key: _scaffoldKey,
            drawer: MainDrawer(scaffoldKey: _scaffoldKey),
            body: Row(
              children: [
                // 사이드바
                MainSideBar(),
                Expanded(
                  child: Column(
                    children: [
                      // 상단바
                      MainAppBar(),
                      // 컨텐츠 영역
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                              left: 30, top: 15, right: 30, bottom: 15),
                          constraints: BoxConstraints(
                              minWidth: containerWidth
                          ),
                          child: Obx(() {
                            return MenuManager.instance.contents.value;
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

