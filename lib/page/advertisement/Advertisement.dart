import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Advertisement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String imagePath1 = "assets/images/banner_1.png";
    String imagePath2 = "assets/images/banner_2.png";



    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        if (screenWidth >= 1400) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: (screenWidth/2) -50 ,
                child : getImageWidget(imagePath1),
              ),
              Padding (
                padding: EdgeInsets.only(right: 80),
                child :  Container(
                  width: (screenWidth/2) -50  ,
                  child : getImageWidget(imagePath2),

                ),
              )

            ],
          );
        } else {
          // 화면이 1257 미만일 때
          return Column(
            children: [
              getImageWidget(imagePath1),
              SizedBox(height: 30),
              getImageWidget(imagePath2),
            ],
          );
        }
      },
    );
  }

  Widget  getImageWidget(String imagePath){

    return
      ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(
            imagePath,
            height: 128,
            fit: BoxFit.fill,
          ),

    );
  }




}
