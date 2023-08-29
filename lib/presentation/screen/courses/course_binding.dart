import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:learning/data/datasource/course_remote_datasource.dart';
import 'package:learning/domain/repository/course_repository.dart';
import 'package:learning/presentation/screen/courses/course_controller.dart';

import '../../../data/repository/course_repository_impl.dart';

class CourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseController>(
      () => CourseController(
        Get.find<CourseRepository>(),
      ),
    );
    Get.lazyPut<CourseRepository>(
      () => CourseRepositoryImpl(remoteDatasource: Get.find<CourseRemoteDatasource>()),
    );

    Get.lazyPut<CourseRemoteDatasource>(
      () => CourseRemoteDatasource(client: Get.find<Dio>()),
    );

    Get.lazyPut<Dio>(() => Dio());
  }
}
