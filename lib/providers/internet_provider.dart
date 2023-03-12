import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class Internet with ChangeNotifier {
  final Connectivity connectivity;
  late final StreamSubscription connectivityStreamSubscription;
  String status = "loading";
  Internet({required this.connectivity}) {
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        status = "wifi";
        notifyListeners();
      } else if (event == ConnectivityResult.mobile) {
        status = "mobile";
        notifyListeners();
      }
    });
  }
}
