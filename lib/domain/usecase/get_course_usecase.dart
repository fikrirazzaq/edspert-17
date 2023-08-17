import 'package:learning/domain/entity/course_response_entity.dart';
import 'package:learning/domain/repository/course_repository.dart';

class GetCourseUsecase {
  final CourseRepository repository;

  const GetCourseUsecase({required this.repository});

  Future<CourseResponseEntity> call(String majorName) async =>
      await repository.getCourses(majorName);
}
