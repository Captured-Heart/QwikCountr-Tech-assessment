import 'dart:developer';

import '../../app.dart';

final symbolsForStocksProvider = StateProvider<String>((ref) {
  return '';
});
// final symbolsForStocksIndexProvider = StateProvider<int>((ref) {
//   return 0;
// });

class MainScreen extends ConsumerStatefulWidget {
  static const String routeName = 'mainScreen';
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final symbols = ref.watch(fetchSymbolsProvider);
    final stocks = ref.watch(fetchStocksProvider(ref));
    final isGrid = ref.watch(isGridViewProvider);
    final symbolsLength = symbols.value?.length ?? 3;

    // UTILIZING THE RIVERPOD PACKAGE, I COULD LISTEN TO MY INTERNET STREAMS IN THE BUILD METHOD, TO DETECT ANY CHANGES WITH THE NETWORK
    ref.listen(checkInternetStatusProvider, (previous, next) {
      next.value!.listen((event) {
        switch (event) {
          case InternetConnectionStatus.connected:
            topSnack(
                context: context,
                message: internetHealthy,
                isError: false);
            log('Data connection is available.');
            break;
          case InternetConnectionStatus.disconnected:
            topSnack(
                context: context,
                message: internetUnhealthy,
                isError: true);

            log(internetUnhealthy);
            break;
        }
      });
    });
    return SafeArea(
      child: DefaultTabController(
        length: symbolsLength,
        child: Scaffold(
          //Appbar begins here
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Text(SharedPreferencesHelper.getPrefName(),
                style: GoogleFonts.carroisGothicSc()),
            actions: [
              searchBTN(size, context),

              // LOG OUT BUTTON
              GestureDetector(
                onTap: () async {
                  //A DIALOG TO WARN USER FROM SIGNING OUT
                  warningDialog(
                    context: context,
                    contentText: aboutToLogOutText,
                    titleText: warning,
                    onNegativeClick: () => Navigator.of(context).pop(),
                    onPositiveClick: () {
                      //HERE, I BASICALLY ERASE THE STORED VALUE FOR THE USER, SO ON SUBSQUENT LOGIN, HE WILL BE DIRECTED TO THE AUTH PAGE
                      SharedPreferencesHelper.clearPrefs();
                      pushReplacement(context, LoginScreen());
                    },
                  );
                },
                child: roundedMainBTN(
                  message: logout,
                  icon: Icons.power_settings_new,
                ),
              ),
              const SizedBox(
                width: 6,
              )
            ]
                .expand((element) => [
                      element,
                      const SizedBox(
                        width: 15,
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
                    log(value.toString());
                  },

                  // THE TABS REP THE LIST FETCHED FROM EXCHANGES/COMPANIES FROM THE MARKETSTACK API
                  tabs: List.generate(
                    symbolsLength,
                    (index) => InkWell(
                      radius: 150,
                      onTap: () async {
                        log(symbols.value![index].symbol!);
                        ref
                            .read(symbolsForStocksProvider.notifier)
                            .update((state) => symbols.value![index].symbol!);
                            
                        ref.invalidate(fetchStocksProvider(ref));
                      },
                      child: Tab(
                          text: symbols.value?[index].symbol ?? 'Loading...'),
                    ),
                    growable: true,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                       stockMarket,
                        textScaleFactor: 1.4,
                      ),
                      const Spacer(),
                      //DATE PICKER
                      GestureDetector(
                          onTap: () {
                            datePicker(
                                context: context, setState: setState, ref: ref);
                          },
                          child: roundedMainBTN(
                            message:pickDate,
                            icon: Icons.calendar_month,
                          )),

                      // GRIDVIEW / LISTVIEW SELECTOR
                      GestureDetector(
                        onTap: () {
                          ref
                              .read(isGridViewProvider.notifier)
                              .update((state) => !state);
                          log(ref.watch(isGridViewProvider).toString());
                        },
                        child: isGrid == true
                            ? roundedMainBTN(
                                message: gridView,
                                icon: Icons.grid_view,
                              )
                            : roundedMainBTN(
                                message: listView,
                                icon: Icons.list,
                              ),
                      ),
                    ]
                        .expand((element) => [
                              element,
                              const SizedBox(
                                width: 20,
                              )
                            ])
                        .toList(),
                  ),
                ),

                // STOCKS ARE DISPLAYED HERE
                stocksListGridWIdget(stocks, isGrid, size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
