import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:learning/data/datasource/banner_remote_datasource.dart';
import 'package:learning/data/datasource/course_remote_datasource.dart';
import 'package:learning/data/repository/banner_repository_impl.dart';
import 'package:learning/data/repository/course_repository.dart';
import 'package:learning/domain/repository/banner_repository.dart';
import 'package:learning/domain/repository/course_repository.dart';
import 'package:learning/domain/usecase/get_banners_usecase.dart';
import 'package:learning/domain/usecase/get_course_usecase.dart';
import 'package:learning/presentation/screen/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        bannersUsecase: Get.find<GetBannersUsecase>(),
        courseUsecase: Get.find<GetCourseUsecase>(),
      ),
    );
    Get.lazyPut<GetCourseUsecase>(
      () => GetCourseUsecase(repository: Get.find<CourseRepository>()),
    );
    Get.lazyPut<GetBannersUsecase>(
      () => GetBannersUsecase(repository: Get.find<BannerRepository>()),
    );

    Get.lazyPut<BannerRepository>(
      () => BannerRepositoryImpl(
          remoteDatasource: Get.find<BannerRemoteDatasource>()),
    );
    Get.lazyPut<CourseRepository>(
      () => CourseRepositoryImpl(
          remoteDatasource: Get.find<CourseRemoteDatasource>()),
    );

    Get.lazyPut<BannerRemoteDatasource>(
      () => BannerRemoteDatasource(client: Get.find<Dio>()),
    );
    Get.lazyPut<CourseRemoteDatasource>(
      () => CourseRemoteDatasource(client: Get.find<Dio>()),
    );

    Get.lazyPut<Dio>(() => Dio());
  }
}
