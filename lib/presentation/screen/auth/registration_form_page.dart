import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class RegistrationFormScreen extends StatelessWidget {
  const RegistrationFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yuk isi data diri'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputFieldWidget(
              titleText: 'Email',
              hintText: 'Email...',
              controller: TextEditingController(),
            ),
            InputFieldWidget(
              titleText: 'Nama Lengkap',
              hintText: 'contoh: Lionel Messi',
              controller: TextEditingController(),
            ),
            InputFieldWidget(
              titleText: 'Nama Sekolah',
              hintText: 'Sekolah...',
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}
