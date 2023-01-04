// import 'package:dropdown_search/dropdown_search.dart';

import 'dart:async';
import 'dart:developer';

import 'package:qwikcountr_tech_assessment/mainscreen/providers/fetch_symbols_provider.dart';
import 'package:qwikcountr_tech_assessment/mainscreen/services/http_get_request.dart';
import 'package:qwikcountr_tech_assessment/utils/connectivity.dart';
import 'package:qwikcountr_tech_assessment/utils/snack_bar.dart';

import '../../app.dart';
import '../services/fetch_symbols.dart';

final activeTabIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class MainScreen extends ConsumerStatefulWidget {
  static const String routeName = 'mainScreen';
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen> {
  @override
  initState() {
    // HttpRequestHelper.getSymbols();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final symbols = ref.watch(fetchSymbolsProvider);
    final symbolsLength = symbols.valueOrNull?.length ?? 3;
    ref.listen(checkInternetStatusProvider, (previous, next) {
      next.value!.listen((event) {
        switch (event) {
          case InternetConnectionStatus.connected:
            topSnack(
                context: context,
                message: 'Internet network is healthy',
                isError: false);
            log('Data connection is available.');
            break;
          case InternetConnectionStatus.disconnected:
            topSnack(
                context: context,
                message: 'You are disconnected from the internet.',
                isError: true);

            log('You are disconnected from the internet.');
            break;
        }
      });
    });
    return SafeArea(
      child: DefaultTabController(
        length: symbolsLength,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Text(SharedPreferencesHelper.getPrefName(),
                style: GoogleFonts.carroisGothicSc()),
            actions: [
              SearchBarAnimation(
                textEditingController: TextEditingController(),
                isOriginalAnimation: true,
                searchBoxWidth: size.width * 0.7,
                isSearchBoxOnRightSide: true,
                textAlignToRight: false,
                buttonBorderColour: Theme.of(context).primaryColorLight,
                buttonColour: Theme.of(context).primaryColorLight,
                enableBoxShadow: false,
                enableButtonShadow: false,
                searchBoxBorderColour: Theme.of(context).primaryColorLight,
                searchBoxColour: Theme.of(context).primaryColorDark,
                cursorColour: Theme.of(context).primaryColorLight,
                buttonWidget: const Icon(Icons.search),
                trailingWidget: const Icon(Icons.search),
                secondaryButtonWidget: const Icon(Icons.dangerous),
                onFieldSubmitted: (String value) {
                  debugPrint('onFieldSubmitted value $value');
                },
              ),
              GestureDetector(
                onTap: () async {
                  // await FetchSymbolsRepository.getSymbolsRequest();
                },
                child: const CircleAvatar(
                  child: Icon(Icons.notifications),
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ]
                .expand((element) => [
                      element,
                      const SizedBox(
                        width: 10,
                      )
                    ])
                .toList(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TabBar(
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
                    (states) => states.contains(MaterialState.selected)
                        ? null
                        : Colors.transparent,
                  ),
                  onTap: (value) {
                    ref
                        .read(activeTabIndexProvider.notifier)
                        .update((state) => value);
                    log(value.toString());
                  },
                  tabs: List.generate(
                    symbolsLength,
                    (index) => GestureDetector(
                      onTap: () {
                        log(symbols.value![index].mic!);
                      },
                      child: Tab(
                        child: Text(symbols.value?[index].mic ?? 'Loading...'),
                      ),
                    ),
                  ),
                ),
                const Text('Market movers'),
                stocksListTileCard(size, context),
                stocksGridTileCard(size, context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
