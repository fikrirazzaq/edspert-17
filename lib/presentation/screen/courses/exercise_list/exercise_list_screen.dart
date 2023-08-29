import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:learning/domain/entity/exercise_list_response_entity.dart';

import '../../../../values/colors.dart';
import '../../../../values/margins.dart';
import '../course_controller.dart';
import '../widgets/exercise_grid_item_widget.dart';

class ExerciseListScreenArgs {
  final String courseId;
  final String courseName;
  ExerciseListScreenArgs({
    required this.courseId,
    required this.courseName,
  });
}

class ExerciseListScreen extends StatefulWidget {
  const ExerciseListScreen({super.key});

  @override
  State<ExerciseListScreen> createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  String courseName = '';

  @override
  void initState() {
    ExerciseListScreenArgs args = Get.arguments as ExerciseListScreenArgs;
    courseName = args.courseName;
    Get.find<CourseController>().getExerciseList(args.courseId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7F8),
      appBar: AppBar(
        title: Text(courseName),
        backgroundColor: AppColors.bluePrimary,
      ),
      body: GetBuilder<CourseController>(builder: (controller) {
        List<ExerciseDataEntity> exerciseListData = controller.exerciseListData;
        return GridView.builder(
          padding: Margins.paddingPage,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 153 / 96,
          ),
          itemCount: exerciseListData.length,
          itemBuilder: (context, index) {
            ExerciseDataEntity data = exerciseListData[index];
            return ExerciseGridItemWidget(data: data);
          },
        );
      }),
    );
  }
}
