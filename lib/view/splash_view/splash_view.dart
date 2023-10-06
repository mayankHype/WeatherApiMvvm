
import 'package:flutter/material.dart';
import 'package:weather_api/common/constant.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {

    Future.delayed(Duration(seconds: 2),(){
      context.go(Routes.navRoute);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImageAssets.splashScreenLogo,
        ))
      ),
    );
  }
}