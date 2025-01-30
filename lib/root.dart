import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms_flutter/screens/bottom_navigation_bar/bottom_nav_bar.dart';

import 'screens/home/home.dart';

class Root extends StatelessWidget {
  const Root({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const BottomNavBar(),
    );
  }
}