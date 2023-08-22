import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entity/course_response_entity.dart';

class CourseBuilder extends StatelessWidget {
  final List<CourseDataEntity> courseList;

  const CourseBuilder({super.key, required this.courseList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: courseList.length > 5 ? 5 : courseList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return Container(
          height: 96,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                height: 53,
                width: 53,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(courseList[index].courseName),
              ),
            ],
          ),
        );
      },
    );
  }
}
