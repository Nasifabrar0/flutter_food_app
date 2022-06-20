import 'package:flutter/material.dart';
import 'package:food_app/pages/home.dart';
import 'package:food_app/pages/slider_details.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = const [HomePage(), SliderDetails()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Liked'),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_travel), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
