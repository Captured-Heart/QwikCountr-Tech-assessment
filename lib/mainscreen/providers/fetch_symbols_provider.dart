import 'package:qwikcountr_tech_assessment/mainscreen/services/fetch_symbols.dart';

import '../../app.dart';

final fetchSymbolsProvider =
    StreamProvider.autoDispose((ref) async* {
  FetchSymbolsRepository fetchSymbolsRepository = FetchSymbolsRepository();
  final result = await fetchSymbolsRepository.getSymbolsRequest();
  yield result;
});
