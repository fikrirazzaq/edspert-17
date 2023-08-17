import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/presentation/screen/home/home_controller.dart';
import 'package:learning/presentation/screen/home/widgets/banner_builder.dart';
import 'package:learning/presentation/screen/home/widgets/welcoming_widget.dart';
import 'package:learning/presentation/screen/widgets/section_title.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

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
                        : ListView.separated(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemBuilder: (context, index) {
                              final course = cHome.courseList[index];

                              return Container(
                                height: 96,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                width: Get.width,
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
                                        color: const Color(0xFFF3F7F8),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            course.majorName,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '${course.jumlahDone} / ${course.jumlahMateri} latihan soal',
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(height: 11),
                                          const LinearProgressIndicator(
                                            value: 0.5,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
