import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_mdi/manager/GlobalController.dart';

import '../constants/CommonColor.dart';

class LoginContent extends StatelessWidget{

  static const qrSize = 130.0;
  static const tabSize = 35.0;
  var imgQR = true;
  var imgQRSrc = "assets/images/qr_login1.png".obs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width:400,
        height: 520,
        child: Column(
          children: [
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  SizedBox(
                      height: tabSize,
                      child: TabBar(
                        tabs: [ Tab( text:"클라우드인증"), Tab( text:"QR인증")],
                        indicatorColor: CommonColor.btnYellow,
                      )
                  ),
                  SizedBox(
                    height: 450,
                    child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          //클라우드인증 페이지
                          CloudLogin(),
                          QRLogin()
                        ]
                    )
                  )
                ],
              ),
            ),
            //하단 보안프로그램 체크 및 자동로그아웃 설정
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //보안프로그램 실행
                Row(
                  children: [
                    Icon(Icons.check_circle_outline_rounded, color: CommonColor.fontGrey),
                    Text(" 보안프로그램실행", style: TextStyle(color: CommonColor.white)),
                  ],
                ),

                Text("자동로그아웃", style: TextStyle(color: CommonColor.white))
              ],
            )
          ],
        )
    ) ;
  }

  ///클라우드 인증 로그인 위젯 반환
  Widget CloudLogin(){
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          //이미지
          Container(
            width: 108,
            height: 108,
            margin: EdgeInsets.all(40),
            child: Image.asset("assets/images/cloud_login.png"),
          ),
          Text('클라우드 인증서는 모든 서비스 이용이 가능합니다.',
              style: TextStyle(color: CommonColor.white, fontWeight: FontWeight.w600, fontSize: 15),
          ),
          SizedBox(height: 15), // 여백
          Text("클라우드에 저장된 인증서가 있는 고객님은 바로 로그인할 수 있습니다.",
              style: TextStyle(color: CommonColor.white, fontWeight: FontWeight.w400, fontSize: 14)
          ),
          //클라우드 인증서 로그인 버튼
          Padding(
            padding: EdgeInsets.symmetric(vertical:30.0),
            child: ElevatedButton(
              onPressed: (){
                //로그인 상태로 전환 후 다이얼로그 닫기
                GlobalController.instance.isLogined.value = true;
                Get.back();
              },
              child: Text("클라우드인증서 로그인"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                backgroundColor: MaterialStateProperty.all(CommonColor.btnYellow),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                textStyle: MaterialStateProperty.all(TextStyle(fontWeight: FontWeight.w600)),
                padding: MaterialStateProperty.all(EdgeInsets.all(20)),
              ),
            )
          ),

          //보더박스
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: CommonColor.lineGrey, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            padding: EdgeInsets.all(15),
            child: Column(
                children: [
                  //인증서 등록 안내
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" · 클라우드 인증서 등록 안내 ",
                        style: TextStyle(
                          color: CommonColor.fontGrey,
                          fontSize: 13,
                        ),
                      ),
                      Tooltip(
                        richMessage: WidgetSpan(
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 400),
                            child: RichText(
                              text: TextSpan(
                                  text: "클라우드 인증서 등록 안내\n\n",
                                  style: TextStyle(color: CommonColor.white, fontSize: 17, fontWeight: FontWeight.w600),
                                  children: [
                                    TextSpan(
                                        text: "공동인증서를 보유한 고객이시라면?\n",
                                        style: TextStyle(color: CommonColor.white, fontSize: 15)
                                    ),
                                    TextSpan(
                                        text: "[클라우드인증서 로그인]버튼 클릭 > '+'버튼 클릭 > 인증서 가져오기 > 'PC 인증서 가져오기 or 스마트 기기에서 가져오기'\n\n",
                                        style: TextStyle(color: CommonColor.fontGrey, fontSize: 14)
                                    ),
                                    TextSpan(
                                        text: "인증서를 보유하지 않은 고객이시라면?\n",
                                        style: TextStyle(color: CommonColor.white, fontSize: 15)
                                    ),
                                    TextSpan(
                                        text: "[쿨라우드인증서 로그인] 버튼 클릭 > '+'버튼 클릭 > 인증서클라우드 인증센터 > ",
                                        style: TextStyle(color: CommonColor.fontGrey, fontSize: 14)
                                    ),
                                    TextSpan(
                                        text: "클라우드 인증서 (재)발급\n\n",
                                        style: TextStyle(color: CommonColor.fontYellow, fontSize: 14)
                                    ),
                                    TextSpan(
                                        text: "공동인증서를 보유한 고객이시라면??\n",
                                        style: TextStyle(color: CommonColor.white, fontSize: 15)
                                    ),
                                    TextSpan(
                                        text: "인증/OTP센터 > 클라우드인증센터 >\n",
                                        style: TextStyle(color: CommonColor.fontGrey, fontSize: 14)
                                    ),
                                    TextSpan(
                                        text: "타기관 클라우드 인증서 등록",
                                        style: TextStyle(color: CommonColor.fontYellow, fontSize: 14)
                                    )
                                  ]
                              ),
                            )
                          )
                        ),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(8))),
                        preferBelow:false,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                                width:14,
                                height:14,
                                color: CommonColor.fontGrey,
                                child: Icon(Icons.question_mark_rounded, size: 11, color: CommonColor.white,)
                            )
                        ),
                      )
                    ],
                  ),
                  //인증서 자동연결 안내
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" · 클라우드 인증서 자동연결 안내 ",
                        style: TextStyle(
                          color: CommonColor.fontGrey,
                          fontSize: 13,
                        ),
                      ),
                      Tooltip(
                        richMessage: WidgetSpan(
                            child: Container(
                                constraints: BoxConstraints(maxWidth: 400),
                                child: RichText(
                                  text: TextSpan(
                                      text: "클라우드 인증서 자동연결 안내\n\n",
                                      style: TextStyle(color: CommonColor.white, fontSize: 17, fontWeight: FontWeight.w600),
                                      children: [
                                        TextSpan(
                                            text: "iPad 및 Mac에서 자동연결이 계속 해제된다면?\n",
                                            style: TextStyle(color: CommonColor.white, fontSize: 15)
                                        ),
                                        TextSpan(
                                            text: "Safari 설정>크로스 사이트 추적방지 옵션을 해제 후 이용부탁드립니다.\n\n",
                                            style: TextStyle(color: CommonColor.fontGrey, fontSize: 14)
                                        ),
                                        TextSpan(
                                            text: "자동연경을 끊고 다른 인증서로 로그인 하고 싶다면?\n",
                                            style: TextStyle(color: CommonColor.white, fontSize: 15)
                                        ),
                                        TextSpan(
                                            text: "클라우드 공동인증서비스 팝업 좌측 상단 三을 눌러 '연결끊기(사용자 전환)'을 해주시면 됩니다",
                                            style: TextStyle(color: CommonColor.fontGrey, fontSize: 14)
                                        ),
                                      ]
                                  ),
                                )
                            )
                        ),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(8))),
                        preferBelow:false,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                                width:14,
                                height:14,
                                color: CommonColor.fontGrey,
                                child: Icon(Icons.question_mark_rounded, size: 11, color: CommonColor.white,)
                            )
                        ),
                      )
                    ],
                  ),
                  //가입버튼
                  Row(
                    children: [
                      Text(" · ", style: TextStyle(color: CommonColor.fontGrey),),
                      SizedBox(
                        height: 15,
                        child: TextButton(
                            onPressed: (){},
                            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent), padding: MaterialStateProperty.all(EdgeInsets.zero), alignment: Alignment.centerLeft),
                            child: Text(
                              "잠깐, KB증권이 처음이라면?",
                              style: TextStyle(color:CommonColor.white, fontWeight: FontWeight.w500, fontSize: 13, decoration: TextDecoration.underline),
                            )
                        )
                      )
                    ]
                  )

                ],
            )
          )
        ],
      )
    );
  }

  ///QR 인증 로그인 위젯 반환
  Widget QRLogin(){
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            //QR 이미지 영역
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:CommonColor.white
                ),
                padding: EdgeInsets.all(10),
                child: SizedBox(
                    width:qrSize,
                    height: qrSize,
                    child: Obx(()=> Image.asset(imgQRSrc.value))
                )
            ),
            SizedBox(height: 3), //공백
            //시간 표시 및 연장버튼
            SizedBox(
              width:qrSize+20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time_rounded, color: CommonColor.fontGrey, size: 20,),
                      Text(" 02:59", style: TextStyle(color: CommonColor.fontGrey, fontSize: 13)),
                    ]
                  ),
                  //시간연장 버튼
                  TextButton(
                      onPressed: (){},
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                          padding: MaterialStateProperty.all(EdgeInsets.all(0))),
                      child: TextButton(
                        onPressed: (){
                          if(imgQR){
                            imgQRSrc.value = "assets/images/qr_login2.png";
                            imgQR = false;
                          }
                          else{
                            imgQRSrc.value = "assets/images/qr_login1.png";
                            imgQR = true;
                          }
                          print(imgQRSrc);

                        },
                        style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
                        child: Text("시간연장", style: TextStyle(color:CommonColor.fontGrey, decoration:TextDecoration.underline)),
                      )

                  )
                ],
              )
            ),
            SizedBox(height: 10), //공백
            //인증 방법 설명
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:"M-able 미니 또는 M-able 앱에서 QR코드를 스캔하세요!\n",
                  style: TextStyle(color: CommonColor.white, fontWeight: FontWeight.w600, fontSize: 16),
                  children: [
                    WidgetSpan(child: SizedBox(height: 20)),
                    TextSpan(
                      text:"\n앱 인증 완료 후에도 로그인이 안 된다면 ",
                      style: TextStyle(color: CommonColor.white, fontWeight: FontWeight.w400, fontSize: 14)
                    ),
                    WidgetSpan(child:
                        SizedBox(
                          width:30,
                          height: 17,
                          child:TextButton(
                              onPressed: (){},
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                                padding: MaterialStateProperty.all(EdgeInsets.zero),
                              ),
                              child:Text("여기", style: TextStyle(color:CommonColor.btnYellow),)
                          )
                        )

                    ),
                    TextSpan(
                        text:"를 눌러보세요",
                        style: TextStyle(color: CommonColor.white, fontWeight: FontWeight.w400, fontSize: 14)
                    ),
                  ]
                )
            ),
            SizedBox(height: 15), //공백
            //설명 보더 박스
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: CommonColor.lineGrey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    //QR 인증 로그인 방법
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" QR 인증 로그인 방법 ",
                          style: TextStyle(
                            color: CommonColor.fontGrey,
                            fontSize: 14,
                          ),
                        ),
                        Tooltip(
                          richMessage: WidgetSpan(
                              child: Container(
                                  constraints: BoxConstraints(maxWidth: 400),
                                  child: RichText(
                                    text: TextSpan(
                                        text: "QR 인증 로그인 방법\n\n",
                                        style: TextStyle(color: CommonColor.white, fontSize: 17, fontWeight: FontWeight.w700),
                                        children: [
                                          TextSpan(
                                              text: "1. 간편인증 수단이 등록되어 있는 앱으로 QR코드 스캐너를 실행해 주세요.\n",
                                              style: TextStyle(color: CommonColor.fontGrey, fontSize: 13,fontWeight: FontWeight.w500),
                                              children: [
                                                TextSpan(
                                                    text: "2. QR코드를 스캔해 주세요.\n",
                                                ),
                                                TextSpan(
                                                  text: "3. QR코드 스캔 후 제공하는 간편인증을 진행해주세요.\n",
                                                ),
                                                TextSpan(
                                                  text: "4. QR인증 완료 시 자동 로그인 됩니다. 자동 로그인이 안될 경우 [확인]버튼을 눌러주세요.\n",
                                                ),
                                                TextSpan(
                                                  text: "QR 인증 로그인은 아이패드 OS 14.0 이상, Mac Safari 14.1 이상에서 사용 가능합니다.\n",
                                                ),
                                              ]
                                          )
                                        ]
                                    ),
                                  )
                              )
                          ),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(8))),
                          preferBelow:false,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Container(
                                  width:14,
                                  height:14,
                                  color: CommonColor.fontGrey,
                                  child: Icon(Icons.question_mark_rounded, size: 11, color: CommonColor.white,)
                              )
                          ),
                        )
                      ],
                    ),
                    //M-able 미니
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" · M-able 미니: 더보기 > QR인증",
                          style: TextStyle(
                            color: CommonColor.fontGrey,
                            fontSize: 13,
                          ),
                        ),
                        Tooltip(
                          richMessage: WidgetSpan(
                              child:
                              Container(
                                  constraints: BoxConstraints(maxWidth: 400),
                                  child: RichText(
                                    text: TextSpan(
                                        text: "M-able 미니 QR인증\n\n",
                                        style: TextStyle(color: CommonColor.white, fontSize: 17, fontWeight: FontWeight.w700),
                                        children: [
                                          WidgetSpan(
                                            child: SizedBox(
                                            width:360,
                                                child: Image.asset("assets/images/img_login_qr_info1.png")
                                            )
                                          )
                                        ]
                                    ),
                                  )
                              )
                          ),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(8))),
                          preferBelow:false,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Container(
                                  width:14,
                                  height:14,
                                  color: CommonColor.fontGrey,
                                  child: Icon(Icons.question_mark_rounded, size: 11, color: CommonColor.white,)
                              )
                          ),
                        )
                      ],
                    ),
                    //M-able
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" · M-able: 메뉴 > 인증/OTP > QR인증 ",
                          style: TextStyle(
                            color: CommonColor.fontGrey,
                            fontSize: 13,
                          ),
                        ),
                        Tooltip(
                          richMessage: WidgetSpan(
                              child:
                              Container(
                                  constraints: BoxConstraints(maxWidth: 400),
                                  child: RichText(
                                    text: TextSpan(
                                        text: "M-able QR인증\n\n",
                                        style: TextStyle(color: CommonColor.white, fontSize: 17, fontWeight: FontWeight.w700),
                                        children: [
                                          WidgetSpan(
                                              child: SizedBox(
                                                  width:360,
                                                  child: Image.asset("assets/images/img_login_qr_info2.png")
                                              )
                                          )
                                        ]
                                    ),
                                  )
                              )
                          ),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(8))),
                          preferBelow:false,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Container(
                                  width:14,
                                  height:14,
                                  color: CommonColor.fontGrey,
                                  child: Icon(Icons.question_mark_rounded, size: 11, color: CommonColor.white,)
                              )
                          ),
                        )
                      ],
                    ),
                    //가입버튼
                    Row(
                        children: [
                          Text(" · ", style: TextStyle(color: CommonColor.fontGrey),),
                          SizedBox(
                              height: 15,
                              child: TextButton(
                                  onPressed: (){},
                                  style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent), padding: MaterialStateProperty.all(EdgeInsets.zero), alignment: Alignment.centerLeft),
                                  child: Text(
                                    "잠깐, KB증권이 처음이라면?",
                                    style: TextStyle(color:CommonColor.white, fontWeight: FontWeight.w500, fontSize: 13, decoration: TextDecoration.underline),
                                  )
                              )
                          )
                        ]
                    )

                  ],
                )
            )

          ],
        )
    );
  }
}