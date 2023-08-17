import 'package:get/get.dart';
import 'package:learning/presentation/login_screen.dart';
import 'package:learning/presentation/router/routes.dart';
import 'package:learning/presentation/screen/home/home_binding.dart';
import 'package:learning/presentation/screen/home/home_page.dart';
import 'package:learning/presentation/splash_screen.dart';

class Pages {
  static final getAllPages = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => MyHomePage(),
      binding: HomeBinding(),
    ),
  ];
}
