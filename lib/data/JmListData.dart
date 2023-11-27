class JmListData {
  //큰 타이틀 이름
  String subject;
  // 타이틀의 종목들
  List<JmStockItem> stocks;

  JmListData({
    this.subject ='',
    List<JmStockItem>? stocks
  }) : stocks = stocks ?? [];
}

class JmStockItem {

  //종목 이미지 경로
  String jmImg;

  //종목 이름
  String jmName;

  //현재가
  int currentPrice;

  //전일가
  int beforePrice;

  //등락가
  double variation;

  //등락률
  double variationRate;

  //상승인지?
  bool isUp;

  JmStockItem({
    this.jmImg = "Nan",
    this.jmName = "Nan",
    this.currentPrice = -1,
    this.beforePrice = -1,
    this.variation = 0.0,
    this.variationRate = 0.0,
    this.isUp = false,
  });
  }
