

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_api/common/constant.dart';
import 'package:weather_api/service/analytics.dart';
import 'package:weather_api/view/routers/bottomNavigation/provider/navProvider.dart';


class BottomNavigationWidget extends ConsumerStatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends ConsumerState<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final position = ref.watch(navControllerProvider);

    return BottomNavigationBar(
   
      currentIndex: position,
      onTap: (value) => _onTap(value),
 
      items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search),activeIcon: Icon(Icons.search_outlined),label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.sunny),activeIcon: Icon(Icons.sunny_snowing),label: "Today"),
          BottomNavigationBarItem(icon: Icon(Icons.next_plan),activeIcon: Icon(Icons.next_plan_outlined),label: "Tommorow"),
      
      ],
    );
  }

  void _onTap(int index) {
    ref.read(navControllerProvider.notifier).setPosition(index);

    switch (index) {
      case 0:
      Analytics().parseEvent("SearchEvent");
        context.go(Routes.searchRoute);        
        break;
      case 1:
        Analytics().parseEvent("TodayEvent");
        context.go(Routes.homePage);        
        break;
      case 2:
        Analytics().parseEvent("TomorrowEvent");
        context.go(Routes.nextDayPage);        
        break;
      default:
    }
  }
}