import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/presentation/screen/home/home_controller.dart';
import 'package:learning/presentation/screen/home/widgets/banner_builder.dart';
import 'package:learning/presentation/screen/home/widgets/course_builder.dart';
import 'package:learning/presentation/screen/home/widgets/welcoming_widget.dart';
import 'package:learning/presentation/screen/widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7F8),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fadil',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            Text(
              'Selamat datang',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: CircleAvatar(
              backgroundColor: Colors.red,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomingWidget(),
              const SizedBox(height: 16),
              const SectionTitle(title: 'Terbaru'),
              const SizedBox(height: 8),
              GetBuilder<HomeController>(
                  init: homeController,
                  initState: (state) => homeController.getBanners(),
                  builder: (hCon) {
                    final bannerList = hCon.banner;

                    return bannerList.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : BannerBuilder(bannerList: bannerList);
                  }),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SectionTitle(title: 'Pilih Pelajaran'),
                  TextButton(onPressed: () {}, child: const Text('Lihat Semua'))
                ],
              ),
              const SizedBox(height: 8),
              GetBuilder<HomeController>(
                init: homeController,
                initState: (state) => homeController.getCourse('IPA'),
                builder: (cHome) {
                  final courseList = cHome.courseList;

                  return courseList.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : CourseBuilder(courseList: courseList);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
