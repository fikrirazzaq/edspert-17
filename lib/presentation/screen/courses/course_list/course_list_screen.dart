import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/domain/entity/course_list_response_entity.dart';

import '../../../../values/colors.dart';
import '../../../../values/margins.dart';
import '../../../../values/strings.dart';
import '../course_controller.dart';
import '../widgets/course_list_item_widget.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  @override
  void initState() {
    Get.find<CourseController>().getCourseList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseController>(
      builder: (controller) {
        List<CourseDataEntity> courseListData = controller.courseListData;

        return Scaffold(
          backgroundColor: const Color(0xFFF3F7F8),
          appBar: AppBar(
            title: const Text(Strings.pilihPelajaran),
            backgroundColor: AppColors.bluePrimary,
          ),
          body: ListView.separated(
            padding: Margins.paddingPage,
            itemCount: courseListData.length,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
              CourseDataEntity data = courseListData[index];
              return CourseListItemWidget(data: data);
            },
          ),
        );
      },
    );
  }
}
