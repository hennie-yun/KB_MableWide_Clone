import 'package:flutter/material.dart';

import '../../constants/CommonColor.dart';
import '../../data/ThemedStock.dart';
import 'ThemedStockPageController.dart';

class ThemedStockPage extends StatelessWidget{

  ThemedStockPage(){
    controller = ThemedStockPageController();
    maxIndex = controller.themedStockList.length;
    // _scrollController.addListener(() {
    //   scrollListener();
    // });
  }

  late ThemedStockPageController controller;
  final ScrollController _scrollController = ScrollController();

  // RxList<Row> addedRow = [Row(children: [Column()],)].obs ;

  //무한스크롤을 위한 인덱스 값
  int currentIndex = 0;
  //표시할 데이터의 개수를 저장
  int maxIndex = 0;


  @override
  Widget build(BuildContext context) {
    //파일을 읽은 후 setBuild가 실행되도록 함
    return FutureBuilder(
      future: controller.init(),
      builder: (context, snapshot){
        return setBuild();
      }
    );
  }


  Widget setBuild(){
    return SingleChildScrollView (
      controller: _scrollController,
      padding: EdgeInsets.only(top:50),
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 10),
        width:1200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //제목
            Text(
              "요즘 돈이 몰리는 국내 테마",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: CommonColor.white),
            ),
            SizedBox(height:100), //여백
            getStockBoxRow(),
            getStockBoxRow(),
            getStockBoxRow(),
            getStockBoxRow(),
            getStockBoxRow(),
            getStockBoxRow(),
            getStockBoxRow(),

          ],
        )

      )
    );
  }


  Widget themedStockBox(ThemedStock stock){

    final isUpCount = stock.stocks.where((e) => e.isUp == true).toList().length;
    final isDownCount = stock.stocks.length - isUpCount;

    //String subject, List<dynamic> stockList
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 15, 15),
      padding: EdgeInsets.all(20),
     // height: 200,
      // constraints: BoxConstraints(
      //   minHeight: 200
      // ),
      decoration: BoxDecoration(
        color: CommonColor.bannerGrey_DK,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          //상세보기 버튼 - 테마 및 등락률 표시,
          TextButton(
              onPressed: (){},
              style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(text: TextSpan(text: "${stock.subject}\n",
                    style: TextStyle(color: CommonColor.white, fontSize: 20, fontWeight: FontWeight.w500),
                    children: [
                        TextSpan(text:"${stock.fluctuation_rate}%", style: TextStyle(color: stock.fluctuation_rate > 0 ? CommonColor.fontUp: CommonColor.fontDown, fontSize: 20, fontWeight: FontWeight.w700))
                    ]),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, color: CommonColor.white)
                ],
              )
          ),

          //상승, 하락, 전체 표시
          Padding(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "",
                          style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700 ),
                          children: [
                            WidgetSpan(child: Icon(Icons.arrow_drop_up_rounded, color:CommonColor.fontUp), alignment: PlaceholderAlignment.middle),
                            TextSpan(text:"상승 ${isUpCount}개", style: TextStyle(color: CommonColor.fontUp)),
                            WidgetSpan(child: Icon(Icons.arrow_drop_down_rounded, color:CommonColor.fontDown), alignment: PlaceholderAlignment.middle),
                            TextSpan(text:"하락 ${isDownCount}개", style: TextStyle(color: CommonColor.fontDown)),
                          ]
                      )
                  ),
                  Text("${stock.stocks.length}개", style: TextStyle(color: CommonColor.fontGrey, fontSize: 13))
                ]
            )
          ),
          
          //종목 표시
          ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children:
              stock.stocks.asMap().entries.map((element) {
                return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${element.key+1}. ${element.value.name}"),
                        Text("${element.value.fluctuation_rate}%", style:TextStyle(color:element.value.isUp ? CommonColor.fontUp:CommonColor.fontDown, fontSize: 15)),
                      ]
                    ),
                    textColor: CommonColor.white);
              }).toList()
          ),
        ],
      )
    );
  }

  ///Row에 테마주 최대 3개를 넣어 반환하는 함수
  Row getStockBoxRow(){

    maxIndex = controller.themedStockList.length;
print("max:${maxIndex}");
    //마지막 Row는 3개가 아닐 수 있으므로 불러올 데이터의 최대치를 저장
    int index1 = currentIndex+3 < maxIndex ? currentIndex+3:maxIndex;
    //현재인덱스 부터 +2, 총 3개의 데이터를 저장
    var stockList = controller.themedStockList.sublist(currentIndex, index1);

    print("offset${index1}");
    print("current${currentIndex}");
    print(currentIndex != index1);

    //변경된 현재 인덱스를 저장
    currentIndex = index1;

//   currentIndex = offSet;
    return Row(
      children: stockList.map((value) =>
          Expanded(flex:15, child: themedStockBox(value)),
      ).toList()
    );
  }


  //스크롤 감지 이벤트 발생을 감지하는 리스너
  scrollListener() async {
    // print('offset = ${_scrollController.offset}');

    if (_scrollController.offset == _scrollController.position.maxScrollExtent
        && !_scrollController.position.outOfRange) {
      //addedRow.add(getStockBoxRow());
      print('스크롤이 맨 바닥에 위치해 있습니다');
    } else if (_scrollController.offset == _scrollController.position.minScrollExtent
        && !_scrollController.position.outOfRange) {
      print('스크롤이 맨 위에 위치해 있습니다');
    }
  }
}
