import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:learning/data/model/course_response_model.dart';

class CourseRemoteDatasource {
  final Dio client;

  const CourseRemoteDatasource({required this.client});
  Future<CourseResponseModel> getCourses(String majorName) async {
    try {
      const url = 'https://edspert.widyaedu.com/exercise/data_course';

      final result = await client.get(
        url,
        queryParameters: {
          'major_name': majorName,
          'user_email': 'testerngbayu@gmail.com',
        },
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );

      return CourseResponseModel.fromJson(result.data);
    } catch (error, stacktrace) {
      log(error.toString(), stackTrace: stacktrace);
      return CourseResponseModel();
    }
  }
}
