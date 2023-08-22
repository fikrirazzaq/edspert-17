import 'package:get/get.dart';
import 'package:learning/presentation/screen/auth/auth_binding.dart';
import 'package:learning/presentation/screen/auth/login_screen.dart';
import 'package:learning/presentation/router/routes.dart';
import 'package:learning/presentation/screen/auth/registration_form_page.dart';
import 'package:learning/presentation/screen/home/home_binding.dart';
import 'package:learning/presentation/screen/home/home_screen.dart';
import 'package:learning/presentation/screen/auth/splash_screen.dart';

class Pages {
  static final getAllPages = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.registrationFormScreen,
      page: () => const RegistrationFormScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
