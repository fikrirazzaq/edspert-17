import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:learning/domain/usecase/auth_usecases/sign_in_with_google_usecase.dart';

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
}
