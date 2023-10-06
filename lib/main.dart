import 'package:flutter/material.dart';
import 'package:weather_api/common/constant.dart';
import 'package:weather_api/common/utils.dart';
import 'package:weather_api/view/home_view/home_view.dart';
import 'package:weather_api/view/navigation_view/navigation_view.dart';
import 'package:weather_api/view/splash_view/splash_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}



final routes=GoRouter(
  
  routes:[
GoRoute(
path: Routes.initalRoute,
builder: (context, state) => SplashScreen(),
),
GoRoute(path: Routes.navRoute,
builder: (context,state)=>NavigationScreen()

)

  ]
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: routes,
        title: 'Weather Api',
       key: navigatorKey,
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: const Color(0xff17181f)),
     
      ),
    );
  }
}
