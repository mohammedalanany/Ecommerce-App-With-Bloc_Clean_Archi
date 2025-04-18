import 'package:equatable/equatable.dart';
import 'package:round/features/store/data/models/product_model.dart';

sealed class ProductsDetailsState extends Equatable {
  ProductsDetailsState() : super();
}

class ProductsDetailsInitial extends ProductsDetailsState {
  ProductsDetailsInitial() : super();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductDetailsLoading extends ProductsDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductDetailsLoaded extends ProductsDetailsState {
  final ProductModel productDetails;
  ProductDetailsLoaded(this.productDetails);

  @override
  // TODO: implement props
  List<Object?> get props => [productDetails];
}
