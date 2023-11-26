
import 'package:flutter/material.dart';
import 'package:sm_mdi/constants/CommonColor.dart';

class ErrorPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error_outline_rounded, size:100, color:CommonColor.fontLightGrey),
        SizedBox(height: 30),
        Text("잘못된 접근입니다", style:TextStyle(color:CommonColor.fontLightGrey, fontSize: 40, fontWeight: FontWeight.w600))
      ],
    );
  }

}