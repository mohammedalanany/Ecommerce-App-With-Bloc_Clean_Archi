import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/features/store/presentation/screens/bloc/product_details_cubit/products_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductsDetailsState> {
  ProductDetailsCubit() : super(ProductsDetailsInitial());

  Future<void> fetchProductDetails(int productId) async {}
}
