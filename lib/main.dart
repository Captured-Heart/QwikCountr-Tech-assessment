// import 'package:flutter/services.dart';
import 'dart:developer';

import 'app.dart';

void main() async {
  // log('${await InternetConnectionChecker().connectionStatus}');
  // InternetConnectionChecker().onStatusChange.listen((status) {
  //   switch (status) {
  //     case InternetConnectionStatus.connected:
  //       log('Data connection is available.');
  //       break;
  //     case InternetConnectionStatus.disconnected:

  //       log('You are disconnected from the internet.');
  //       break;
  //   }
  // });

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesHelper.initSharedPref();
// connectionStatus.initialize();
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
    return MaterialApp(
      title: 'QwuikCountr Demo',
      onGenerateTitle: (context) => 'QwuikCountr',
      theme: FlexThemeData.light(
        scheme: FlexScheme.outerSpace,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        keyColors: const FlexKeyColors(),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.outerSpace,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        keyColors: const FlexKeyColors(),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      home: LoginScreen(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case SplashScreen.routeName:
                return const SplashScreen();
              case OnboardScreen.routeName:
                return const OnboardScreen();

              case MainScreen.routeName:
              default:
                return MainScreen();
            }
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
