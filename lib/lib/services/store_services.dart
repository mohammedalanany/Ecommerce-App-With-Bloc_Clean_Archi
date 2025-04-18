import 'package:round/src/models/global/pagination_list.dart';

import 'api_service.dart';

abstract class StoreServices {
  static Future fetchStoreMainPage() async {
    return await ApiService.getService('/shop/home-page');
  }

  static Future fetchMainPageRecommendsProducts() async {
    return await ApiService.getService('/shop/home-products');
  }

  static Future addProductToFavorite(dynamic data) async {
    return await ApiService.postService('/shop/like-product', data: data);
  }

  static Future getProductDetails(int productId) async {
    return await ApiService.postService(
        '/shop/product-page?product_id=$productId');
  }

  static Future undoProductToFavorite(dynamic data) async {
    return await ApiService.postService('/shop/unlike-product', data: data);
  }

  static Future fetchSearchProducts(
      dynamic data, bool refresh, PaginationList? storeSearch) async {
    print('fetchSearchProducts service');

    return await ApiService.getService(
        '/shop/products-search?page=${refresh ? 1 : ((storeSearch?.currentPage ?? 0) + 1)}$data');
  }
}
