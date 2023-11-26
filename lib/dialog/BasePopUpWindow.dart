
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_mdi/constants/CommonColor.dart';


//팝업창을 띄우는 전역함수
void popWindow(BuildContext context, String title, Widget content) async{
  return Get.dialog(
      AlertDialog(
        titlePadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
        backgroundColor: CommonColor.bgDarkMode,
        title: SizedBox(
            width:560,
            height:50,
          child: Stack(
              children: [
                //제목
                Positioned(top:15,left:0, right:0, child: Text(title, textAlign: TextAlign.center, style: TextStyle(color: CommonColor.white, fontWeight: FontWeight.w600),)),
                //닫기 버튼
                Positioned(
                    width: 45,
                    height: 45,
                    right:0,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); //창 닫기
                      },
                      child: Icon(Icons.close, color: CommonColor.white),
                    )
                )
              ]
          )
        ),
        //화면에 표시될 영역
        content: content,
      ),
      barrierDismissible:false,
      //CustomAlert(title: title, content: content)
  );
}


class CustomAlert extends StatelessWidget{

  late String title ="";
  late Widget content;

  CustomAlert({required String title, required Widget content}){
    this.title = title;
    this.content = content;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: CommonColor.bgDarkMode,
      //border설정
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: CommonColor.dialogborderGrey, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                  width:560,
                  height:50,
                child: Stack(
                    children: [
                      //제목
                      Positioned(top:15,left:0, right:0, child: Text(title, textAlign: TextAlign.center, style: TextStyle(color: CommonColor.white, fontWeight: FontWeight.w600, fontSize: 20),)),
                      //닫기 버튼
                      Positioned(
                          width: 45,
                          height: 45,
                          right:0,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); //창 닫기
                            },
                            child: Icon(Icons.close, color: CommonColor.white),
                          )
                      )
                    ]
                )
            ),

            //여백
            SizedBox(height: 10.0),

            Container(
              color: Colors.red,
              child: content
            )

          ],
        ),
      ),
    );
  }

}

