import 'package:learning/data/datasource/banner_remote_datasource.dart';
import 'package:learning/data/model/banner_response_model.dart';
import 'package:learning/domain/entity/banner_response_entity.dart';
import 'package:learning/domain/repository/banner_repository.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerRemoteDatasource remoteDatasource;

  const BannerRepositoryImpl({required this.remoteDatasource});

  @override
  Future<BannerResponseEntity> getBanners() async {
    final bannerModel = await remoteDatasource.getBanners();
    final data = BannerResponseEntity(
      message: bannerModel.message ?? '',
      status: bannerModel.status ?? -1,
      data: List<BannerDataModel>.from(bannerModel.data ?? [])
          .map(
            (e) => BannerDataEntity(
              eventId: e.eventId ?? '',
              eventTitle: e.eventTitle ?? '',
              eventDescription: e.eventDescription ?? '',
              eventImage: e.eventImage ?? '',
              eventUrl: e.eventUrl ?? '',
            ),
          )
          .toList(),
    );
    return data;
  }
}
