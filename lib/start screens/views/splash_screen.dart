import 'package:qwikcountr_tech_assessment/utils/image_constants.dart';

import '../../app.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash_screen';
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  bool isFirstScreen = false;

  @override
  void initState() {
    // checkFirstScreen();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2000),
        upperBound: 25);
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });

    Future.delayed(
      const Duration(seconds: 1),
      () {
        final isSeen = SharedPreferencesHelper.getOnBoardingSeen();

        isSeen == false
            ? pushReplaceNamed(
                context,
                OnboardScreen.routeName,
              )
            : pushReplaceNamed(context, LoginScreen.routeName);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          height: size.height,
          width: double.infinity,
          child: Center(
            child: Image.asset(
              demoLogo,
              width: size.width * 0.8,
              // height: controller.value * 27,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
