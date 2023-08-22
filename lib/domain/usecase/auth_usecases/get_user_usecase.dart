import 'package:learning/domain/entity/user_response_entity.dart';
import 'package:learning/domain/repository/auth_repository.dart';

class GetUserUsecase {
  final AuthRepository repository;

  const GetUserUsecase({required this.repository});

  Future<UserResponseEntity?> call(String email) async => await repository.getUserByEmail(email: email);
}
