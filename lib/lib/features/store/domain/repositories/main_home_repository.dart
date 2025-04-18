import 'package:dartz/dartz.dart';

abstract class MainHomeRepository {
  Future<Either> fetchHomeElements();
  Future<Either> fetchHomeProducts();
  Future<Either> fetchProductDetails(int productId);
}
