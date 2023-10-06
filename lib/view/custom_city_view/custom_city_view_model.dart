import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

import '../../model/custom_city_model.dart';
import '../../model/weather_model.dart';
import '../../service/weather_service.dart';

final customCityViewModelProvider = Provider((ref) => CustomCityViewModel(ref));



class CustomCityViewModel {
  final Ref ref;


  CustomCityViewModel(this.ref);

  final connectivity = Connectivity();

  Future<CustomCityModel> getWeatherByCity(String city) async {
    log(city);
    try {

        return await ref.read(weatherServiceProvider).getWeatherByCity(city);

    } on SocketException catch (_) {
      log("Errors");
      rethrow;
    }
      // showDialogFlash(title: noConnection, content: noConnectionMessage);

    }


}
