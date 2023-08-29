import 'package:get/get.dart';
import 'package:learning/domain/entity/course_list_response_entity.dart';
import 'package:learning/domain/repository/course_repository.dart';

import '../../../domain/entity/exercise_list_response_entity.dart';

class CourseController extends GetxController {
  final CourseRepository repository;

  /// TODO: Remove repository, use usecases courseList & exerciseList instead.

  CourseController(this.repository);

  List<CourseDataEntity> courseListData = List.empty(growable: true);
  void getCourseList() async {
    CourseListResponseEntity response = await repository.getCourses('IPA');
    print('getCourseList:: ${response.message}');
    courseListData = response.data;
    update();
  }

  List<ExerciseDataEntity> exerciseListData = List.empty(growable: true);
  void getExerciseList(String courseId) async {
    ExerciseListResponseEntity response = await repository.getExercisesByCourse(courseId);
    print('getExerciseList:: ${response.message}');
    exerciseListData = response.data;
    update();
  }
}
