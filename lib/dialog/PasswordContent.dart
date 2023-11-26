import 'package:flutter/material.dart';

import '../constants/CommonColor.dart';

class PasswordContent extends StatelessWidget{

  String accountName = "X";
  String accountNum = "0-000-0";

  PasswordContent({required String name, required String number}){
    this.accountName = name;
    this.accountNum = number;
  }

  //포커스 관리
  FocusNode _pwdFocus = FocusNode();
  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 520,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //계좌번호 텍스트
          RichText(
              text: TextSpan(
                  text: accountName+" ",
                  style: TextStyle(color: CommonColor.fontLightGrey, fontSize: 17, fontWeight: FontWeight.w300, fontFamily: "Pretendard"),
                  children: [
                    TextSpan(text: accountNum)
                  ]
              )
          ),

          //비밀번호 입력 텍스트필드
          Padding(
              padding: EdgeInsets.fromLTRB(0 , 10, 0, 20),
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: _editingController,
                readOnly:true,
                focusNode: _pwdFocus,
                maxLength: 4,
                showCursor: false,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(color:CommonColor.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: CommonColor.bgDarkMode,
                  hintText:"계좌비밀번호를 입력해주세요",
                  hintStyle: TextStyle(color:CommonColor.fontGrey, fontSize: 15),
                  //내부컨텐츠 패딩 조절
                  contentPadding: EdgeInsets.fromLTRB(10, 25, 10, 25),
                  counterText: "",
                  // 대기 상태 일 때
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CommonColor.fontYellow, width: 1.2),
                      borderRadius: const BorderRadius.all(Radius.circular(5.0))
                  ),
                  //포커스 상태 일 때
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CommonColor.fontYellow, width: 1.2),
                      borderRadius: const BorderRadius.all(Radius.circular(5.0))
                  ),
                ),
              )
          ),

          //키패드 영역
          Flexible(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: OutlinedButton(
                              onPressed: (){},
                              style:const ButtonStyle(
                                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 20)),
                                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero, // 원하는 radius 값 설정
                                  )),
                                  side: MaterialStatePropertyAll(BorderSide(width: 1.0))
                              ),
                              child:Text(
                                "일반키패드 전환하기",
                                style: TextStyle(color: CommonColor.white, fontSize: 17, fontWeight: FontWeight.w300),
                                textAlign: TextAlign.right,
                              )
                          )
                      )
                    ],
                  ),
                  //1번줄
                  Expanded(
                      child: Row(
                        children: [
                          getKeyNumber(context, 1),
                          getEmptyKey(),
                          getKeyNumber(context, 2),
                          getEmptyKey()
                        ],
                      )
                  ),
                  //2번줄
                  Expanded(
                      child: Row(
                        children: [
                          getKeyNumber(context, 3),
                          getKeyNumber(context, 4),
                          getKeyNumber(context, 5),
                          getKeyNumber(context, 6),
                        ],
                      )
                  ),
                  //3번줄
                  Expanded(
                      child: Row(
                        children: [
                          getKeyNumber(context, 7),
                          getKeyNumber(context, 8),
                          getKeyNumber(context, 9),
                          getKeyNumber(context, 0),
                        ],
                      )
                  ),
                  //지우기, 완료 버튼 줄
                  Expanded(
                      child: Row(
                        children: [
                          //지우기 버튼
                          Expanded(
                              child: TextButton(
                                  onPressed: (){
                                    //마지막 문자 하나 제거
                                    if(_editingController.text.length != 0){
                                      String newText = _editingController.text.substring(0, _editingController.text.length - 1);
                                      _editingController.text = newText;
                                    }
                                  },
                                  style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          color: CommonColor.bannerGrey_DK
                                      ),
                                      child: Icon(Icons.arrow_back_rounded, color: CommonColor.white)
                                  )
                              )
                          ),
                          //입력완료 버튼
                          Expanded(
                              child: TextButton(
                                  onPressed: (){},
                                  style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          color: CommonColor.btnYellow
                                      ),
                                      child: Text("입력완료", style: TextStyle(color: CommonColor.black, fontWeight: FontWeight.w500, fontSize: 22))
                                  )
                              )
                          )
                        ],
                      )
                  )

                ],
              )
          )
        ],
      )
    );
  }


  Widget getKeyNumber(BuildContext context, int number){
    return Expanded(
        child: TextButton(
          onPressed: (){
            if(!_pwdFocus.hasFocus && _editingController.text.length < 4){
              FocusScope.of(context).requestFocus(_pwdFocus);
              _editingController.text += "${number}";
            }
          },
            style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: CommonColor.bannerGrey_DK
              ),
              child: Text("${number}", style: TextStyle(color: CommonColor.white, fontWeight: FontWeight.w200, fontSize: 30),)
          )
        )
    );
  }

  Widget getEmptyKey(){
    return Expanded(
        child: Container(
          color: CommonColor.black
        )
    );
  }

}