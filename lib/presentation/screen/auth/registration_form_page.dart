import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';
import 'widgets/select_gender_widget.dart';
import 'widgets/widgets.dart';

class RegistrationFormScreen extends StatelessWidget {
  const RegistrationFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yuk isi data diri'),
      ),
      body: GetBuilder<AuthController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                InputFieldWidget(
                  titleText: 'Email',
                  hintText: 'Email...',
                  enabled: false,
                  controller: TextEditingController(text: controller.currentSignedInEmail()),
                ),
                InputFieldWidget(
                  titleText: 'Nama Lengkap',
                  hintText: 'contoh: Lionel Messi',
                  controller: controller.nameTextEditingController,
                ),
                SelectGenderWidget(
                  gender: controller.gender,
                  onSelectGender: (value) {
                    controller.updateGender(value);
                  },
                ),
                DropdownButtonFormField(
                  value: controller.kelas,
                  items: const [
                    DropdownMenuItem(value: '10', child: Text('Kelas 10')),
                    DropdownMenuItem(value: '11', child: Text('Kelas 11')),
                    DropdownMenuItem(value: '12', child: Text('Kelas 12')),
                  ],
                  onChanged: (value) {
                    controller.updateKelas(value!);
                  },
                ),
                InputFieldWidget(
                  titleText: 'Nama Sekolah',
                  hintText: 'Sekolah...',
                  controller: controller.schoolTextEditingController,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.onRegisterButtonPressed();
                  },
                  child: const Text('DAFTAR'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
