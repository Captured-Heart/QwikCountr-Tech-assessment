import '../app.dart';

void snack(BuildContext context, String message, {bool errorTrue = false}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        clipBehavior: Clip.none,
        backgroundColor:
            errorTrue ? BrandColors.colorError : BrandColors.colorGreen,
        content: Text(
          message,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400),
        ),
        duration: const Duration(milliseconds: 1500),
      ),
    );

void topSnack({
  required BuildContext context,
  required String message,
  required bool isError,
  int? duration,
}) =>
    showTopSnackBar(
      context,
      isError
          ? CustomSnackBar.error(
              message: message,
            )
          : CustomSnackBar.success(
              message: message,
            ),
      displayDuration: Duration(milliseconds: duration ?? 1500),
    );
