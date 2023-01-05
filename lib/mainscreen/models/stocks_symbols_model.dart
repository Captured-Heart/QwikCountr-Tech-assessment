class StocksSymbolsModel {
  String? name;
  String? symbol;
  String? mic;
  String? country;
  String? stockExchangeName;

  StocksSymbolsModel(
      {this.name, this.symbol, this.mic, this.country, this.stockExchangeName});

  factory StocksSymbolsModel.fromJson(Map<String, dynamic> json) {
    return StocksSymbolsModel(
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      mic: json['stock_exchange']['mic'] as String?,
      country: json['stock_exchange']['country'] as String?,
      stockExchangeName: json['stock_exchange']['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'symbol': symbol,
        'mic': mic,
        'country': country,
        'stock_exchange':stockExchangeName,
      };
}
