import 'package:flutter/material.dart';
import 'package:sm_mdi/constants/CommonColor.dart';

class MainDrawer extends StatelessWidget{

  GlobalKey<ScaffoldState> scaffoldKey;
  MainDrawer({Key? key, required this.scaffoldKey}): super(key: key);

  Widget _getListTile(String title){
    return TextButton(
      onPressed: (){},
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 12),
        minVerticalPadding: 0.0,
        horizontalTitleGap: 0,
        title: Text(title, style: TextStyle(color:CommonColor.fontGrey, fontSize: 17, fontWeight: FontWeight.w500)),
        onTap: (){
          if(scaffoldKey.currentState!.isDrawerOpen){
            scaffoldKey.currentState!.closeDrawer();
          }
        },
      )
    ) ;
  }

  // Widget _getMenuTile(MenuList menu, int index){
  //   return TextButton(
  //       onPressed: (){},
  //       child: ListTile(
  //         contentPadding: const EdgeInsets.only(left: 12),
  //         minVerticalPadding: 0.0,
  //         horizontalTitleGap: 0,
  //         title: Text(menu.menuName , style: TextStyle(color:CommonColor.fontGrey, fontSize: 17, fontWeight: FontWeight.w500)),
  //         onTap: (){
  //           MenuManager.instance.movePage(MainPage(),menuIndex: index);
  //         },
  //       )
  //   ) ;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        width: 300,
        color: CommonColor.bgDarkMode,
        child: Column(
          children: [
            Expanded(child:
              ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset('assets/images/ic_main_logo.png', width:48)
                    ),
                    const SizedBox(height:30),
                    Column(
                      children: [
                        _getListTile("홈"),
                        _getListTile("찜한주식"),
                        _getListTile("트레이딩"),
                        _getListTile("PRIME CLUB"),
                        _getListTile("내자산"),
                      ]
                    ),

                    Divider(height: 1.5, color:  CommonColor.lineGrey),
                    _getListTile("이벤트"),
                    _getListTile("배당 및 세금"),
                    _getListTile("뱅킹"),
                    _getListTile("공모주"),
                    _getListTile("인증/보안"),
                    _getListTile("거래시작"),
                    _getListTile("고객서비스"),
                  ]
              )
            ),

            //하단 버튼
            Row(
              children: [

                SizedBox(
                    width: 48,
                    height: 48,
                    child: TextButton(
                        onPressed: (){
                          if(scaffoldKey.currentState!.isDrawerOpen){
                            scaffoldKey.currentState!.closeDrawer();
                          }
                        },
                        child: Icon(Icons.keyboard_double_arrow_left_rounded,
                            color: CommonColor.fontGrey),
                        style: ButtonStyle(padding: MaterialStateProperty.all(const EdgeInsets.all(0)))
                    )
                ),

                //라이트모드 버튼
                SizedBox(
                    width:48,
                    height: 48,
                    child:TextButton(
                        onPressed: (){
                        },
                        child: Icon(Icons.light_mode_rounded,
                            color: CommonColor.fontGrey,
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
                            color: CommonColor.fontGrey),
                        style: ButtonStyle(padding: MaterialStateProperty.all(const EdgeInsets.all(0)))
                    )
                )
              ],
            )
          ],
        )


    );
  }

}