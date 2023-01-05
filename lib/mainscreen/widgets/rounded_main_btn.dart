import '../../app.dart';

Widget roundedMainBTN({
  required String message,
  required IconData icon,
}) {
  return Tooltip(
    message: message,
    child: CircleAvatar(
      child: Icon(
        icon,
        size: 28,
      ),
    ),
  );
}
