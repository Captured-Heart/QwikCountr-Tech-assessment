import '../../app.dart';

class OnBoardingPages extends StatelessWidget {
  const OnBoardingPages({
    Key? key,
    required this.size,
    required this.imgUrl,
    required this.title,
    this.widget,
    required this.scaffoldBackgroundColor,
    required this.subtitle,
  }) : super(key: key);

  final Size size;
  final String title, imgUrl, subtitle;
  final Widget? widget;
  final Color scaffoldBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                height: size.height * 0.42,
                width: size.width,
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.all(12),
                // decoration: const BoxDecoration(
                //     // shape: BoxShape.circle,
                //     // color:Theme.of(context).primaryColor.withOpacity(0.2),
                //     ),
                child: Image.asset(imgUrl),
              ),
              SizedBox(
                height: size.height * 0.25,
                width: size.width,
                // clipBehavior: Clip.hardEdge,
                // decoration: const BoxDecoration(
                //   color: Colors.green,
                // ),
                child: ListTile(
                  minVerticalPadding: 15,
                  // contentPadding: EdgeInsets.symmetric(vertical: 20),
                  title: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 23,
                          fontWeight: AppFontWeight.bold,
                          color: BrandColors.colorPrimaryLight,
                        ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.4,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: BrandColors.colorPrimaryLight,
                            fontWeight: AppFontWeight.regular,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
