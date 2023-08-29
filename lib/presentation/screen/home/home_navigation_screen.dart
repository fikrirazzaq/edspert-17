import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/presentation/screen/home/home_screen.dart';

import 'home_controller.dart';

class HomeNavigationScreen extends StatelessWidget {
  HomeNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: nav[controller.selectedNavIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedNavIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Diskusi',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              controller.navigateTo(index);
            },
          ),
        );
      },
    );
  }

  final List<Widget> nav = [
    HomeScreen(),
    const Placeholder(),
    const Placeholder(),
  ];
}
