
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_api/common/utils.dart';
import 'package:weather_api/service/analytics.dart';

import 'package:weather_api/service/weather_service.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shimmer/shimmer.dart';

import '../../model/custom_city_model.dart';
final customViewFutureProvider = FutureProvider.family<CustomCityModel,String>(
        (ref,city) async {
 final data=await WeatherServiceImpl().getWeatherByCity(city);
          return data;
        }

);
class CustomSearchView extends StatefulWidget {
  CustomSearchView({Key? key}) : super(key: key);

  @override
  State<CustomSearchView> createState() => _CustomSearchViewState();
}

class _CustomSearchViewState extends State<CustomSearchView> {
 TextEditingController searchController=TextEditingController();


@override
  void initState() {
Analytics().parseEvent("Search");
  
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    searchController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      checkInternetConnectivity(ref);

    final data=ref.watch(customViewFutureProvider(searchController.text??"Jaipur"));
      return GestureDetector(
        onTap: (){
        FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: TextFormField(
              controller: searchController,
              onEditingComplete: () {
                log("completed");
                 ref.watch(customViewFutureProvider(searchController.text));
              },
              onSaved: (value){
      
                ref.watch(customViewFutureProvider(value!));
              },
              // onChanged: (value){
      
              //   ref.watch(customViewFutureProvider(value!));
              // },
      
      
              decoration: InputDecoration(
                // suffix: IconButton(onPressed:(){
                //   log("Pressed me");
                //   ref.read(customCityViewModelProvider).getWeatherByCity(searchController.text.toString());
                // }, icon:Icon(Icons.search)),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
          ),
          body:searchController.text.length==0?const Center(child: Text("Enter any city",
            style:TextStyle(
                fontWeight: FontWeight.w800, fontSize: 30),
      
          )):data.when(data:(data)=>
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text((data.main!.temp!/10).toStringAsFixed(2)+"C",
      
                ),
      
                Text(data.name.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 30),)
              ],
            ),
          )
          ,error: (error, trace) => Text("Try another city"),
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
              )
        ),),
      );
    });
  }
}
//25°