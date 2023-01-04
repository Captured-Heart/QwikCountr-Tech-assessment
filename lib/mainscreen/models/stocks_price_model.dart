class StocksPriceModel {
  String? open;
  String? high;
  String? low;
  String? close;
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
  });

  factory StocksPriceModel.fromJson(Map<String, dynamic> json) {
    return StocksPriceModel(
      open: json['open'] as String?,
      high: json['high'] as String?,
      low: json['low'] as String?,
      close: json['close'] as String?,
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
