import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:round/features/auth_feature/check_user/presentation/check-user_screen.dart';
import 'package:round/features/auth_feature/profile/presentation/bloc/profile_cubit.dart';
import 'package:round/features/store/presentation/screens/bloc/home_products_cubit/products_home_state.dart';
import 'package:round/features/store/presentation/screens/bloc/home_products_cubit/recommend_product_cubit.dart';
import 'package:round/features/store/presentation/screens/product_detail_screen.dart';
import 'package:round/src/helpers/app_translations.dart';
import 'package:round/src/mixin/alerts_mixin.dart';
import 'package:round/src/models/global/http_exception.dart';
import 'package:round/src/providers/addresses/addresses.dart';
import 'package:round/src/providers/auth/auth.dart';
import 'package:round/src/providers/store/store.dart';
import 'package:round/src/screens/store/product_search_store_screen.dart';
import 'package:round/src/widgets/bottom_sheet/gift_bottom_sheet.dart';
import 'package:round/src/widgets/items/store/store_main_item.dart';
import 'package:round/src/widgets/shimmers/store_shimmer.dart';

class RecommendOffersProductsWidget extends StatefulWidget {
  const RecommendOffersProductsWidget({super.key});

  @override
  State<RecommendOffersProductsWidget> createState() =>
      _RecommendOffersProductsWidgetState();
}

class _RecommendOffersProductsWidgetState
    extends State<RecommendOffersProductsWidget> with AlertsMixin {
  late StoreProvider _storeProvider;
  late Auth _authReference;
  bool _firstCalled = false;
  @override
  void didChangeDependencies() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    if (args != null) {}
    _authReference = Provider.of<Auth>(context, listen: false);
    _storeProvider = Provider.of<StoreProvider>(context, listen: false);
    Provider.of<Addresses>(context, listen: false).getRegions();
    if (!_firstCalled) {
      // if(_storeProviderForCartNumber.cartCount==0)_fetchCartCountForPurchase();
      //   _fetchStoreHomeProducts();
      _firstCalled = true;
    }

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  int activeIndex = 0;
  int? _storeRecommendedProducts;
  int? _plusIndex;
  int? _minusIndex;
  int? _cartIndex;
  bool _loading = false;
  bool _loading1 = false;
  Future<void> _switchLikeForStoreRecommendedProducts(int? id) async {
    try {
      await _storeProvider.switchLikeForStoreRecommendedProducts(id);
    } on HttpException catch (error) {
      if (error.statusCode == 401) {
        Provider.of<Auth>(context, listen: false).logoutDone();
      } else {
        // showErrorDialog(context, error.toString());
      }
    } catch (error) {
      showErrorDialog(context, error.toString());
      throw error;
    } finally {}
  }

  Future<void> _switchLikeForStoreLatestOffers(int? id) async {
    try {
      await _storeProvider.switchLikeForStoreLatestOffers(id);
    } on HttpException catch (error) {
      if (error.statusCode == 401) {
        Provider.of<Auth>(context, listen: false).logoutDone();
      } else {
        // showErrorDialog(context, error.toString());
      }
    } catch (error) {
      showErrorDialog(context, error.toString());
      throw error;
    } finally {}
  }

  Future<void> _addToCartForStoreRecommendedProducts(
      int? id, String type, String serviceType) async {
    if (this.mounted)
      setState(() {
        _loading = true;
      });
    try {
      await _storeProvider.addToCart(id, type, serviceType);
    } on HttpException catch (error) {
      if (error.statusCode == 401) {
        Provider.of<Auth>(context, listen: false).logoutDone();
      } else {
        // showErrorDialog(context, error.toString());
      }
    } catch (error) {
      showErrorDialog(context, error.toString());
      throw error;
    } finally {
      if (this.mounted)
        setState(() {
          _loading = false;
        });
    }
  }

  Future<void> _addToCartForStoreLatestOffers(
      int? id, String type, String serviceType) async {
    if (this.mounted)
      setState(() {
        _loading1 = true;
      });
    try {
      await _storeProvider.addToCart(id, type, serviceType);
    } on HttpException catch (error) {
      if (error.statusCode == 401) {
        Provider.of<Auth>(context, listen: false).logoutDone();
      } else {
        // showErrorDialog(context, error.toString());
      }
    } catch (error) {
      showErrorDialog(context, error.toString());
      throw error;
    } finally {
      if (this.mounted)
        setState(() {
          _loading1 = false;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: ProfileCubit()..getUser()),
        BlocProvider(
            create: (context) =>
                RecommendsProductsCubit()..fetchRecommendedProducts()),
      ],
      child: BlocBuilder<RecommendsProductsCubit, ProductsHomeState>(
        builder: (context, state) {
          if (state is RecommendedProductsLoaded) {
            return Column(
              children: [
                Container(
                  height: 181,
                  child: ListView.separated(
                    separatorBuilder: (_, __) => const SizedBox(
                      width: 8,
                    ),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    //physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (c, i) => InkWell(
                      onTap: () {
                        if (!_loading)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                product: state.recommendedProducts[i],
                              ),
                            ),
                          );
                      },
                      child: StoreMainItem(
                        addToCartTap: () async {
                          if (_loading1) {
                            // do nothing
                          } else {
                            setState(() {
                              _cartIndex = i;
                              _storeRecommendedProducts =
                                  state.recommendedProducts[i].id;
                            });
                            if (!_authReference.isAuth) {
                              await _addToCartForStoreRecommendedProducts(
                                  _storeRecommendedProducts, "plus", "");
                              _cartIndex = null;

                              // comment for now and i will un comment this later

                              if (_storeProvider.gifts.length != 0 &&
                                  _storeProvider.hadGift == 0)
                                await showMaterialModalBottomSheet(
                                    expand: true,
                                    backgroundColor: Colors.transparent,
                                    elevation: 1,
                                    barrierColor: Color(0x52000000),
                                    context: context,
                                    builder: (_) => GiftBottomSheet(
                                          giftMessage:
                                              _storeProvider.giftMessage,
                                          id: state.recommendedProducts[i].id,
                                        ));
                            } else {
                              final xx = (await showConfirmDialog(
                                      context,
                                      AppLocalizations.of(context)!.login,
                                      AppLocalizations.of(context)!.loginText2,
                                      [
                                        AppLocalizations.of(context)!.cancel,
                                        AppLocalizations.of(context)!.ok
                                      ])) ??
                                  false;
                              if (xx) {
                                Navigator.of(context)
                                    .pushNamed(CheckUserScreen.routeName);
                              } else {}
                            }
                          }
                        },
                        minus: _loading && _minusIndex == i,
                        plus: _loading && _plusIndex == i,
                        cart: _loading && _cartIndex == i,
                        minusTap: () async {
                          if (_loading1 || _loading) {
                            // do nothing
                          } else {
                            setState(() {
                              _minusIndex = i;
                              _storeRecommendedProducts =
                                  state.recommendedProducts[i].id;
                            });
                            if (_authReference.isAuth) {
                              await _addToCartForStoreRecommendedProducts(
                                  _storeRecommendedProducts, "minus", "");
                              _minusIndex = null;

                              // comment for now and i will un comment this later

                              if (_storeProvider.gifts.length != 0 &&
                                  _storeProvider.hadGift == 0)
                                await showMaterialModalBottomSheet(
                                    expand: true,
                                    backgroundColor: Colors.transparent,
                                    elevation: 1,
                                    barrierColor: Color(0x52000000),
                                    context: context,
                                    builder: (_) => GiftBottomSheet(
                                          id: state.recommendedProducts[i].id,
                                        ));
                            } else {
                              final xx = (await showConfirmDialog(
                                      context,
                                      AppLocalizations.of(context)!.login,
                                      AppLocalizations.of(context)!.loginText2,
                                      [
                                        AppLocalizations.of(context)!.cancel,
                                        AppLocalizations.of(context)!.ok
                                      ])) ??
                                  false;
                              if (xx) {
                                Navigator.of(context)
                                    .pushNamed(CheckUserScreen.routeName);
                              } else {}
                            }
                          }
                        },
                        plusTap: () async {
                          if (_loading1 || _loading) {
                            // do nothing
                          } else {
                            setState(() {
                              _plusIndex = i;
                              _storeRecommendedProducts =
                                  state.recommendedProducts[i].id;
                            });
                            if (_authReference.isAuth) {
                              await _addToCartForStoreRecommendedProducts(
                                  _storeRecommendedProducts, "plus", "");
                              _plusIndex = null;

                              // comment for now and i will un comment this later

                              if (_storeProvider.gifts.length != 0 &&
                                  _storeProvider.hadGift == 0)
                                await showMaterialModalBottomSheet(
                                    expand: true,
                                    backgroundColor: Colors.transparent,
                                    elevation: 1,
                                    barrierColor: Color(0x52000000),
                                    context: context,
                                    builder: (_) => GiftBottomSheet(
                                          id: state.recommendedProducts[i].id,
                                        ));
                            } else {
                              final xx = (await showConfirmDialog(
                                      context,
                                      AppLocalizations.of(context)!.login,
                                      AppLocalizations.of(context)!.loginText2,
                                      [
                                        AppLocalizations.of(context)!.cancel,
                                        AppLocalizations.of(context)!.ok
                                      ])) ??
                                  false;
                              if (xx) {
                                Navigator.of(context)
                                    .pushNamed(CheckUserScreen.routeName);
                              } else {}
                            }
                          }
                        },
                        likeTap: () async {
                          if (_authReference.isAuth) {
                            await context
                                .read<RecommendsProductsCubit>()
                                .toggleFavorite(
                                  state.recommendedProducts,
                                  state.recommendedProducts[i].id!,
                                  state.offersProducts,
                                );
                          } else {
                            final xx = (await showConfirmDialog(
                                    context,
                                    AppLocalizations.of(context)!.login,
                                    AppLocalizations.of(context)!.loginText2, [
                                  AppLocalizations.of(context)!.cancel,
                                  AppLocalizations.of(context)!.ok
                                ])) ??
                                false;
                            if (xx) {
                              Navigator.of(context)
                                  .pushNamed(CheckUserScreen.routeName);
                            } else {}
                          }
                        },
                        hasTax: state.recommendedProducts[i].hasTax,
                        isLiked: state.recommendedProducts[i].isLiked,
                        cartCount: state.recommendedProducts[i].cartCount,
                        productRate: double.parse(state
                            .recommendedProducts[i].productRate
                            .toString()),
                        offerPrice: state.recommendedProducts[i].offerPrice,
                        clientPrice: state.recommendedProducts[i].clientPrice,
                        photo: state.recommendedProducts[i].photo,
                        title: state.recommendedProducts[i].title,
                        offerType: state.recommendedProducts[i].offerType,
                      ),
                    ),
                    itemCount: state.recommendedProducts.length,
                  ),
                ),
                if (state.offersProducts.isNotEmpty)
                  Column(
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //color: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              AppLocalizations.of(context)!.newOffers, //
                              style: TextStyle(
                                  fontSize: 16,
                                  color: const Color(0xDE000000),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Playfair',
                                  letterSpacing: .12),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  ProductSearchStoreScreen.routeName,
                                  arguments: {
                                    'categoryId': 0,
                                    'get_offers': "${1}",
                                  }).then(
                                  (value) => _storeProvider.clearStoreSearch());
                            },
                            child: Text(
                              AppLocalizations.of(context)!.seeAll,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: const Color(0xDE000000),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Playfair',
                                  letterSpacing: .09),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 181,
                        child: ListView.separated(
                          separatorBuilder: (_, __) => const SizedBox(
                            width: 8,
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          //physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (c, i) => InkWell(
                            onTap: () {
                              if (!_loading)
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                      product: state.offersProducts[i],
                                    ),
                                  ),
                                );
                            },
                            child: StoreMainItem(
                              addToCartTap: () async {
                                if (_loading1) {
                                  // do nothing
                                } else {
                                  setState(() {
                                    _cartIndex = i;
                                    _storeRecommendedProducts =
                                        state.offersProducts[i].id;
                                  });
                                  if (_authReference.isAuth) {
                                    await _addToCartForStoreRecommendedProducts(
                                        _storeRecommendedProducts, "plus", "");
                                    _cartIndex = null;

                                    // comment for now and i will un comment this later

                                    if (_storeProvider.gifts.length != 0 &&
                                        _storeProvider.hadGift == 0)
                                      await showMaterialModalBottomSheet(
                                          expand: true,
                                          backgroundColor: Colors.transparent,
                                          elevation: 1,
                                          barrierColor: Color(0x52000000),
                                          context: context,
                                          builder: (_) => GiftBottomSheet(
                                                giftMessage:
                                                    _storeProvider.giftMessage,
                                                id: state.offersProducts[i].id,
                                              ));
                                  } else {
                                    final xx = (await showConfirmDialog(
                                            context,
                                            AppLocalizations.of(context)!.login,
                                            AppLocalizations.of(context)!
                                                .loginText2,
                                            [
                                              AppLocalizations.of(context)!
                                                  .cancel,
                                              AppLocalizations.of(context)!.ok
                                            ])) ??
                                        false;
                                    if (xx) {
                                      Navigator.of(context)
                                          .pushNamed(CheckUserScreen.routeName);
                                    } else {}
                                  }
                                }
                              },
                              minus: _loading && _minusIndex == i,
                              plus: _loading && _plusIndex == i,
                              cart: _loading && _cartIndex == i,
                              minusTap: () async {
                                if (_loading1 || _loading) {
                                  // do nothing
                                } else {
                                  setState(() {
                                    _minusIndex = i;
                                    _storeRecommendedProducts =
                                        state.offersProducts[i].id;
                                  });
                                  if (_authReference.isAuth) {
                                    await _addToCartForStoreRecommendedProducts(
                                        _storeRecommendedProducts, "minus", "");
                                    _minusIndex = null;

                                    // comment for now and i will un comment this later

                                    if (_storeProvider.gifts.length != 0 &&
                                        _storeProvider.hadGift == 0)
                                      await showMaterialModalBottomSheet(
                                          expand: true,
                                          backgroundColor: Colors.transparent,
                                          elevation: 1,
                                          barrierColor: Color(0x52000000),
                                          context: context,
                                          builder: (_) => GiftBottomSheet(
                                                id: state.offersProducts[i].id,
                                              ));
                                  } else {
                                    final xx = (await showConfirmDialog(
                                            context,
                                            AppLocalizations.of(context)!.login,
                                            AppLocalizations.of(context)!
                                                .loginText2,
                                            [
                                              AppLocalizations.of(context)!
                                                  .cancel,
                                              AppLocalizations.of(context)!.ok
                                            ])) ??
                                        false;
                                    if (xx) {
                                      Navigator.of(context)
                                          .pushNamed(CheckUserScreen.routeName);
                                    } else {}
                                  }
                                }
                              },
                              plusTap: () async {
                                if (_loading1 || _loading) {
                                  // do nothing
                                } else {
                                  setState(() {
                                    _plusIndex = i;
                                    _storeRecommendedProducts =
                                        state.offersProducts[i].id;
                                  });
                                  if (_authReference.isAuth) {
                                    await _addToCartForStoreRecommendedProducts(
                                        _storeRecommendedProducts, "plus", "");
                                    _plusIndex = null;

                                    // comment for now and i will un comment this later

                                    if (_storeProvider.gifts.length != 0 &&
                                        _storeProvider.hadGift == 0)
                                      await showMaterialModalBottomSheet(
                                          expand: true,
                                          backgroundColor: Colors.transparent,
                                          elevation: 1,
                                          barrierColor: Color(0x52000000),
                                          context: context,
                                          builder: (_) => GiftBottomSheet(
                                                id: state.offersProducts[i].id,
                                              ));
                                  } else {
                                    final xx = (await showConfirmDialog(
                                            context,
                                            AppLocalizations.of(context)!.login,
                                            AppLocalizations.of(context)!
                                                .loginText2,
                                            [
                                              AppLocalizations.of(context)!
                                                  .cancel,
                                              AppLocalizations.of(context)!.ok
                                            ])) ??
                                        false;
                                    if (xx) {
                                      Navigator.of(context)
                                          .pushNamed(CheckUserScreen.routeName);
                                    } else {}
                                  }
                                }
                              },
                              likeTap: () async {
                                if (_authReference.isAuth) {
                                  setState(() {
                                    _storeRecommendedProducts =
                                        state.offersProducts[i].id;
                                  });
                                  await _switchLikeForStoreRecommendedProducts(
                                      _storeRecommendedProducts);
                                } else {
                                  final xx = (await showConfirmDialog(
                                          context,
                                          AppLocalizations.of(context)!.login,
                                          AppLocalizations.of(context)!
                                              .loginText2,
                                          [
                                            AppLocalizations.of(context)!
                                                .cancel,
                                            AppLocalizations.of(context)!.ok
                                          ])) ??
                                      false;
                                  if (xx) {
                                    Navigator.of(context)
                                        .pushNamed(CheckUserScreen.routeName);
                                  } else {}
                                }
                              },
                              hasTax: state.offersProducts[i].hasTax,
                              isLiked: state.offersProducts[i].isLiked,
                              cartCount: state.offersProducts[i].cartCount,
                              productRate: double.parse(state
                                  .offersProducts[i].productRate
                                  .toString()),
                              offerPrice: state.offersProducts[i].offerPrice,
                              clientPrice: state.offersProducts[i].clientPrice,
                              photo: state.offersProducts[i].photo,
                              title: state.offersProducts[i].title,
                              offerType: state.offersProducts[i].offerType,
                            ),
                          ),
                          itemCount: state.offersProducts.length,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
              ],
            );
          } else if (state is RecommendedProductsLoading) {
            return Container(
              height: 181,
              child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(
                        width: 8,
                      ),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (c, i) => StoreShimmer(),
                  itemCount: 5),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
