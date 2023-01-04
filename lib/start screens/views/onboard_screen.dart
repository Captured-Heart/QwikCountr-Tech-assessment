import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qwikcountr_tech_assessment/utils/image_constants.dart';

import '../../app.dart';

final currentPageProvider = StateProvider<int>((ref) {
  return 0;
});
final pageControllerProvider = Provider<PageController>((ref) {
  return PageController(initialPage: 0);
});

class OnboardScreen extends ConsumerWidget {
  static const String routeName = 'onBoard_screen';

  const OnboardScreen({super.key});

  void toLoginPage(context) async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    SharedPreferencesHelper.setOnBoardingSeen();
    pushReplaceNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final pageController = ref.watch(pageControllerProvider);
    final currentPage = ref.watch(currentPageProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // backgroundColor: Color.fromARGB(255, 56, 53, 53),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            // fit: StackFit.expand,
            children: [
              PageView(
                physics: const ClampingScrollPhysics(),
                controller: pageController,
                onPageChanged: (int page) {
                  ref
                      .read(currentPageProvider.notifier)
                      .update((state) => page);
                  // setState(() {
                  //   _currentPage = page;
                  // });
                },
                children: [
                  OnBoardingPages(
                    size: size,
                    imgUrl: demoLogo,
                    title: 'LocaleKeys.onBoardTitle1.tr()',
                    scaffoldBackgroundColor: BrandColors.colorPrimaryLight,
                    subtitle: 'LocaleKeys.onBoardSubTitle1.tr()',
                  ),
                  OnBoardingPages(
                    size: size,
                    imgUrl: demoLogo,
                    title: ' LocaleKeys.onBoardTitle2.tr()',
                    scaffoldBackgroundColor: BrandColors.colorPrimaryLight,
                    subtitle: 'LocaleKeys.onBoardSubTitle2.tr()',
                  ),
                  OnBoardingPages(
                    size: size,
                    imgUrl: demoLogo,
                    title: 'LocaleKeys.onBoardTitle3.tr()',
                    scaffoldBackgroundColor: BrandColors.colorPrimaryLight,
                    widget: const SizedBox.shrink(),
                    subtitle: 'LocaleKeys.onBoardSubTitle3.tr()',
                  ),
                ],
              ),
              Positioned(
                bottom: size.height * 0.1,
                child: buildIndicator(
                  size,
                  context: context,
                  currentPage: currentPage,
                  pageController: pageController,
                  onDotClicked: (int page) {
                    ref.read(pageControllerProvider).jumpToPage(page);
                  },
                ),
              ),
              currentPage == 2
                  ? const SizedBox.shrink()
                  : Positioned(
                      bottom: size.height * 0.03,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                toLoginPage(context);
                              },
                              child: Text(
                                'Skip',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                      color: BrandColors.colorPrimaryLight,
                                      fontSize: 20,
                                      fontWeight: AppFontWeight.medium,
                                    ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(pageControllerProvider)
                                    .jumpToPage(currentPage + 1);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                foregroundColor: BrandColors.colorPrimaryLight,
                              ),
                              child: const Text(
                                'Next',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              currentPage == 2
                  ? Positioned(
                      bottom: size.height * 0.035,
                      left: size.width * 0.1,
                      right: size.width * 0.1,
                      child: TextButton(
                        onPressed: () {
                          toLoginPage(context);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              BrandColors.colorPrimaryLight,
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: size.width * 0.20,
                              ),
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: const Text(
                          'Get Started',
                          textScaleFactor: 1.1,
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
