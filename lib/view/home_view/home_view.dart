import 'package:flutter/material.dart';
import 'package:weather_api/common/utils.dart';
import 'package:weather_api/view/home_view/home_view_model.dart';
import 'package:weather_api/widget/error_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

final homeViewFutureProvider = FutureProvider(
    (ref) async => ref.watch(homeViewModelProvider).getWeather());

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      checkInternetConnectivity(ref);
      // final n = ref.watch(homeViewModelProvider);
      final weather = ref.watch(homeViewFutureProvider);
      return Scaffold(
          body: weather.when(

              data: (data) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                    Text(
                                    "${(data.list![0].main!.temp!/10).toStringAsFixed(2)} C"),
                                     Text(
                                  DateFormat.yMMMd()
                                      .format(data.list![0].dtTxt!),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18),
                                ),

                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.city!.name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 30),
                      ),
                      const SizedBox(width: 4),
                      Text(data.city!.country!),
                    ],
                  ),

                ],
              ),
              error: (error, trace) => WeatherErrorWidget(
                  onTap: () => ref.refresh(homeViewFutureProvider)),
              loading: () =>  Center(
                    child: SizedBox(
  width: 200.0,
  height: 100.0,
  child: Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: Colors.white,
    child: Text(
      'Loading',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40.0,
        fontWeight:
        FontWeight.bold,
      ),
    ),
  ),
),
                  )));
    });
  }
}
//25°