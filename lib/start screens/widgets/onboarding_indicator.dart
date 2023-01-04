import '../../app.dart';

Container buildIndicator(Size size,
    {BuildContext? context,
    int? currentPage,
    PageController? pageController,
    dynamic onDotClicked}) {
  return Container(
      height: size.height * 0.1,
      width: size.width,
      padding: currentPage != 3
          ? const EdgeInsets.symmetric(horizontal: 20)
          : EdgeInsets.zero,
      margin: currentPage != 3 ? EdgeInsets.zero : EdgeInsets.zero,
      alignment: Alignment.center,
      child:
          // currentPage != 3
          // ?
          Stack(
        children: [
          currentPage == 0
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      pageController!.jumpToPage(3);
                    },
                    child: const Text(
                      '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
              : Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      pageController!.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: const Text(
                      '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
          currentPage != 2
              ? Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      pageController!.nextPage(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.ease,
                      );
                    },
                    child: const Text(
                      '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
              : const Text(''),
          Align(
            alignment: Alignment.center,
            child: SmoothPageIndicator(
              controller: pageController!,
              count: 3,
              onDotClicked: onDotClicked,
              effect: const SlideEffect(
                spacing: 8.0,
                radius: 4.0,
                dotWidth: 15.0,
                dotHeight: 12.0,
                paintStyle: PaintingStyle.fill,
                strokeWidth: 1.5,
                dotColor: Color(0xff949EAD),
                activeDotColor: BrandColors.colorPrimaryLight,
              ),
            ),
          ),
        ],
      )
      // : Consumer(

      //     builder: (context, ref, _) {
      //       return GestureDetector(
      //         onTap: () {
      //           ref.refresh(selectedIndexProvider);
      //           Navigator.push(
      //             context,
      //             PageTransition(
      //                 child: AuthScreen(),
      //                 type: PageTransitionType.topToBottom,
      //                 duration: Duration(milliseconds: 1200),
      //                 reverseDuration: Duration(milliseconds: 800)),
      //           );
      //           // Navigator.pushNamed(context, LoginScreen.routes);
      //         },
      //         child: Container(
      //           color: Colors.green,
      //           width: size.width,
      //           height: size.height,
      //           alignment: Alignment.center,
      //           child: Text(
      //             'LET\'S GO!',
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 25,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //       );
      //     },
      //   ),
      );
}
