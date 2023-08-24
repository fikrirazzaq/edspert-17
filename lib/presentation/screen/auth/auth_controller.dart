import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/data/model/register_user_request_model.dart';
import 'package:learning/presentation/router/routes.dart';

import '../../../domain/entity/user_response_entity.dart';
import '../../../domain/usecase/auth_usecases/usecases.dart';

class AuthController extends GetxController {
  final RegisterUserUsecase registerUserUsecase;
  final GetUserUsecase getUserUsecase;
  final IsSignedInWithGoogleUsecase isSignedInWithGoogleUsecase;
  final IsUserRegisteredUsecase isUserRegisteredUsecase;
  final GetCurrentSignedInEmailUsecase getCurrentSignedInEmailUsecase;
  final SignInWithGoogleUsecase signInWithGoogleUsecase;

  AuthController(
    this.registerUserUsecase,
    this.getUserUsecase,
    this.isSignedInWithGoogleUsecase,
    this.isUserRegisteredUsecase,
    this.getCurrentSignedInEmailUsecase,
    this.signInWithGoogleUsecase,
  );

  UserResponseEntity? currentUser;

  Future<User?> signInWithGoogle() async {
    return await signInWithGoogleUsecase();
  }

  bool isSignedInWithGoogle() {
    return isSignedInWithGoogleUsecase();
  }

  Future<bool> isUserRegistered() async {
    return await isUserRegisteredUsecase();
  }

  String? currentSignedInEmail() {
    return getCurrentSignedInEmailUsecase();
  }

  Future<UserResponseEntity?> getCurrentSignedInUser() async {
    if (currentSignedInEmail() != null) {
      return await getUserUsecase(currentSignedInEmail()!);
    }
    return null;
  }

  /// Registration Form
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController schoolTextEditingController = TextEditingController();
  String gender = '';
  String? kelas;

  void updateGender(String value) {
    gender = value;
    update();
  }

  void updateKelas(String value) {
    kelas = value;
    update();
  }

  Future<void> onRegisterButtonPressed() async {
    String email = getCurrentSignedInEmailUsecase() ?? '';
    String name = nameTextEditingController.text;
    String school = schoolTextEditingController.text;

    bool isRegisterSuccess = await registerUserUsecase(RegisterUserRequestModel(
      fullName: name,
      email: email,
      schoolName: school,
      schoolLevel: 'SMA',
      schoolGrade: kelas ?? '10',
      gender: gender,
    ));

    if (isRegisterSuccess) {
      Get.snackbar('Register Success', 'Registered as $name using $email');
      Get.offAllNamed(Routes.homeScreen);
    } else {
      Get.snackbar('Error', 'Something went wrong, please try again');
    }
  }
}
