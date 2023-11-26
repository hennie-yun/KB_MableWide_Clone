
class ThemedStock{

  ///테마 이름
  String subject;

  ///테마 등락률
  double fluctuation_rate;

  ///테마 종목들
  List<ThemedStockItem> stocks;

  ThemedStock({
    this.subject = '',
    this.fluctuation_rate = 0.0,
    List<ThemedStockItem>? stocks
  }) : stocks = stocks ?? [];

}

class ThemedStockItem{

  ///종목 코드
  String jmCode;

  ///종목 이름
  String name;

  ///현재가
  double currentprice;

  ///등락률
  double fluctuation_rate;
  ///전일대비 가격

  double fluctuating_price;

  ///상승여부
  bool isUp;


  ThemedStockItem({
    this.jmCode = "-1",
    this.name = "Nan",
    this.currentprice = -1,
    this.fluctuation_rate = 0.0,
    this.fluctuating_price = 0.0,
    this.isUp = false
  });

}