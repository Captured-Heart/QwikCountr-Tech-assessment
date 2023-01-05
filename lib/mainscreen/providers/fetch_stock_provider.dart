import '../../app.dart';

final fetchStocksProvider = StreamProvider.autoDispose
    .family<List<StocksPriceModel>, WidgetRef>((ref, refo) async* {
  FetchStockRepository fetchStockRepository = FetchStockRepository();
  final result = await fetchStockRepository.getStockRequests(refo);
  yield result;
});
