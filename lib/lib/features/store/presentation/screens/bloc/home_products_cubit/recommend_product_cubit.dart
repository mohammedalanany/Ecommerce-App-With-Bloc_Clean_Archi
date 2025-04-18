import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/core/dependency_injection/locator_service.dart';
import 'package:round/features/store/presentation/screens/bloc/home_products_cubit/products_home_state.dart';

import '../../../../../../services/store_services.dart';
import '../../../../data/models/product_model.dart';

class RecommendsProductsCubit extends Cubit<ProductsHomeState> {
  RecommendsProductsCubit() : super(StoreMainInitial());

  Future<void> fetchRecommendedProducts() async {
    emit(RecommendedProductsLoading());
    try {
      final response = await LocatorService.fetchMainPageProductsUseCase();
      response.fold((message) {
        emit(StoreMainError(message.toString()));
      }, (data) {
        data["recommended_products"].forEach((item) {
          state.recommendedProducts.add(ProductModel.fromJson(item));
        });
        data["latest_offers"].forEach((item) {
          state.offersProducts.add(ProductModel.fromJson(item));
        });
        emit(RecommendedProductsLoaded(
            state.recommendedProducts, state.offersProducts));
      });
    } catch (e) {
      emit(StoreMainError(e.toString()));
    }
  }

  Future<void> toggleFavorite(
    List<ProductModel> products,
    int productId,
    List<ProductModel> offers,
  ) async {
    try {
      // Find the product in either list
      ProductModel? targetProduct = products.firstWhere(
        (p) => p.id == productId,
        orElse: () => offers.firstWhere(
          (o) => o.id == productId,
          orElse: () => ProductModel(id: -1), // fallback dummy
        ),
      );

      if (targetProduct.id == -1) return; // not found

      // Toggle the like state
      final newIsLiked = targetProduct.isLiked == 1 ? 0 : 1;

      final updatedProducts = products.map((product) {
        if (product.id == productId) {
          return product.copyWith(isLiked: newIsLiked);
        }
        return product;
      }).toList();

      final updatedOffers = offers.map((product) {
        if (product.id == productId) {
          return product.copyWith(isLiked: newIsLiked);
        }
        return product;
      }).toList();
      emit(RecommendedProductsLoaded(
        updatedProducts,
        updatedOffers,
      ));
      // Prepare data for the API call
      final data = {
        'item_id': productId.toString()
      }; // adjust as per your API spec

      // Send API call depending on current `isLiked`
      final response = targetProduct.isLiked == 1
          ? await StoreServices.undoProductToFavorite(data)
          : await StoreServices.addProductToFavorite(data);

      final parsedResponse = json.decode(response.body);
      print(parsedResponse);
    } catch (e) {
      print("Error toggling favorite: $e");
      // Optionally emit an error state
    }
  }
}
