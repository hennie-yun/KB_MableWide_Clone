import 'package:flutter/material.dart';
import 'package:sm_mdi/constants/CommonColor.dart';

import '../StoreUtils/StoreUtils.dart';
class MainDialog extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width : 450,
        height: 450,
        child : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Image.asset(
                "assets/images/pop.png",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CommonColor.bannerDark_GREY,
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                      ),
                      child: Text('M-able 와이드 둘러보기',
                          style: TextStyle(color: CommonColor.white))),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CommonColor.fontYellow,
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                    ),
                    child: Text(
                      '이벤트 자세히 보기',
                      style: TextStyle(color: CommonColor.bannerBgDown_DK),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextButton(
                style:
                TextButton.styleFrom(foregroundColor: CommonColor.fontGrey),
                child: const Text('오늘 하루 그만 보기',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    )),
                onPressed: () {
                  StoreUtils.instance.hidePage();
                  Navigator.of(context).pop();
                },
              ),
            ],

        ));
  }

}
