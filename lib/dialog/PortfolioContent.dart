import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_mdi/common/Indicator.dart';

import '../constants/CommonColor.dart';

class PortfolioContent extends StatelessWidget{

  var selectedIndex = 100.obs;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 520,
      child: Column(
        children: [
          SizedBox(
              width: 180,
              height: 180,
              child: Obx(()=>
                  PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {

                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            selectedIndex.value = -1;
                            return;
                          }
                          selectedIndex.value = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        },
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections(),
                    ),
                  ),
              )
          ),

          //차트와 레이블 사이 여백
          SizedBox(
            height: 20,
          ),

          //한국전력
          Indicator(
              color: CommonColor.chartColor_1,
              text: '한국전력',
              isSquare: true,
              size:15,
              textColor: CommonColor.white,
              ratio: 80.8,
              width:500
          ),

          //여백
          SizedBox(
            height: 10,
          ),

          //상상인
          Indicator(
              color: CommonColor.chartColor_3,
              text: '상상인',
              isSquare: true,
              size:15,
              textColor: CommonColor.white,
              ratio: 20.2,
              width:500
          )


        ],
      )
    );

  }


  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == selectedIndex.value;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: CommonColor.chartColor_3,
            value: 19.2,
            radius: radius,
            title:"",
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: CommonColor.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: CommonColor.chartColor_1,
            value: 80.8,
            radius: radius,
            title:"",
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: CommonColor.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }


}