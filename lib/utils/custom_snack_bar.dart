// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'dart:math';

import '../app.dart';

/// Popup widget that you can you by default to show some information
class CustomSnackBar extends StatefulWidget {
  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final int iconRotationAngle;

  CustomSnackBar({
    Key? key,
    required this.message,
    required this.icon,
    required this.backgroundColor,
    this.iconRotationAngle = 32,
    this.textStyle,
  }) : super(key: key);

  const CustomSnackBar.success({
    Key? key,
    required this.message,
    this.icon = const Icon(
      Icons.sentiment_very_satisfied,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 15,
      color: Colors.white,
    ),
    this.iconRotationAngle = 32,
    this.backgroundColor = Colors.green,
  });

  const CustomSnackBar.info({
    Key? key,
    required this.message,
    this.icon = const Icon(
      Icons.sentiment_neutral,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.iconRotationAngle = 32,
    this.backgroundColor = const Color(0xff2196F3),
  });

  const CustomSnackBar.error(
      {Key? key,
      required this.message,
      this.icon = const Icon(
        Icons.error_outline,
        color: Color(0x15000000),
        size: 60,
      ),
      this.textStyle = const TextStyle(
        fontWeight: AppFontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
      this.iconRotationAngle = 22,
      this.backgroundColor = BrandColors.colorError});

  @override
  CustomSnackBarState createState() => CustomSnackBarState();
}

class CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 8.0),
            spreadRadius: 1,
            blurRadius: 30,
          ),
        ],
      ),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            child: Container(
              height: 95,
              margin: const EdgeInsets.only(left: 10),
              child: Transform.rotate(
                angle: widget.iconRotationAngle * pi / 180,
                child: widget.icon,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  widget.message,
                  style: theme.textTheme.bodyText2?.merge(
                    widget.textStyle ?? const TextStyle(),
                  ),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
