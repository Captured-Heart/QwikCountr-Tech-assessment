import 'package:flutter_animated_dialog/flutter_animated_dialog.dart' as dialog;

import '../app.dart';



//! warning dialog
Future<void> warningDialog({
  required BuildContext context,
  required String contentText,
  required String titleText,
  required VoidCallback onPositiveClick,
  VoidCallback? onNegativeClick,
}) {
  return dialog.showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: ((context1) {
      return dialog.ClassicGeneralDialogWidget(
        titleText: titleText,
        contentText: contentText,
        onPositiveClick: onPositiveClick,
        onNegativeClick: onNegativeClick,
      );
    }),
    animationType: dialog.DialogTransitionType.slideFromLeft,
    curve: Curves.fastOutSlowIn,
    duration: const Duration(seconds: 1),
  );
}
