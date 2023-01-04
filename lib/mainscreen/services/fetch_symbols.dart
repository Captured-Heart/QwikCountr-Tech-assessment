import 'dart:developer';

import 'package:qwikcountr_tech_assessment/mainscreen/models/stocks_symbols_model.dart';

import '../../app.dart';

class FetchSymbolsRepository {
   Future<List<StocksSymbolsModel>> getSymbolsRequest() async {
    var response = await HttpRequestHelper.getSymbols();
    var symbolsList = (response['data'] as List)
        .map((e) => StocksSymbolsModel.fromJson(e))
        .toList();
    // symbolsList.sort((b, a) {
    //   var date1 = DateTime.parse(a.date);
    //   var date2 = DateTime.parse(b.date!);
    //   return date2.compareTo(date1);
    // });
    log('this is symbolsList: ${symbolsList.sublist(0, 10)}');
    log('this is symbolsList: ${symbolsList.sublist(0, 10).length}');

    // var shuffledSymbolsElement = symbolsList[Random().nextInt(symbolsList.length)];
    symbolsList.shuffle();

    // log('this is shuffleSymbol: $shuffledSymbolsElement');
    return symbolsList.sublist(0, 10);
  }
}
