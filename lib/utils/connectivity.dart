import 'dart:async';

import '../app.dart';

// I AM CREATING THE INTERNET STATUS STREAM
final checkInternetStatusProvider =
    StreamProvider<Stream<InternetConnectionStatus>>((ref) async* {
  var status = InternetConnectionChecker().onStatusChange;

  yield status;
});
