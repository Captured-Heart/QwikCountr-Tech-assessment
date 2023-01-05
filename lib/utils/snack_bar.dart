import '../app.dart';



// THIS SNACK BAR WAS BUILT FOR THE CASE OF THE INTERNET STREAMS, IT COULD BE UTILIZED FOR OTHER PURPOSES.
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
