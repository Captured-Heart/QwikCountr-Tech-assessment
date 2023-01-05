import '../../app.dart';

Widget searchBTN(Size size, BuildContext context) {
  return Tooltip(
    message: search,
    child: SearchBarAnimation(
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
      searchBoxColour: Theme.of(context).primaryColorLight.withOpacity(0.4),
      cursorColour: Theme.of(context).primaryColorLight,
      buttonWidget: Icon(
        Icons.search,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      trailingWidget: const Icon(Icons.search),
      secondaryButtonWidget: Icon(
        Icons.dangerous,
        color: Theme.of(context).buttonTheme.colorScheme?.background,
      ),
      onFieldSubmitted: (String value) {
        debugPrint('onFieldSubmitted value $value');
      },
    ),
  );
}
