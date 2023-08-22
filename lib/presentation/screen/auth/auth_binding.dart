import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:learning/data/datasource/auth_remote_datasource.dart';
import 'package:learning/data/repository/auth_repository_impl.dart';
import 'package:learning/domain/repository/auth_repository.dart';

import '../../../domain/usecase/auth_usecases/usecases.dart';
import 'auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(
        Get.find<RegisterUserUsecase>(),
        Get.find<GetUserUsecase>(),
        Get.find<IsSignedInWithGoogleUsecase>(),
        Get.find<IsUserRegisteredUsecase>(),
        Get.find<GetCurrentSignedInEmailUsecase>(),
        Get.find<SignInWithGoogleUsecase>(),
      ),
    );
    Get.lazyPut<RegisterUserUsecase>(
      () => RegisterUserUsecase(repository: Get.find<AuthRepository>()),
    );
    Get.lazyPut<SignInWithGoogleUsecase>(
      () => SignInWithGoogleUsecase(repository: Get.find<AuthRepository>()),
    );
    Get.lazyPut<GetUserUsecase>(
      () => GetUserUsecase(repository: Get.find<AuthRepository>()),
    );
    Get.lazyPut<IsSignedInWithGoogleUsecase>(
      () => IsSignedInWithGoogleUsecase(repository: Get.find<AuthRepository>()),
    );
    Get.lazyPut<IsUserRegisteredUsecase>(
      () => IsUserRegisteredUsecase(repository: Get.find<AuthRepository>()),
    );
    Get.lazyPut<GetCurrentSignedInEmailUsecase>(
      () => GetCurrentSignedInEmailUsecase(repository: Get.find<AuthRepository>()),
    );

    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(remoteDatasource: Get.find<AuthRemoteDatasource>()),
    );

    Get.lazyPut<AuthRemoteDatasource>(
      () => AuthRemoteDatasource(client: Get.find<Dio>()),
    );

    Get.lazyPut<Dio>(() => Dio());
  }
}
