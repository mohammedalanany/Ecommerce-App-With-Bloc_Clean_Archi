import 'package:dartz/dartz.dart';
import 'package:round/core/dependency_injection/locator.dart';
import 'package:round/features/store/data/data_source/store_remote_data_source.dart';
import 'package:round/features/store/domain/repositories/main_home_repository.dart';

class MainHomeRepositoryImpl extends MainHomeRepository {
  @override
  Future<Either> fetchHomeElements() async {
    return await locator<StoreMainRemoteDataSource>().fetchHomeData();
  }

  @override
  Future<Either> fetchHomeProducts() async {
    return await locator<StoreMainRemoteDataSource>().fetchHomeProductsData();
  }

  @override
  Future<Either> fetchProductDetails(int productId) async {
    return await locator<StoreMainRemoteDataSource>()
        .fetchProductsDetails(productId);
  }
}
