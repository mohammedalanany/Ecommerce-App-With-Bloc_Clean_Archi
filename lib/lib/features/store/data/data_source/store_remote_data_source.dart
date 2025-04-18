import 'package:dartz/dartz.dart';
import 'package:round/services/store_services.dart';

abstract class StoreMainRemoteDataSource {
  Future<Either> fetchHomeData();
  Future<Either> fetchHomeProductsData();
  Future<Either> fetchProductsDetails(int productId);
}

class StoreMainRemoteDataSourceImpl extends StoreMainRemoteDataSource {
  @override
  Future<Either> fetchHomeData() async {
    try {
      final response = await StoreServices.fetchStoreMainPage();
      return Right(response);
    } catch (e) {
      return const Left('Please try again');
    }
  }

  Future<Either> fetchHomeProductsData() async {
    try {
      final response = await StoreServices.fetchMainPageRecommendsProducts();
      return Right(response);
    } catch (e) {
      return const Left('Please try again');
    }
  }

  Future<Either> fetchProductsDetails(int productId) async {
    try {
      final response = await StoreServices.getProductDetails(productId);
      return Right(response);
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
