import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:weather_api/common/constant.dart';
import 'package:weather_api/common/utils.dart';
import 'package:weather_api/model/weather_model.dart';
import 'package:weather_api/service/weather_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final homeViewModelProvider = Provider((ref) => HomeViewModel(ref));

class HomeViewModel {
  final Ref ref;
  HomeViewModel(this.ref);

  final connectivity = Connectivity();
  Future<WeatherResponseModel> getWeather() async {
    try {
      final location = await Location.instance.getLocation();
      final result = await connectivity.checkConnectivity();
      final model = WeatherModel(
          latitude: location.latitude!, longitude: location.longitude!);
      if (result == ConnectivityResult.none) {
        return await ref
            .read(weatherServiceProvider)
            .getWeatherDataFromDevice();
      } else {
        return await ref.read(weatherServiceProvider).getWeather(model);
      }
    } on SocketException catch (_) {
      showDialogFlash(title: noConnection, content: noConnectionMessage);
      rethrow;
    } on TimeoutException catch (_) {
      showDialogFlash(title: noConnection, content: timeout);
      rethrow;
    }
  }


}
