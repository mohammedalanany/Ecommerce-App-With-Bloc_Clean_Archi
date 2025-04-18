import 'package:equatable/equatable.dart';
import 'package:round/features/store/data/models/product_model.dart';

class ProductsHomeModel extends Equatable {
  final List<ProductModel> recommendsProducts;
  final List<ProductModel> offersProducts;

  @override
  // TODO: implement props

  @override
  List<Object?> get props {
    return [
      recommendsProducts,
      offersProducts,
    ];
  }

  ProductsHomeModel({
    required this.recommendsProducts,
    required this.offersProducts,
  });

  factory ProductsHomeModel.fromJson(Map<String, dynamic> json) {
    return ProductsHomeModel(
      offersProducts: (json['latest_offers'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
      recommendsProducts: (json['recommended_products'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
    );
  }
}
