import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:learning/presentation/screen/courses/do_exercise/do_exercise_controller.dart';

class ExerciseResultScreen extends StatelessWidget {
  const ExerciseResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoExerciseController>(
      builder: (controller) {
        return Scaffold(
          body: Center(child: Text('Nilai: ${controller.scoreResult}')),
        );
      },
    );
  }
}
