import 'package:flutter_riverpod/flutter_riverpod.dart';

final navControllerProvider = StateNotifierProvider<NavController,int>((ref) {
  return NavController(1);
});

class NavController extends StateNotifier<int> {
  NavController(super.state);

  void setPosition(int value) {
    state = value;
  }
  

}