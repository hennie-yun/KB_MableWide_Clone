import 'package:flutter/material.dart';
import 'package:sm_mdi/constants/CommonColor.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    required this.isSquare,
    required this.ratio,
    this.size = 8,
    this.textColor,
    this.width = 90,
  }) : super(key: key);
  final Color color;
  final String text;
  final double ratio;
  final bool isSquare;
  final double size;
  final double width;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size/3),
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
              color: color,
            ),
          ),
          SizedBox(
            width: size/2,
          ),
          //레이블
          Text(
            text,
            style: TextStyle(
              fontSize: size+4,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          ),
          //비율
          Expanded(
              child: Text(
                "  ${ratio}%",
                style: TextStyle(
                  fontSize: size+3,
                  fontWeight: FontWeight.w200,
                  color: CommonColor.fontGrey,
                ),
                textAlign: TextAlign.end,
              ),
          )

        ],
      ),
    )
     ;
  }
}