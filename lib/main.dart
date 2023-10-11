import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/main.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:weather_api/common/constant.dart';
import 'package:weather_api/common/utils.dart';
import 'package:weather_api/config/routes/goRouter.dart';
import 'package:weather_api/firebase_options.dart';
import 'package:weather_api/view/custom_city_view/custom_city_view.dart';
import 'package:weather_api/view/home_view/home_view.dart';
import 'package:weather_api/view/navigation_view/navigation_view.dart';
import 'package:weather_api/view/next_day_view/next_day_view.dart';
import 'package:weather_api/view/splash_view/splash_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
final shorebirdCodePush = ShorebirdCodePush();
void main() async{
WidgetsFlutterBinding.ensureInitialized();
// Create an instance of the ShorebirdCodePush class


// Check whether a patch is available to install.
final isUpdateAvailable = await shorebirdCodePush.isNewPatchAvailableForDownload();

// Download a new patch.
await shorebirdCodePush.downloadUpdateIfAvailable();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}





class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: routes,
        title: 'Weather Apis',
       key: navigatorKey,
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: const Color(0xff17181f)),
     
      ),
    );
  }
}
