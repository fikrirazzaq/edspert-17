import 'package:learning/domain/entity/course_response_entity.dart';

abstract class CourseRepository {
  Future<CourseResponseEntity> getCourses(String majorName);
}
