import 'package:get/get.dart';
import 'package:learning/presentation/screen/auth/auth_binding.dart';
import 'package:learning/presentation/screen/auth/login_screen.dart';
import 'package:learning/presentation/router/routes.dart';
import 'package:learning/presentation/screen/auth/registration_form_page.dart';
import 'package:learning/presentation/screen/courses/course_list/course_list_screen.dart';
import 'package:learning/presentation/screen/courses/do_exercise/do_exercise_binding.dart';
import 'package:learning/presentation/screen/courses/do_exercise/do_exercise_screen.dart';
import 'package:learning/presentation/screen/courses/do_exercise/exercise_result_screen.dart';
import 'package:learning/presentation/screen/courses/exercise_list/exercise_list_screen.dart';
import 'package:learning/presentation/screen/home/home_binding.dart';
import 'package:learning/presentation/screen/home/home_screen.dart';
import 'package:learning/presentation/screen/auth/splash_screen.dart';

import '../screen/courses/course_binding.dart';
import '../screen/home/home_navigation_screen.dart';

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
      page: () => HomeNavigationScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.courseListScreen,
      page: () => const CourseListScreen(),
      binding: CourseBinding(),
    ),
    GetPage(
      name: Routes.exerciseListScreen,
      page: () => const ExerciseListScreen(),
      binding: CourseBinding(),
      arguments: ExerciseListScreenArgs,
    ),
    GetPage(
      name: Routes.doExerciseScreen,
      page: () => const DoExerciseScreen(),
      binding: DoExerciseBinding(),
      arguments: String,
    ),
    GetPage(
      name: Routes.exerciseResult,
      page: () => const ExerciseResultScreen(),
      binding: DoExerciseBinding(),
    ),
  ];
}
