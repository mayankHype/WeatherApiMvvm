import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_api/common/constant.dart';
import 'package:weather_api/view/custom_city_view/custom_city_view.dart';
import 'package:weather_api/view/home_view/home_view.dart';
import 'package:weather_api/view/navigation_view/navigation_view.dart';
import 'package:weather_api/view/next_day_view/next_day_view.dart';
import 'package:weather_api/view/routers/new_naviagation_view.dart';
import 'package:weather_api/view/splash_view/splash_view.dart';




final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator = GlobalKey(debugLabel: 'shell');

/// Router Configuration File

final routes=GoRouter(
  initialLocation: Routes.homePage,
  // initialLocation: Routes.initalRoute,
  navigatorKey: _rootNavigator,
  errorBuilder: (context, state) => Scaffold(appBar: AppBar(title:const Text("Error Route"),),
  body: Center(child: Text(state.error.toString()),),
  ),

  routes:[
GoRoute(
path: Routes.initalRoute,
builder: (context, state) => SplashScreen(),
),
GoRoute(path: Routes.navRoute,
builder: (context,state)=>NavigationScreen()
),

ShellRoute(
  parentNavigatorKey: _rootNavigator,
  navigatorKey: _shellNavigator,
  builder: (context, state, child) => NewNavScreen(key: state.pageKey, child: child),
  routes: [
GoRoute(
  path: Routes.homePage,
  builder: (context, state) =>HomeView(),
),
GoRoute(
  path: Routes.searchRoute,
  builder: (context, state) =>CustomSearchView(),
),
GoRoute(
  path: Routes.nextDayPage,
  builder: (context, state) =>NextDayView(),
),
]),




  ]
);