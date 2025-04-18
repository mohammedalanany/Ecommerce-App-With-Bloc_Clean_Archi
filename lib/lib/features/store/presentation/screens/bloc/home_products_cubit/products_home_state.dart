import 'package:equatable/equatable.dart';
import 'package:round/features/store/data/models/product_model.dart';

sealed class ProductsHomeState extends Equatable {
  final List<ProductModel> recommendedProducts;
  final List<ProductModel> offersProducts;
  ProductsHomeState(this.recommendedProducts, this.offersProducts);
  @override
  List<Object?> get props => [recommendedProducts, offersProducts];
}

class StoreMainInitial extends ProductsHomeState {
  StoreMainInitial() : super([], []);
}

class RecommendedProductsLoading extends ProductsHomeState {
  RecommendedProductsLoading() : super([], []);
}

class RecommendedProductsLoaded extends ProductsHomeState {
  RecommendedProductsLoaded(super.recommendedProducts, super.offersProducts);
}

class StoreMainError extends ProductsHomeState {
  final String message;

  StoreMainError(this.message) : super([], []);

  @override
  List<Object?> get props => [message];
}

class AddRecommendedProductsToFavoriteLoading extends ProductsHomeState {
  AddRecommendedProductsToFavoriteLoading() : super([], []);
}
