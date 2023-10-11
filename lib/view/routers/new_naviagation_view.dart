
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_api/view/routers/bottomNavigation/new_bottomNav.dart';

class NewNavScreen extends StatefulWidget {
  final Widget child;
  const NewNavScreen({required this.child, Key? key}) : super(key: key);

  @override
  State<NewNavScreen> createState() => _NewNavScreenState();
}

class _NewNavScreenState extends State<NewNavScreen> {


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}