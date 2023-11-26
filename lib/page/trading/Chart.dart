import 'package:flutter/material.dart';

import '../../constants/CommonColor.dart';

class Chart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return Container(
  decoration: BoxDecoration(
    border: Border.all(color: CommonColor.black, width: 4),
  ),
  child:
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child : Text('차트'),
                ),
                Image.asset("assets/images/chart_fake.png")
              ],
            ),
          ),

      );
  }

}