import 'package:learning/data/datasource/course_remote_datasource.dart';
import 'package:learning/data/model/course_response_model.dart';
import 'package:learning/domain/entity/course_response_entity.dart';
import 'package:learning/domain/repository/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDatasource remoteDatasource;
  const CourseRepositoryImpl({required this.remoteDatasource});

  @override
  Future<CourseResponseEntity> getCourses(String majorName) async {
    final response = await remoteDatasource.getCourses(majorName);

    final data = CourseResponseEntity(
      status: response.status ?? -1,
      message: response.message ?? '',
      data: List<CourseDataModel>.from(response.data ?? [])
          .map(
            (e) => CourseDataEntity(
              courseId: e.courseId ?? '',
              majorName: e.majorName ?? '',
              courseCategory: e.courseCategory ?? '',
              courseName: e.courseName ?? '',
              urlCover: e.urlCover ?? '',
              jumlahMateri: e.jumlahMateri ?? 0,
              jumlahDone: e.jumlahDone ?? 0,
              progress: e.progress ?? 0,
            ),
          )
          .toList(),
    );

    return data;
  }
}
