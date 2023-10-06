import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:weather_api/common/constant.dart';
import 'package:weather_api/view/home_view/home_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void showDialogFlash({String title = '', String? content}) {

log("no internet");
  // navigatorKey.currentContext!.showFlashDialog(
  //     constraints: const BoxConstraints(maxWidth: 300),
  //     title: Text(title, style: const TextStyle(fontSize: 16)),
  //     content: Text(content!, style: const TextStyle(fontSize: 14)),
  //     negativeActionBuilder: (context, controller, _) {
  //       return TextButton(
  //         onPressed: () => controller.dismiss(),
  //         child: const Text('CANCEL'),
  //       );
  //     },
  //     positiveActionBuilder: (context, controller, _) {
  //       return TextButton(
  //           onPressed: () {
  //             controller.dismiss();
  //           },
  //           child: const Text('OK'));
  //     });
}

void checkInternetConnectivity(WidgetRef ref) {
  final connectivity = Connectivity();
  connectivity.onConnectivityChanged.listen((event) {
    switch (event) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        ref.invalidate(homeViewFutureProvider);
        break;
      case ConnectivityResult.none:
        showDialogFlash(title: noConnection, content: noConnectionMessage);
        break;
      default:
        ConnectivityResult.mobile;
    }
  });
}

final internetNotifier = Provider((ref) => Connectivity());
