import 'package:get/get.dart';
import 'package:learning/domain/entity/banner_response_entity.dart';
import 'package:learning/domain/entity/course_list_response_entity.dart';
import 'package:learning/domain/usecase/get_banners_usecase.dart';
import 'package:learning/domain/usecase/get_course_usecase.dart';

class HomeController extends GetxController {
  final GetBannersUsecase bannersUsecase;
  final GetCourseUsecase courseUsecase;

  HomeController({
    required this.bannersUsecase,
    required this.courseUsecase,
  });

  RxList<BannerDataEntity> banner = <BannerDataEntity>[].obs;
  Rx<List<BannerDataEntity>> banner2 = Rx([]);

  RxList<CourseDataEntity> courseList = <CourseDataEntity>[].obs;

  void getBanners() async {
    final result = await bannersUsecase.call();
    banner(result.data);
    banner2.value = result.data;
    update();
  }

  void getCourse(String majorName) async {
    final result = await courseUsecase.call(majorName);

    courseList(result.data);
    update();
  }
}
