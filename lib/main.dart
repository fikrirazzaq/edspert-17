import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/presentation/router/pages.dart';
import 'package:learning/presentation/router/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: Pages.getAllPages,
      initialRoute: Routes.splashScreen,
    );
  }
}
