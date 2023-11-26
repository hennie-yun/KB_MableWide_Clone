import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_mdi/constants/CommonColor.dart';
import 'package:sm_mdi/page/myAssets/MyAssetPage.dart';
import 'package:sm_mdi/page/primeClub/PrimeClubPage.dart';

import '../../manager/MenuManager.dart';
import '../pickStock/PickStockPage.dart';
import '../trading/TradingMain.dart';
import 'MainContent.dart';
import 'MainSideBarController.dart';

class MainSideBar extends StatelessWidget{

  MainSideBarController controller = MainSideBarController();

  var noOverlayButtonStyle = ButtonStyle(
    overlayColor: MaterialStateProperty.all(CommonColor.bgDarkMode),
  );

  final double borderWidth = 4.5;
  final double appBarHeight = 60.0;
  final double sideBarWidth = 90.0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getMenuList(),
        builder: (context, snapshot){
          return setBuild(context);
        }
    );
  }


  Widget setBuild(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: sideBarWidth,
      child: Stack(
          alignment: AlignmentDirectional.center,
          children: [

            //border
            Positioned(
                top: appBarHeight - borderWidth,
                bottom:0,
                left:0,
                child: Container(
                  width: sideBarWidth,
                  height:appBarHeight,
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(color:CommonColor.borderGrey, width:borderWidth)
                      )
                  ),
                )
            ),

            //로고
            Positioned(
              top:10,
              child: Image.asset('assets/images/ic_main_logo.png', width:48)
            ),

            //메뉴 버튼
            Positioned(
                top:78,
                child:  SizedBox(
                    height: 304,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //홈 버튼
                          Obx(()=> SizedBox(
                              width: 48,
                              height:48,
                              child: TextButton(
                                  onPressed: (){
                                    MenuManager.instance.movePage(MainContent());
                                  },
                                  onHover: (isHover){
                                    if(isHover){
                                      controller.homeIconColor.value = CommonColor.white;
                                    }
                                    else{
                                      controller.homeIconColor.value = CommonColor.fontGrey;
                                    }
                                  },
                                  child: AnimatedSize(
                                    duration: const Duration(milliseconds: 1000),
                                    curve: Curves.easeIn,
                                    child: Icon(Icons.home_rounded,
                                      color: controller.homeIconColor.value,
                                      size: controller.homeIconSize.value, //controller.homeIconSize.value
                                    ),
                                  )
                              )
                          )),
                          //찜한주식 버튼
                          Obx(()=>SizedBox(
                              width: 48,
                              height:48,
                              child: TextButton(
                                onPressed: (){
                                  MenuManager.instance.movePage(PickStockPage());
                                },
                                onHover: (isHover){
                                  if(isHover){
                                    controller.starIconColor.value = CommonColor.white;
                                  }
                                  else{
                                    controller.starIconColor.value = CommonColor.fontGrey;
                                  }
                                },
                                //style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(20))),
                                child: Icon(Icons.star_border_rounded,
                                  color: controller.starIconColor.value,
                                  size:25, //controller.homeIconSize.value
                                ),
                              )
                          )),
                          //트레이딩 버튼
                          Obx(()=>SizedBox(
                              width: 48,
                              height:48,
                              child: TextButton(
                                onPressed: (){
                                  MenuManager.instance.movePage(TradingMain());

                                },
                                onHover: (isHover){
                                  if(isHover){
                                    controller.tradeIconColor.value = CommonColor.white;
                                  }
                                  else{
                                    controller.tradeIconColor.value = CommonColor.fontGrey;
                                  }
                                },
                                //style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(20))),
                                child: Icon(Icons.monitor_heart_rounded,
                                  color: controller.tradeIconColor.value,
                                  size:25, //controller.homeIconSize.value
                                ),
                              )
                          )),
                          //프라임클럽 버튼
                          Obx(()=>SizedBox(
                              width: 48,
                              height:48,
                              child: TextButton(
                                onPressed: (){
                                  MenuManager.instance.movePage(PrimeClubPage());
                                },
                                onHover: (isHover){
                                  if(isHover){
                                    controller.primeClubIconColor.value = CommonColor.white;
                                  }
                                  else{
                                    controller.primeClubIconColor.value = CommonColor.fontGrey;
                                  }
                                },
                                //style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(20))),
                                child: Icon(Icons.workspace_premium_rounded,
                                  color: controller.primeClubIconColor.value,
                                  size:25, //controller.homeIconSize.value
                                ),
                              )
                          )),
                          //내자산 버튼
                          Obx(()=>SizedBox(
                              width: 48,
                              height:48,
                              child: TextButton(
                                onPressed: (){
                                  MenuManager.instance.movePage(MyAssetPage());
                                },
                                onHover: (isHover){
                                  if(isHover){
                                    controller.myAssetIconColor.value = CommonColor.white;
                                  }
                                  else{
                                    controller.myAssetIconColor.value = CommonColor.fontGrey;
                                  }
                                },
                                //style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(20))),
                                child: Icon(Icons.pie_chart_rounded,
                                  color: controller.myAssetIconColor.value,
                                  size:25, //controller.homeIconSize.value
                                ),
                              )
                          )),

                        ]
                    )
                )
            ),

            //하단 버튼
            Positioned(
              bottom:80,
              child: Column(
                children: [

                  //라이트모드 버튼
                  SizedBox(
                      width:48,
                      height: 48,
                      child:TextButton(
                          onPressed: (){
                          },
                          child: Icon(Icons.light_mode_rounded,
                              color: controller.homeIconColor.value,
                              size: 25),
                          style: ButtonStyle(padding: MaterialStateProperty.all(const EdgeInsets.all(0)))
                      )
                  ),

                  //설정 버튼
                  SizedBox(
                    width:48,
                    height: 48,
                    child: TextButton(
                        onPressed: (){},
                        child: Icon(Icons.settings_rounded,
                            color: controller.homeIconColor.value),
                        style: ButtonStyle(padding: MaterialStateProperty.all(const EdgeInsets.all(0)))
                    )
                  )
                ],
              )
            ),

            //메뉴 확장 버튼
            Positioned(
              bottom:10,
              child:
              SizedBox(
                  width:48,
                  height: 48,
                  child:TextButton(
                      onPressed: (){
                        Scaffold.of(context).openDrawer();
                      },
                      child: Icon(Icons.double_arrow_rounded,
                          color: controller.homeIconColor.value,
                          size: 25),
                      style: ButtonStyle(padding: MaterialStateProperty.all(const EdgeInsets.all(0)))
                  )
              )
            )


          ],
        )
    );
  }


}