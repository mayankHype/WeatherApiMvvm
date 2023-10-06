import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_api/view/custom_city_view/custom_city_view.dart';
import 'package:weather_api/view/home_view/home_view.dart';
import 'package:weather_api/view/next_day_view/next_day_view.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
PageController _pageController=PageController();
List<Widget> _pages=[CustomSearchView(),HomeView(),NextDayView()];
int initalPage=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: pageViewBuilder(),
    );
  }

/// Page View Builder in Body
  Widget pageViewBuilder(){
    return PageView.builder(
      itemCount: _pages.length,
       itemBuilder: (context, index) => Container(
        child: _pages[initalPage],
       ),
        controller: _pageController,
        onPageChanged: (value) {
          log(value.toString());
          setState(() {
            initalPage=value;
          });
        },
      );
  }

/// Bottom Navigation Bar
  Widget bottomNavigationBar(){
    return BottomNavigationBar(
      currentIndex: initalPage,
      onTap: (value) {
        setState(() {
          initalPage=value;
        });
      },
      items: const[
      BottomNavigationBarItem(icon: Icon(Icons.search),activeIcon: Icon(Icons.search_outlined),label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.sunny),activeIcon: Icon(Icons.sunny_snowing),label: "Today"),
          BottomNavigationBarItem(icon: Icon(Icons.next_plan),activeIcon: Icon(Icons.next_plan_outlined),label: "Tommorow"),
    ]);
  }
}