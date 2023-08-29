import 'package:learning/domain/entity/course_list_response_entity.dart';
import 'package:learning/domain/entity/exercise_list_response_entity.dart';
import 'package:learning/domain/entity/exercise_result_response_entity.dart';
import 'package:learning/domain/entity/question_list_response_entity.dart';

import '../../data/model/submit_answer_request_model.dart';

abstract class CourseRepository {
  /// Course List
  Future<CourseListResponseEntity> getCourses(String majorName);

  /// Exercise List
  Future<ExerciseListResponseEntity> getExercisesByCourse(String courseId);

  /// Do Exercise
  Future<QuestionListResponseEntity> getQuestionsByExercise(String exerciseId);
  Future<bool> submitExerciseAnswer(SubmitAnswerRequestModel request);
  Future<ExerciseResultResponseEntity> getExerciseResult(String exerciseId);
}
