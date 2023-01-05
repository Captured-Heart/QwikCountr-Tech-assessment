import 'package:qwikcountr_tech_assessment/Themes/themedata.dart';
import 'package:qwikcountr_tech_assessment/strings_const.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesHelper.initSharedPref();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
  //     overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = SharedPreferencesHelper.getPrefName.call();
    return MaterialApp(
      title: projectTitle,
      onGenerateTitle: (context) => projectTitle,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: userName.isEmpty ? LoginScreen() : const MainScreen(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case LoginScreen.routeName:
                return LoginScreen();

              case MainScreen.routeName:
              default:
                return const MainScreen();
            }
          },
        );
      },
    );
  }
}
