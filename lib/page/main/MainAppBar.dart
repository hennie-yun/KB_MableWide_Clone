import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_mdi/constants/CommonColor.dart';
import 'package:sm_mdi/manager/GlobalController.dart';
import 'package:sm_mdi/page/main/MainAppBarController.dart';

import '../../dialog/BasePopUpWindow.dart';
import '../../dialog/LoginContent.dart';

class MainAppBar extends StatelessWidget {

  MainAppBarController controller = MainAppBarController();



  late var pageController = PageController(
    initialPage: 0,
  );

  MainAppBar({Key? key}): super(key: key){
    controller.startTimer(pageController, 5);
  }

  final double sideBarWidth = 90;
  final double appBarHeight = 60;

  //버튼 스타일
  var iconButtonStyle = ButtonStyle(
    padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(0, 0, 0, 0)),
    overlayColor: MaterialStateProperty.all(Colors.transparent),
  );
  var bgNoneButtonStyle = ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(10, 13, 10, 13)),
      textStyle:MaterialStateProperty.all(const TextStyle(fontWeight: FontWeight.w600)),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.all(CommonColor.white),);
  var bgYellowButtonStyle = ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(10, 13, 10, 13)),
      textStyle:MaterialStateProperty.all(const TextStyle(fontWeight: FontWeight.w600)),
      backgroundColor: MaterialStateProperty.all(CommonColor.fontYellow),
      foregroundColor: MaterialStateProperty.all(CommonColor.bgDarkMode),
      overlayColor: MaterialStateProperty.all(CommonColor.btnYellow_hover));

  //텍스트 스타일
  var pageViewTextStyle = TextStyle(color: CommonColor.fontGrey, fontSize: 14, fontWeight: FontWeight.w500);


  List<Widget> getRanking(){
    return  controller.trendRank.map((item){
      return Align(alignment: Alignment.centerLeft, child: Text(item, style: pageViewTextStyle));
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - sideBarWidth,
      height: appBarHeight,
      decoration: BoxDecoration(
        color: CommonColor.bgDarkMode,
        border: Border(
          bottom: BorderSide(color: CommonColor.borderGrey, width: 4.5),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: Stack(
          fit: StackFit.passthrough,
          alignment: AlignmentDirectional.center,
          children: [

            //실시간 인기순위 영역
            Positioned(
                left:200,
                child: Padding(
                    padding:EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child:Row(
                      children: [
                        Text("실시간인기", style: TextStyle(color: CommonColor.fontYellow, fontSize: 14)),
                        //인기 분야 박스 '국내'/'해외'
                        Padding(
                            padding: EdgeInsets.fromLTRB(9, 0, 8, 0),
                            child:Container(
                                decoration: BoxDecoration(color:CommonColor.grey, borderRadius: BorderRadius.circular(4)),
                                child:Padding(padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                    child:Text("국내", style:TextStyle(color: CommonColor.white, fontSize: 12.5))
                                )
                            )
                        ),
                        //페이지뷰(실시간 검색어) 영역
                        SizedBox(
                            width:150,
                            height:30,
                            child: PageView(
                              scrollDirection: Axis.vertical,
                              controller: pageController,
                              children:getRanking(),
                            )
                        )
                      ],
                    )
                )
            ),
            //오른쪽 버튼모음 영역
            Positioned(
              right:0,
              child: SizedBox(
                  width:253,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //다운로드 아이콘
                        Tooltip(
                            message:"M-able 와이드를 앱으로 사용해보세요.\n바탕화면에 설치하여 바로 접속할 수 있어요!",
                            textStyle: TextStyle(fontWeight: FontWeight.w200, fontSize: 14, color: CommonColor.white),
                            padding: EdgeInsets.all(17),
                            decoration: BoxDecoration(color: CommonColor.bgTooltip, borderRadius: BorderRadius.circular(10)),
                            preferBelow:false,
                            child:SizedBox(
                                width:30,
                                height:30,
                                child: Obx(()=>TextButton(
                                  onPressed: (){
                                    pageController.nextPage(duration:Duration(milliseconds:300), curve: Curves.easeIn);
                                  },
                                  onHover: (isHover){
                                    //색변경
                                    if(isHover){


                                      controller.downloadIconColor.value =  CommonColor.white;
                                    }
                                    else{
                                      controller.downloadIconColor.value =  CommonColor.fontGrey;
                                    }
                                  },
                                  style:iconButtonStyle,
                                  child:Icon(Icons.file_download_outlined,
                                      color: controller.downloadIconColor.value, size: 29),
                                ))
                            )
                        ),
                        //공지 아이콘
                        SizedBox(
                            width:30,
                            height:30,
                            child: Obx(()=>TextButton(
                              onPressed: (){
                                pageController.previousPage(duration:Duration(milliseconds:300), curve: Curves.easeIn);
                              },
                              onHover: (isHover){
                                if(isHover){
                                  controller.notiIconColor.value =  CommonColor.white;
                                }
                                else{
                                  controller.notiIconColor.value =  CommonColor.fontGrey;
                                }
                              },
                              style:iconButtonStyle,
                              child:Icon(Icons.notifications,
                                  color: controller.notiIconColor.value, size: 29),
                            ))
                        ),
                        //구분선
                        VerticalDivider(color:CommonColor.lineGrey, thickness: 1.0,),
                        Obx(()=> TextButton(
                            onPressed:(){
                              if(GlobalController.instance.isLogined.value == true){
                                //로그아웃 처리
                                GlobalController.instance.isLogined.value = false;
                              }
                              else{
                                //로그인 창 띄우기
                                popWindow(context, "로그인", LoginContent() );
                              }
                            },
                            child: Text(GlobalController.instance.isLogined.value ? "로그아웃":"로그인"), style: bgNoneButtonStyle),
                        ),

                        ElevatedButton(onPressed: (){}, child: Text("시작하기"), style: bgYellowButtonStyle)
                      ]
                  )
              ) ,
            ),
            //검색 영역
            Obx(()=> Positioned(
                left:0,
                child: SizedBox(
                    width: controller.searchWidth.value,
                    height:35,
                    child: TextField(
                      onTap:(){
                        controller.searchWidth.value = 350.0;
                      },
                      onTapOutside:(event){
                        controller.searchWidth.value = 200.0;
                        controller.searchFocus.unfocus();
                      },
                      focusNode: controller.searchFocus,
                      maxLength: 40,
                      cursorColor:CommonColor.white,
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(color:CommonColor.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CommonColor.bgDarkMode,
                        //검색버튼
                        suffixIcon: IconButton(
                          onPressed: (){},icon: Icon(Icons.search),
                          iconSize: 25,
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.center,
                        ),
                        suffixIconColor:CommonColor.fontGrey,
                        hintText:"주식, 메뉴, 종목코드 검색",
                        hintStyle: TextStyle(color:CommonColor.fontGrey, fontSize: 13),
                        //내부컨텐츠 패딩 조절
                        contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        counterText: "",
                        //대기 상태 일 때
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: CommonColor.fontGrey, width: 1.8),
                            borderRadius: const BorderRadius.all(Radius.circular(5.0))
                        ),
                        //포커스 상태 일 때
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: CommonColor.fontYellow, width: 2.2),
                            borderRadius: const BorderRadius.all(Radius.circular(5.0))
                        ),
                      ),
                    )
                )
            )),
          ]
        )
      )
    );
  }

}