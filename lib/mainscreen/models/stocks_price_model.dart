class StocksPriceModel {
  double? open;
  double? high;
  double? low;
  double? close;
  bool? hasEod;
  String? symbol;
  String? exchange;
  String? date;

  StocksPriceModel({
    this.open,
    this.high,
    this.low,
    this.close,
    this.symbol,
    this.exchange,
    this.date,
    this.hasEod,
  });

  factory StocksPriceModel.fromJson(Map<String, dynamic> json) {
    return StocksPriceModel(
      open: json['open'] as double?,
      high: json['high'] as double?,
      low: json['low'] as double?,
      close: json['close'] as double?,
      hasEod: json['has_eod'] as bool?,
      symbol: json['symbol'] as String?,
      exchange: json['exchange'] as String?,
      date: json['date'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'open': open,
        'high': high,
        'low': low,
        'close': close,
        'symbol': symbol,
        'exchange': exchange,
        'date': date,
      };
}
