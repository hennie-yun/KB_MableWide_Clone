import 'package:flutter/material.dart';
import 'package:sm_mdi/dialog/BasePopUpWindow.dart';

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
        //로딩중일때
        if (snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(
                color:CommonColor.btnYellow
            ),
          );
        }
        else{
          return setBuild(context);
        }
      }
    );
  }


  Widget setBuild(BuildContext context){
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
            getStockBoxRow(context),
            getStockBoxRow(context),
            getStockBoxRow(context),
            getStockBoxRow(context),
            getStockBoxRow(context),
            getStockBoxRow(context),
            getStockBoxRow(context),

          ],
        )

      )
    );
  }

  //테마주 박스를 반환하는 함수
  Widget themedStockBox(BuildContext context, ThemedStock stock){

    //관련 테마주 목록 중 승승한 종목 개수
    final isUpCount = stock.stocks.where((e) => e.isUp == true).toList().length;
    //관련 테마주 목록 중 하락한 종목 개수
    final isDownCount = stock.stocks.length - isUpCount;
    //상승/하락을 표현하기 위한 색상
    final textColor = stock.fluctuation_rate > 0 ? CommonColor.fontUp: stock.fluctuation_rate == 0 ? CommonColor.white:CommonColor.fontDown;

    //박스 속 테마주 리스트
    List<Widget> stockBoxList = [];
    //박스 속 테마주 리스트 (최대 5개만 표시)
    for(int i = 0; i < (stock.stocks.length < 5? stock.stocks.length:5); i++){
      stockBoxList.add(
          ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${i+1}. ${stock.stocks[i].name}"),
                    Text("${stock.stocks[i].fluctuation_rate}%", style:TextStyle(color:stock.stocks[i].isUp ? CommonColor.fontUp:CommonColor.fontDown, fontSize: 15)),
                  ]
              ),
              textColor: CommonColor.white
          )
      );
    }

    //String subject, List<dynamic> stockList
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 15, 15),
      padding: EdgeInsets.fromLTRB(15, 30, 12, 30),
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
              onPressed: (){
                popWindow(context, "테마", getPopUpContent(stock));
              },
              style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    overflow:TextOverflow.ellipsis,
                    text: TextSpan(text: "${stock.subject}\n",
                    style: TextStyle(color: CommonColor.white, fontSize: 20, fontWeight: FontWeight.w500, fontFamily: "Pretendard"),
                    children: [
                        TextSpan(text:"${stock.fluctuation_rate}%", style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w700, height: 1.3))
                    ]),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, color: CommonColor.white)
                ],
              )
          ),

          //상승, 하락, 전체 표시
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 5, 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "",
                          style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700, fontFamily: "Pretendard"),
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

          Divider(color: Colors.white, thickness: 0.2),

          //종목 표시
          ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: stockBoxList,
          ),
        ],
      )
    );
  }

  ///Row에 테마주 최대 3개를 넣어 반환하는 함수
  Row getStockBoxRow(BuildContext context){

    maxIndex = controller.themedStockList.length;

    //마지막 Row는 3개가 아닐 수 있으므로 불러올 데이터의 최대치를 저장
    int index1 = currentIndex+3 < maxIndex ? currentIndex+3:maxIndex;
    //현재인덱스 부터 +2, 총 3개의 데이터를 저장
    var stockList = controller.themedStockList.sublist(currentIndex, index1);


    //변경된 현재 인덱스를 저장
    currentIndex = index1;

//   currentIndex = offSet;
    return Row(
      children: stockList.map((value) =>
          Expanded(flex:15, child: themedStockBox(context, value)),
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


  ///팝업 윈도우 컨텐츠
  Widget getPopUpContent(ThemedStock stock){

    final isUpCount = stock.stocks.where((e) => e.isUp == true).toList().length;
    final isDownCount = stock.stocks.length - isUpCount;
    final textColor = stock.fluctuation_rate > 0 ? CommonColor.fontUp: stock.fluctuation_rate == 0 ? CommonColor.white:CommonColor.fontDown;

    return Container(
      height: 500,
      child: Column(
        children: [
          //테마 및 등락률
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(text: TextSpan(text: "${stock.subject}\n",
                  style: TextStyle(color: CommonColor.white, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: "Pretendard"),
                  children: [
                    TextSpan(text:"${stock.fluctuation_rate}%", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w700, height: 1.3))
                  ]),
              ),

              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "",
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700 , fontFamily: "Pretendard"),
                      children: [
                        WidgetSpan(child: Icon(Icons.arrow_drop_up_rounded, color:CommonColor.fontUp), alignment: PlaceholderAlignment.middle),
                        TextSpan(text:"상승 ${isUpCount}개", style: TextStyle(color: CommonColor.fontUp)),
                        WidgetSpan(child: Icon(Icons.arrow_drop_down_rounded, color:CommonColor.fontDown), alignment: PlaceholderAlignment.middle),
                        TextSpan(text:"하락 ${isDownCount}개", style: TextStyle(color: CommonColor.fontDown)),
                        WidgetSpan(child: Container(margin:EdgeInsets.symmetric(horizontal: 8), width:2, height: 13, color: CommonColor.fontGrey )),
                        TextSpan(text:"전체 ${stock.stocks.length}", style: TextStyle(color: CommonColor.fontGrey, fontSize: 13))
                      ]
                  )
              ),
            ],
          ),

          SizedBox(
            height: 20,
          ),

          //종목 표
          SizedBox(
            width: 550,
            height: 436,
            child: SingleChildScrollView(
              child: getDataTable(stock.stocks)
            )
          )


        ],
      )
    );
  }

  Widget getDataTable(List<ThemedStockItem> stockItem){
    return DataTable(

      headingRowHeight: 36.0,
      dataRowMinHeight: 25.0,
      dataRowMaxHeight: 44.0,
      columnSpacing: 25.0,
      border: TableBorder(
        top:BorderSide(
          width: 0.5,
          color: CommonColor.fontGrey,
        ),
        verticalInside: BorderSide(
          width: 0.5,
          color: CommonColor.fontGrey,
        ),
        horizontalInside: BorderSide(
          width: 0.5,
          color: CommonColor.fontGrey,
        ),
      ),

      columns: [
        DataColumn(
            label:Container(
                color: CommonColor.dataColumn,
                child: Text('종목명',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)
                )
            )
        ),
        DataColumn(
            label: Expanded(
              flex: 1,
              child: Text('현재가',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white)),
            )
        ),
        DataColumn(
            label: Expanded(
              flex: 1,
              child: Text('전일대비',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right, style: TextStyle(color: Colors.white)),
            )
        ),
        DataColumn(
            label: Expanded(
              flex: 1,
              child: Text('등락률',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right, style: TextStyle(color: Colors.white)),
            )
        ),
      ],

      rows: stockItem.map((item) {

        final textColor = item.isUp ? CommonColor.fontUp: item.fluctuation_rate==0 ? CommonColor.white : CommonColor.fontDown;

        return DataRow(
          cells: [
          //종목명
          DataCell(
            Container(
              padding: EdgeInsets.all(0),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(
                    width: 28,
                    height: 28,
                    child: Image.asset("assets/images/jm2.png" ),
                  ),
                  SizedBox(width: 10,),
                  Text(item.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Color(0xFFB2B4Bf))
                  )
                ],
              ),
            ),
            showEditIcon: false,
          ),
          //현재가
          DataCell(
            Align(

              alignment: Alignment.centerRight,
              child: Text("${item.currentprice}원",
                  style: TextStyle(color: Color(0xFFB2B4Bf))),
            ),
            showEditIcon: false,
          ),
          //전일대비 가격
          DataCell(
            Align(
              alignment: Alignment.centerRight,
              child: Text("${item.isUp ? "▲":"▼"}${item.fluctuating_price}원",
                  style: TextStyle(color: textColor)),
            ),
            showEditIcon: false,
          ),
          //등락률
          DataCell(
            Align(
              alignment: Alignment.centerRight,
              child: Text("${item.isUp ? "▲":"▼"}${item.fluctuation_rate}%",
                  style: TextStyle(color: textColor)),
            ),
            showEditIcon: false,
          ),
        ],
        );
      }).toList()

    );
  }

}
