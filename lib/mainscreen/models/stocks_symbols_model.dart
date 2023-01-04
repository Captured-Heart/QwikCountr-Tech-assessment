class StocksSymbolsModel {
  String? name;
  String? acronym;
  String? mic;
  String? country;

  StocksSymbolsModel({this.name, this.acronym, this.mic, this.country});

  factory StocksSymbolsModel.fromJson(Map<String, dynamic> json) {
    return StocksSymbolsModel(
      name: json['name'] as String?,
      acronym: json['acronym'] as String?,
      mic: json['mic'] as String?,
      country: json['country'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'acronym': acronym,
        'mic': mic,
        'country': country,
      };
}
