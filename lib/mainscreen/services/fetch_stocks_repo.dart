import 'dart:developer';

import '../../app.dart';

class FetchStockRepository {
  Future<List<StocksPriceModel>> getStockRequests(WidgetRef ref) async {
    var response =
        await HttpRequestHelper.getStocks(ref.watch(symbolsForStocksProvider));
       
    var stockList = (response['data'] as List)
        .map((e) => StocksPriceModel.fromJson(e))
        .toList();
   
    log('this is stockList: ${stockList.sublist(0, 10)}');
    log('this is stockList: ${stockList.sublist(0, 10).length}');

    // log('this is shuffleSymbol: $shuffledSymbolsElement');
    return stockList;
  }
}
