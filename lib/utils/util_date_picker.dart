import '../app.dart';

final dateTimeProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});
void datePicker(
    {required BuildContext context,
    required Function setState,
    required WidgetRef ref}) {
  showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920, 1),
      lastDate: DateTime(2078, 12),
      initialDatePickerMode: DatePickerMode.year,
      builder: (context, picker) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor,
              onPrimary: Colors.white,
              surface: Theme.of(context).textTheme.button!.color!,
              onSurface: Theme.of(context).primaryColor,
            ),
            dialogBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
            dialogTheme: DialogTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentTextStyle: Theme.of(context).textTheme.button,
                actionsPadding: const EdgeInsets.symmetric(horizontal: 30)),
          ),
          child: picker!,
        );
      }).then((selectedDate) {
    if (selectedDate != null) {
      ref.read(dateTimeProvider.notifier).update(
            (state) => DateTime.fromMicrosecondsSinceEpoch(
                selectedDate.microsecondsSinceEpoch),
          );
    }
  });
}
