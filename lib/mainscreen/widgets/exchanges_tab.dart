import 'dart:developer';

import '../../app.dart';

Widget exchangesTab(
    BuildContext context,
    AsyncValue<List<StocksSymbolsModel>> symbols,
    int symbolsLength,
    WidgetRef ref) {
  return TabBar(
    isScrollable: true,
    labelColor: Theme.of(context).primaryColorLight,
    indicator: BoxDecoration(
      color: Colors.transparent,
      border: Border.all(
        color: Theme.of(context).primaryColorLight,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    splashFactory: NoSplash.splashFactory,
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (states) =>
          states.contains(MaterialState.selected) ? null : Colors.transparent,
    ),
    onTap: (value) {
      log(value.toString());
      ref
          .read(symbolsForStocksProvider.notifier)
          .update((state) => symbols.value![value].symbol!);
      ref.invalidate(fetchStocksProvider(ref));
    },

    // THE TABS REP THE LIST FETCHED FROM EXCHANGES/COMPANIES FROM THE MARKETSTACK API
    tabs: List.generate(
      symbolsLength,
      (index) => Tab(
        text: symbols.value?[index].symbol ?? 'Loading...',
      ),
      growable: true,
    ),
  );
}
