import 'package:learning/domain/entity/banner_response_entity.dart';
import 'package:learning/domain/repository/banner_repository.dart';

class GetBannersUsecase {
  final BannerRepository repository;

  const GetBannersUsecase({required this.repository});

  Future<BannerResponseEntity> call() async => await repository.getBanners();
}
