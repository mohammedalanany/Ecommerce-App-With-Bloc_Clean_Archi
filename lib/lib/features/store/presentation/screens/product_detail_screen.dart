import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:round/features/store/data/models/product_model.dart';
import 'package:round/src/helpers/app_translations.dart';
import 'package:round/src/helpers/my_flutter_app_icons.dart';
import 'package:round/src/mixin/alerts_mixin.dart';
import 'package:round/src/models/global/http_exception.dart';
import 'package:round/src/models/store/rating_model.dart';
import 'package:round/src/providers/auth/auth.dart';
import 'package:round/src/providers/store/store.dart';
import 'package:round/src/screens/auth/login_screens/login_screen.dart';
import 'package:round/src/screens/store/cart_screen.dart';
import 'package:round/src/screens/store/images_screen.dart';
import 'package:round/src/screens/store/product_information_store_screen.dart';
import 'package:round/src/screens/store/product_rating_screen.dart';
import 'package:round/src/screens/store/store_other_sellers.dart';
import 'package:round/src/widgets/bottom_sheet/gift_bottom_sheet.dart';
import 'package:round/src/widgets/custom_loading.dart';
import 'package:round/src/widgets/items/review_item.dart';
import 'package:round/src/widgets/items/store/store_main_item.dart';
import 'package:round/src/widgets/shimmers/store_shimmer.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-details-screen';
  final ProductModel? product;

  const ProductDetailScreen({super.key, this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with AlertsMixin {
  int? _storeRelatedProducts;
  int? _storeProductDetails;
  bool _plusIndex = false;
  bool _minusIndex = false;
  int? _minusIndex1;
  bool _cartIndex = false;
  int? _plusIndex1;
  int? _cartIndex1;
  bool _loading = false;
  bool _loading1 = false;
  Future<void> _addToCartForProductDetails(
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

  //
  Future<void> _addToCartForRelatedProducts(
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

  ///
  bool addedToCard = false;
  int cartNumber = 1;

  bool _isLoading = false;

  Future<void> _fetchProductDetails(int? id) async {
    setState(() {
      _isLoading = true;
    });
    EasyLoading.show();
    try {
      await _storeProvider.fetchProductDetails(widget.product?.id);
    } on HttpException catch (error) {
      if (error.statusCode == 401) {
        _authReference.logoutDone();
      } else {
        showErrorDialog(context, error.toString());
      }
    } catch (error) {
      print(error);
      throw error;
    } finally {
      if (this.mounted)
        setState(() {
          _isLoading = false;
        });
      EasyLoading.dismiss();
    }
  }

  late StoreProvider _storeProvider;
  late Auth _authReference;
  bool _firstCalled = false;
  int? id;
  int? taxFees;
  int? additionalTax;
  int? additionalTaxO;
  int? priceAdditionalTax;
  int? priceAdditionalTax0;
  int? offerAdditionalTax;
  @override
  void didChangeDependencies() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    if (args != null) {
      id = args['id'];
      print(id);
    }
    _authReference = Provider.of<Auth>(context, listen: false);
    _storeProvider = Provider.of<StoreProvider>(context, listen: false);

    if (!_firstCalled) {
      await _fetchProductDetails(id);
      _firstCalled = true;
    }

    super.didChangeDependencies();
  }

  ScrollController _scrollController = ScrollController();
  ScrollController _scrollController1 = ScrollController();

  ///
  int? _productDetailFavorite;
  int? _relatedProductDetail;
  Future<void> _switchLikeForRelatedProducts(int? id) async {
    try {
      await _storeProvider.switchLikeForRelatedProducts(id);
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

  Future<void> _switchLikeForProductDetail(int? id) async {
    try {
      await _storeProvider.switchLikeForProductDetail(id);
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

  bool _isLoading2 = false;
  Future<void> _fetchCartCountForPurchase() async {
    setState(() {
      _isLoading2 = true;
    });
    try {
      await _storeProvider.fetchCartCountForPurchase();
    } on HttpException catch (error) {
      if (error.statusCode == 401) {
        _authReference.logoutDone();
      } else {
        showErrorDialog(context, error.toString());
      }
    } catch (error) {
      print(error);
      throw error;
    } finally {
      if (this.mounted)
        setState(() {
          _isLoading2 = false;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () async {
              if (_authReference.isAuth) {
                Navigator.of(context)
                    .pushNamed(CartScreen.routeName)
                    .then((value) => _fetchCartCountForPurchase());
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
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                } else {}
              }
            },
            child: Container(
              width: 55,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 17),
                    child: Icon(
                      MyCustomIcons.bag,
                      color: const Color(0xFF000000),
                      size: 22,
                    ),
                  ),
                  if (_storeProvider.cartCount != 0 && !_isLoading2)
                    Positioned(
                      left: Localizations.localeOf(context).languageCode == 'ar'
                          ? 23
                          : 16,
                      top: 22,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xFFFFCC00),
                            border: Border.all(color: Color(0xFFFFFFFF))),
                        child: Text(
                          //"9",
                          '${_storeProvider.cartCount ?? 0}' ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF000000),
                            fontSize: 12,
                            letterSpacing: .4,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Stack(
            //   children: [
            //     Icon(MyCustomIcons.bag,color:const Color(0xFF000000),size: 19,),
            //
            //   ],
            // )
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      body: _isLoading || _storeProvider.productDetails == null
          ? Container(
              color: const Color(0xFFFFFFFF),
            )
          : Stack(
              children: [
                Container(
                  color: const Color(0xFFFFFFFF),
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 13,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(widget.product!.title!, // product_rate
                              // 'TruSkin Vitamin C Serum for Face, Anti\nAging Serum with Hyaluronic Acid,',
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: .12,
                                fontFamily: 'Playfair',
                                fontWeight: FontWeight.w800,
                                color: const Color(0xDE000000),
                              )),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: RatingBar(
                            ratingWidget: RatingWidget(
                              full: Icon(
                                Icons.star,
                                color: const Color(0xFFE6B800),
                              ),
                              empty: Icon(
                                Icons.star_border,
                                color: const Color(0xFFE6B800),
                              ),
                              half: Icon(
                                Icons.star_half,
                                color: const Color(0xFFE6B800),
                              ),
                            ),
                            unratedColor: const Color(0xFFF2781F),
                            glowColor: const Color(0xFFFFFFFF),
                            onRatingUpdate: (val) {},
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15.0,
                            tapOnlyMode: false,
                            initialRating:
                                (widget.product!.productRate!).toDouble() ??
                                    0.0,
                            ignoreGestures: true,
                            updateOnDrag: false,
                            direction: Axis.horizontal,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        if (widget.product!.offerPrice! == 0)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              // _storeProvider.productDetails['product']['has_tax']==0?  '${_storeProvider.productDetails['product']['client_price']+additionalTax} SAR':// additionalTax
                              '${widget.product!.clientPrice!} SAR' ?? "",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF037979),
                                fontWeight: FontWeight.w700,
                                letterSpacing: .12,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ),
                        if (widget.product!.offerPrice! != 0)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text.rich(
                              TextSpan(
                                text:
                                    // _storeProvider.productDetails['product']['has_tax']==0?"${_storeProvider.productDetails['product']['offer_price']+additionalTax} ":
                                    "${widget.product!.offerPrice!} " ?? "",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF037979),
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: .12,
                                  fontFamily: 'Nunito',
                                ),
                                // " By selecting Agree and continue below, I agree to round's Terms and conditions "
                                children: <TextSpan>[
                                  TextSpan(
                                    text: Localizations.localeOf(context)
                                                .languageCode ==
                                            'ar'
                                        ? 'ريال  '
                                        : 'SAR  ' ?? "",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF037979),
                                      letterSpacing: .11,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                  TextSpan(
                                    text: //additionalTaxO
                                        // Localizations.localeOf(context).languageCode ==  'ar'?
                                        // _storeProvider.productDetails['product']['has_tax']==0? '${_storeProvider.productDetails['product']['client_price']+additionalTaxO} ريال ':
                                        // '${_storeProvider.productDetails['product']['client_price']} ريال ':
                                        // _storeProvider.productDetails['product']['has_tax']==0?'${_storeProvider.productDetails['product']['client_price']+additionalTaxO} SAR':
                                        '${widget.product!.clientPrice!} SAR' ??
                                            "",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0x99000000),
                                      letterSpacing: .09,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.lineThrough,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                  // can add more TextSpans here...
                                ],
                              ),
                            ),
                          ),

                        const SizedBox(
                          height: 13,
                        ),
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    StorePhotoViewScreen.routeName,
                                    arguments: {
                                      'images': widget.product!.photos,
                                    });
                              },
                              child: Container(
                                height: 161,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    viewportFraction: 1,
                                    aspectRatio: 343 / 161,
                                    initialPage: 0,
                                    //enlargeStrategy: CenterPageEnlargeStrategy.height,
                                    // enlargeCenterPage: true,
                                    enableInfiniteScroll: true,
                                    autoPlay: true,
                                    scrollPhysics: ClampingScrollPhysics(),
                                    onPageChanged: (int index, reason) {
                                      setState(() {
                                        // activeIndex = index;
                                      });
                                    },
                                    //
                                    height: 161,
                                    autoPlayInterval: Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    //Curves.linearToEaseOut,
                                    //onPageChanged: callbackFunction,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                  items: widget.product!.photos!.map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: EdgeInsets.only(
                                                  right: 16, left: 16),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.network(
                                                    i.photo ?? "",
                                                    fit: BoxFit.contain,
                                                  )
                                                  // CachedNetworkImage(
                                                  //   imageUrl:  i.photo??"",
                                                  //   progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                  //       Container(
                                                  //          // height:161,
                                                  //           decoration: BoxDecoration(
                                                  //             color: Colors.white,
                                                  //             borderRadius: BorderRadius.circular(8.0),
                                                  //           ),
                                                  //           // margin: EdgeInsets.symmetric(horizontal: 16),
                                                  //           child: Shimmer.fromColors(
                                                  //             baseColor: Theme.of(context).brightness == Brightness.dark
                                                  //                 ? Colors.grey[900]
                                                  //                 : Colors.grey[300],
                                                  //             highlightColor: Theme.of(context).brightness == Brightness.dark
                                                  //                 ? Colors.grey[800]
                                                  //                 : Colors.grey[100],
                                                  //             direction: ShimmerDirection.rtl,
                                                  //             enabled: true,
                                                  //             child: Container(
                                                  //
                                                  //               width: MediaQuery.of(context).size.width,
                                                  //               decoration: BoxDecoration(
                                                  //                 borderRadius: BorderRadius.circular(8),
                                                  //               ),
                                                  //             ),
                                                  //           )),
                                                  //   errorWidget: (context, url, error) => Center(child: Icon(Icons.error,
                                                  //   size: 100,    color:Color(0xFF037979),
                                                  //   )),
                                                  //   fit: BoxFit.contain,
                                                  // ),
                                                  // Image.network(
                                                  //   i.photo??"",
                                                  //  // 'assets/images/banner.png',
                                                  //   //  'https://dawry-sa.com/uploads/slider-1611778184-6011c8888caa9.jpg',
                                                  //   fit: BoxFit.contain,
                                                  // )
                                                  )),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            if (widget.product!.offerType!
                                .toString()
                                .isNotEmpty)
                              Positioned(
                                top: 0,
                                left: 16,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 24,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  // width: 69,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(7),
                                        bottomLeft: Radius.circular(4),
                                        topRight: Radius.circular(4),
                                        bottomRight: Radius.circular(4),
                                      ),
                                      //border: Border.all(color:const Color(0xFFE3E6E6)),
                                      color: const Color(0xFFFF0000)
                                          .withOpacity(.9)),
                                  child: Text(widget.product!.offerType! ?? '',
                                      style: TextStyle(
                                        fontSize: 12,
                                        letterSpacing: .4,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xDEFFFFFF),
                                      )),
                                ),
                              )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        /*
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                              _storeProvider.productDetails!['product']
                                      ['shop_description'] ??
                                  "", // shop_description
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: .25,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w600,
                                color: const Color(0x99000000),
                              )),
                        ),
                       */
                        if (widget.product!.offerTypeId! == 4)
                          const SizedBox(
                            height: 14,
                          ),
                        if (widget.product!.offerTypeId! == 4)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 16,
                              ),
                              const Icon(
                                MyCustomIcons.gift,
                                color: const Color(0xFF037979),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(widget.product!.offerType! ?? '',
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: .12,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xDE000000),
                                  )),
                              const SizedBox(
                                width: 16,
                              ),
                            ],
                          ),
                        const SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_authReference.isAuth) {
                              setState(() {
                                // playerId = _playerProvider.playerInfo['id'];
                              });
                              _switchLikeForProductDetail(id);
                              print('00');
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
                                    .pushNamed(LoginScreen.routeName);
                              } else {}
                            }
                          },
                          child: Container(
                            height: 48,
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: _storeProvider
                                                    .productDetails!['product']
                                                ['is_liked'] ==
                                            0
                                        ? const Color(0x1F000000)
                                        : Color(0xFFD0E8E8)),
                                color: _storeProvider.productDetails!['product']
                                            ['is_liked'] ==
                                        0
                                    ? const Color(0xFFFFFFFF)
                                    : Color(0xFFEDF7F7)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  _storeProvider.productDetails!['product']
                                              ['is_liked'] ==
                                          0
                                      ? MyCustomIcons.add_fav
                                      : MyCustomIcons.added_fav,
                                  size: 17,
                                  color:
                                      _storeProvider.productDetails!['product']
                                                  ['is_liked'] ==
                                              0
                                          ? const Color(0xFF000000)
                                          : const Color(0xFF037979),
                                ),
                                const SizedBox(
                                  width: 9,
                                ),
                                Text(
                                  _storeProvider.productDetails!['product']
                                              ['is_liked'] ==
                                          0
                                      ? AppLocalizations.of(context)!
                                          .addToWishlist
                                      : AppLocalizations.of(context)!
                                          .addedToWishlist,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                    color: _storeProvider
                                                    .productDetails!['product']
                                                ['is_liked'] ==
                                            0
                                        ? const Color(0xFF000000)
                                        : const Color(0xFF037979),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: const Color(0x29000000)))),
                          height: 16,
                        ),
                        // const SizedBox(height: 16,),
                        Container(
                          height: 8,
                          color: const Color(0xFFF2F2F2),
                        ),

                        if (_storeProvider.productDetails!['product']
                                ['offers_count'] !=
                            0)
                          Container(
                            height: 8,
                            color: const Color(0xFFF2F2F2),
                          ),

                        if (_storeProvider.productDetails!['product']
                                ['offers_count'] !=
                            0)
                          Container(
                            //
                            height: _storeProvider.productDetails!['product']
                                        ['other_offer_price'] ==
                                    0
                                ? 75
                                : 90,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Color(0x29000000)))),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 11,
                                ),
                                Text(AppLocalizations.of(context)!.otherSellers,
                                    style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: .12,
                                      fontFamily: 'Playfair',
                                      fontWeight: FontWeight.w800,
                                      color: const Color(0xDE000000),
                                    )),
                                const SizedBox(
                                  height: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    print(0);
                                    Navigator.of(context).pushNamed(
                                        StoreOtherSellers.routeName,
                                        arguments: {
                                          'product_id': _storeProvider
                                              .productDetails!['product']['id'],
                                          "product_rate": (_storeProvider
                                                      .productDetails![
                                                  'product']['product_rate'])
                                              .toDouble(),
                                          "title": _storeProvider
                                                  .productDetails!['product']
                                              ['title'],
                                          "offer_type": _storeProvider
                                                  .productDetails!['product']
                                              ['offer_type'],
                                          "shop_photo": _storeProvider
                                                  .productDetails!['product']
                                              ['shop']["photo"],
                                          "shop_user_name": _storeProvider
                                                  .productDetails!['product']
                                              ['shop']["user_name"],
                                          "product_photo": _storeProvider
                                                  .productDetails!["product"]
                                              ["photo"],
                                          "is_offer":
                                              _storeProvider.productDetails![
                                                              'product']
                                                          ['offer_price'] !=
                                                      0
                                                  ? true
                                                  : false,
                                          "offer_price": _storeProvider
                                                          .productDetails![
                                                      'product']['has_tax'] ==
                                                  0
                                              ? "$offerAdditionalTax"
                                              : "${_storeProvider.productDetails!['product']['offer_price']} ",
                                          "original_price": _storeProvider
                                                          .productDetails![
                                                      'product']['has_tax'] ==
                                                  0
                                              ? '$priceAdditionalTax0'
                                              : '${_storeProvider.productDetails!['product']['client_price']}',
                                          "price": _storeProvider
                                                          .productDetails![
                                                      'product']['has_tax'] ==
                                                  0
                                              ? '$priceAdditionalTax'
                                              : // additionalTax
                                              '${_storeProvider.productDetails!['product']['client_price']}'
                                        });
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Compare new (${_storeProvider.productDetails!['product']['offers_count'] ?? ""}) from',
                                              style: TextStyle(
                                                fontSize: 12,
                                                letterSpacing: .4,
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xBD000000),
                                              )),
                                          if (_storeProvider.productDetails![
                                                      'product']
                                                  ['other_offer_price'] !=
                                              0)
                                            Text(
                                                '${_storeProvider.productDetails!['product']['other_offer_price'] ?? ""} SAR',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  letterSpacing: .12,
                                                  fontFamily: 'Nunito',
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      const Color(0xDE000000),
                                                )),
                                        ],
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 17,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        Container(
                          height: 8,
                          color: const Color(0xFFF2F2F2),
                        ),
                        Container(
                          // height: 340,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Color(0x29000000)))),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                      .productDescription,
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: .12,
                                    fontFamily: 'Playfair',
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xDE000000),
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Container(
                                  //   margin: EdgeInsets.only(top: 6),
                                  //   width: 6,
                                  //   height: 6,
                                  //   decoration: BoxDecoration(
                                  //       color: Color(0xFF000000),
                                  //       shape: BoxShape.circle),
                                  // ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Expanded(
                                    child: Text(
                                        _storeProvider
                                                    .productDetails!['product']
                                                ['product_description'] ??
                                            "",
                                        //product_description
                                        // 'Vaseline Jelly Baby locks moisture to help treat\nand prevent chafed skin.',
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: .25,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xDE000000),
                                        )),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 12,
                              ),
                              if (_storeProvider.productDetails!['product']
                                      ['brand_name'] !=
                                  "")
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(AppLocalizations.of(context)!.brand,
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: .46,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0x99000000),
                                        )),
                                    Spacer(),
                                    Text(
                                        _storeProvider
                                                    .productDetails!['product']
                                                ['brand_name'] ??
                                            "",
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: .46,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xDE000000),
                                        )),
                                  ],
                                ),
                              //  const  SizedBox(height: 8,),
                              if (_storeProvider.productDetails!['product']
                                      ['brand_name'] !=
                                  0)
                                Divider(
                                  color: Color(0x1F000000),
                                  thickness: 1,
                                ),
                              // const  SizedBox(height: 8,),
                              if (_storeProvider.productDetails!['product']
                                      ['brand_name'] !=
                                  0)
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(AppLocalizations.of(context)!.weight,
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: .46,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0x99000000),
                                        )),
                                    Spacer(),
                                    Text(
                                        Localizations.localeOf(context)
                                                    .languageCode ==
                                                'ar'
                                            ? '${(_storeProvider.productDetails!['product']['weight'])} جم ' ??
                                                ""
                                            : '${(_storeProvider.productDetails!['product']['weight'])} gm' ??
                                                "",
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: .46,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xDE000000),
                                        )),
                                  ],
                                ),
                              // const  SizedBox(height: 8,),
                              if (_storeProvider.productDetails!['product']
                                      ['length'] !=
                                  "")
                                Divider(
                                  color: Color(0x1F000000),
                                  thickness: 1,
                                ),
                              // const  SizedBox(height: 8,),
                              if (_storeProvider.productDetails!['product']
                                      ['length'] !=
                                  "")
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        AppLocalizations.of(context)!
                                            .dimensions,
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: .46,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0x99000000),
                                        )),
                                    Spacer(),
                                    Text(
                                        '${_storeProvider.productDetails!['product']['length']} '
                                        'x ${_storeProvider.productDetails!['product']['width']} '
                                        'x ${_storeProvider.productDetails!['product']['height']}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: .46,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xDE000000),
                                        )),
                                  ],
                                ),
                              //  const  SizedBox(height: 8,),
                              if (_storeProvider.productDetails!['product']
                                      ['sku'] !=
                                  "")
                                Divider(
                                  color: Color(0x1F000000),
                                  thickness: 1,
                                ),
                              //  const  SizedBox(height: 8,),
                              if (_storeProvider.productDetails!['product']
                                      ['sku'] !=
                                  "")
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        AppLocalizations.of(context)!.sKU, //sku
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: .46,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0x99000000),
                                        )),
                                    Spacer(),
                                    Text(
                                        '${_storeProvider.productDetails!['product']['sku']}' ??
                                            "",
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: .46,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xDE000000),
                                        )),
                                  ],
                                ),
                              const SizedBox(
                                height: 12,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      ProductInformationStoreScreen.routeName);
                                },
                                child: Container(
                                  // height: 50,
                                  decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(8),
                                      // border: Border(bottom: BorderSide(color: Color(0x1F000000))),
                                      color: const Color(0xFFFFFFFF)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    AppLocalizations.of(context)!.seeMore,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: const Color(0xFF037979),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 8,
                          color: const Color(0xFFF2F2F2),
                        ),

                        if (_storeProvider.productDetailRatings.isNotEmpty)
                          Container(
                            // height: 156,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Color(0x29000000)))),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 23,
                                ),
                                Text(AppLocalizations.of(context)!.reviews,
                                    style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: .12,
                                      fontFamily: 'Playfair',
                                      fontWeight: FontWeight.w800,
                                      color: const Color(0xDE000000),
                                    )),
                                const SizedBox(
                                  height: 9,
                                ),
                                RatingBar(
                                  ratingWidget: RatingWidget(
                                    full: Icon(
                                      Icons.star,
                                      color: const Color(0xFFE6B800),
                                    ),
                                    empty: Icon(
                                      Icons.star_border,
                                      color: const Color(0xFFE6B800),
                                    ),
                                    half: Icon(
                                      Icons.star_half,
                                      color: const Color(0xFFE6B800),
                                    ),
                                  ),
                                  unratedColor: const Color(0xFFF2781F),
                                  glowColor: const Color(0xFFFFFFFF),
                                  onRatingUpdate: (val) {},
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  tapOnlyMode: false,
                                  initialRating: double.parse(
                                          "${_storeProvider.productDetails!['product']['product_rate']}") ??
                                      0, //.toDouble()
                                  ignoreGestures: true,
                                  updateOnDrag: false,
                                  direction: Axis.horizontal,
                                ),
                                // const SizedBox(
                                //   height: 4,
                                // ),
                                // Text('4.5 star form (120 reviews)',
                                //     style: TextStyle(
                                //       fontSize: 12,
                                //       letterSpacing: .4,
                                //       fontFamily: 'Nunito',
                                //       fontWeight: FontWeight.w600,
                                //       color: const Color(0xBD000000),
                                //     )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Selector<StoreProvider, List<RatingModel>>(
                                  selector: (_, storeProvider) =>
                                      storeProvider.productDetailRatings,
                                  builder: (_, productDetailRatings, __) =>
                                      ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (c, i) => productDetailRatings
                                                    .length ==
                                                0 &&
                                            _isLoading
                                        ? Container()
                                        : ReviewItem(
                                            isLast:
                                                productDetailRatings.length >= 2
                                                    ? i == 1
                                                        ? true
                                                        : false
                                                    : i == 0
                                                        ? true
                                                        : false,
                                            isProductDetail: true,
                                            photo:
                                                productDetailRatings[i].photo,
                                            comment:
                                                productDetailRatings[i].comment,
                                            createdAt: productDetailRatings[i]
                                                .createdAt,
                                            //rate: productDetailRatings[i].rate.toDouble(),
                                            username: productDetailRatings[i]
                                                .username,
                                          ),
                                    separatorBuilder: (_, __) => const SizedBox(
                                      height: 10,
                                    ),
                                    itemCount:
                                        productDetailRatings.length == 0 &&
                                                _isLoading
                                            ? 1
                                            : productDetailRatings.length >= 2
                                                ? 2
                                                : productDetailRatings.length,
                                  ),
                                ),
                                if (_storeProvider
                                        .productDetailRatings.length >=
                                    3)
                                  const SizedBox(
                                    height: 5,
                                  ),
                                //  Divider(color: Color(0x1F000000),height: 1,thickness: 1,),
                                if (_storeProvider
                                        .productDetailRatings.length >=
                                    3)
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        ProductRatingScreen.routeName,
                                        arguments: {
                                          "product_id":
                                              "${_storeProvider.productDetails!['product']['product_id']}"
                                        },
                                      ).then((value) =>
                                          _storeProvider.clearProductRating());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFFFFFFF)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        AppLocalizations.of(context)!.seeMore,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: const Color(0xFF037979),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ),
                                  ),
                                if (_storeProvider
                                        .productDetailRatings.length >=
                                    3)
                                  const SizedBox(
                                    height: 15,
                                  ),
                                if (_storeProvider
                                        .productDetailRatings.length <=
                                    3)
                                  const SizedBox(
                                    height: 5,
                                  ),
                              ],
                            ),
                          ),
                        if (_storeProvider.relatedProducts.length != 0)
                          Container(
                            height: 14.5,
                            color: const Color(0xFFF2F2F2),
                          ),

                        ///

                        // const  SizedBox(height: 14.5,),
                        if (_storeProvider.relatedProducts.length != 0)
                          Container(
                            color: Color(0xFFF2F2F2),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // color: Color(0xFFF2F2F2),
                                  //margin: Ed,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .similarProducts, //
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: const Color(0xDE000000),
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Playfair',
                                        letterSpacing: .12),
                                  ),
                                ),
                                // Spacer(),
                                // InkWell(
                                //   onTap: () {
                                //     // Navigator.of(context).pushNamed(ClinicsScreen.routeName);
                                //   },
                                //   child: const Text(
                                //     'see all',
                                //     style: TextStyle(
                                //         fontSize: 12,
                                //         color: const Color(0xDE000000),
                                //         fontWeight: FontWeight.w600,
                                //         fontFamily: 'Playfair',
                                //         letterSpacing: .09),
                                //   ),
                                // ),
                                // const SizedBox(
                                //   width: 16,
                                // ),
                              ],
                            ),
                          ),
                        if (_storeProvider.relatedProducts.length != 0)
                          Container(
                            height: 6,
                            color: const Color(0xFFF2F2F2),
                          ),
                        if (_storeProvider.relatedProducts.length != 0)
                          Consumer<StoreProvider>(
                            builder: (_, relatedProducts, __) => Container(
                              height: 181,
                              color: const Color(0xFFF2F2F2),
                              // margin: EdgeInsets.only(
                              //  // left:  Localizations.localeOf(context).languageCode ==  'en'?16:16,
                              //  // right: Localizations.localeOf(context).languageCode ==  'en'?16:16,
                              // ),
                              child: ListView.separated(
                                separatorBuilder: (_, __) => const SizedBox(
                                  width: 8,
                                ),
                                shrinkWrap: true,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (c, i) => relatedProducts
                                                .relatedProducts.length ==
                                            0 &&
                                        _isLoading
                                    ? StoreShimmer()
                                    : InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                                  ProductDetailScreen.routeName,
                                                  arguments: {
                                                'id': relatedProducts
                                                    .relatedProducts[i].id,
                                              });
                                        },
                                        child: StoreMainItem(
                                          addToCartTap: () async {
                                            if (_loading || _loading1) {
                                              //do nothing
                                            } else {
                                              setState(() {
                                                _cartIndex1 = i;
                                                _storeRelatedProducts =
                                                    relatedProducts
                                                        .relatedProducts[i].id;
                                              });
                                              if (_authReference.isAuth) {
                                                await _addToCartForRelatedProducts(
                                                    _storeRelatedProducts,
                                                    "plus",
                                                    "");
                                                _cartIndex1 = null;

                                                // comment for now and i will un comment this later

                                                if (_storeProvider
                                                            .gifts.length !=
                                                        0 &&
                                                    _storeProvider.hadGift == 0)
                                                  await showMaterialModalBottomSheet(
                                                      expand: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      elevation: 1,
                                                      barrierColor:
                                                          Color(0x52000000),
                                                      context: context,
                                                      builder: (_) =>
                                                          GiftBottomSheet(
                                                            id: relatedProducts
                                                                .relatedProducts[
                                                                    i]
                                                                .id,
                                                          ));
                                              } else {
                                                final xx =
                                                    (await showConfirmDialog(
                                                            context,
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .login,
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .loginText2,
                                                            [
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .cancel,
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .ok
                                                            ])) ??
                                                        false;
                                                if (xx) {
                                                  Navigator.of(context)
                                                      .pushNamed(LoginScreen
                                                          .routeName);
                                                } else {}
                                              }
                                            }
                                          },
                                          minus: _loading1 && _minusIndex1 == i,
                                          plus: _loading1 && _plusIndex1 == i,
                                          cart: _loading1 && _cartIndex1 == i,
                                          minusTap: () async {
                                            if (_loading || _loading1) {
                                              // do nothing
                                            } else {
                                              setState(() {
                                                _minusIndex1 = i;
                                                _storeRelatedProducts =
                                                    relatedProducts
                                                        .relatedProducts[i].id;
                                              });
                                              if (_authReference.isAuth) {
                                                await _addToCartForRelatedProducts(
                                                    _storeRelatedProducts,
                                                    "minus",
                                                    "");
                                                _minusIndex1 = null;

                                                // comment for now and i will un comment this later

                                                if (_storeProvider
                                                            .gifts.length !=
                                                        0 &&
                                                    _storeProvider.hadGift == 0)
                                                  await showMaterialModalBottomSheet(
                                                      expand: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      elevation: 1,
                                                      barrierColor:
                                                          Color(0x52000000),
                                                      context: context,
                                                      builder: (_) =>
                                                          GiftBottomSheet(
                                                            id: relatedProducts
                                                                .relatedProducts[
                                                                    i]
                                                                .id,
                                                          ));
                                              } else {
                                                final xx =
                                                    (await showConfirmDialog(
                                                            context,
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .login,
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .loginText2,
                                                            [
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .cancel,
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .ok
                                                            ])) ??
                                                        false;
                                                if (xx) {
                                                  Navigator.of(context)
                                                      .pushNamed(LoginScreen
                                                          .routeName);
                                                } else {}
                                              }
                                            }
                                          },
                                          plusTap: () async {
                                            if (_loading) {
                                              // do nothing
                                            } else {
                                              if (_loading1) {
                                                // do nothing
                                              } else {
                                                setState(() {
                                                  _plusIndex1 = i;
                                                  _storeRelatedProducts =
                                                      relatedProducts
                                                          .relatedProducts[i]
                                                          .id;
                                                });
                                                if (_authReference.isAuth) {
                                                  await _addToCartForRelatedProducts(
                                                      _storeRelatedProducts,
                                                      "plus",
                                                      "");
                                                  _plusIndex1 = null;

                                                  // comment for now and i will un comment this later

                                                  if (_storeProvider
                                                              .gifts.length !=
                                                          0 &&
                                                      _storeProvider.hadGift ==
                                                          0)
                                                    await showMaterialModalBottomSheet(
                                                        expand: true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        elevation: 1,
                                                        barrierColor:
                                                            Color(0x52000000),
                                                        context: context,
                                                        builder: (_) =>
                                                            GiftBottomSheet(
                                                              id: relatedProducts
                                                                  .relatedProducts[
                                                                      i]
                                                                  .id,
                                                            ));
                                                } else {
                                                  final xx = (await showConfirmDialog(
                                                          context,
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .login,
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .loginText2,
                                                          [
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .cancel,
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .ok
                                                          ])) ??
                                                      false;
                                                  if (xx) {
                                                    Navigator.of(context)
                                                        .pushNamed(LoginScreen
                                                            .routeName);
                                                  } else {}
                                                }
                                              }
                                            }
                                          },
                                          //
                                          likeTap: () async {
                                            if (_authReference.isAuth) {
                                              setState(() {
                                                _relatedProductDetail =
                                                    relatedProducts
                                                        .relatedProducts[i].id;
                                              });
                                              await _switchLikeForRelatedProducts(
                                                  _relatedProductDetail);

                                              print('00');
                                            } else {
                                              final xx =
                                                  (await showConfirmDialog(
                                                          context,
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .login,
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .loginText2,
                                                          [
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .cancel,
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .ok
                                                          ])) ??
                                                      false;
                                              if (xx) {
                                                Navigator.of(context).pushNamed(
                                                    LoginScreen.routeName);
                                              } else {}
                                            }
                                          },
                                          hasTax: relatedProducts
                                              .relatedProducts[i].hasTax,
                                          isLiked: relatedProducts
                                              .relatedProducts[i].isLiked,
                                          cartCount: relatedProducts
                                              .relatedProducts[i].cartCount,
                                          productRate: double.parse(
                                              relatedProducts.relatedProducts[i]
                                                  .productRate
                                                  .toString()),
                                          offerPrice: relatedProducts
                                              .relatedProducts[i].offerPrice,
                                          clientPrice: relatedProducts
                                              .relatedProducts[i].clientPrice,
                                          photo: relatedProducts
                                              .relatedProducts[i].photo,
                                          title: relatedProducts
                                              .relatedProducts[i].title,
                                          offerType: relatedProducts
                                              .relatedProducts[i].offerType,
                                        ),
                                      ),
                                // separatorBuilder: (_,__)=>Divider(color: Color(0x1F000000),),
                                itemCount: relatedProducts
                                                .relatedProducts.length ==
                                            0 &&
                                        _isLoading
                                    ? 2
                                    : relatedProducts.relatedProducts.length,
                              ),
                            ),
                          ),
                        Container(
                          height: 85,
                          color: const Color(0xFFF2F2F2),
                        ),

                        ///
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    color: Colors.white,
                    height: 72,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: InkWell(
                      onTap: () {},
                      child: _storeProvider.productDetails!['product']
                                  ['cart_count'] !=
                              0
                          ? Container(
                              height: 48,
                              // width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                // color: Color(0xFF037979),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .requiredQuantity,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () async {
                                      if (_loading || _loading1) {
                                      } else {
                                        setState(() {
                                          // _minusIndex=i;
                                          _storeProductDetails = _storeProvider
                                              .productDetails!['product']['id'];
                                        });
                                        if (_authReference.isAuth) {
                                          await _addToCartForProductDetails(
                                              _storeProductDetails,
                                              "minus",
                                              "productDetails");
                                          //_minusIndex=null;

                                          // comment for now and i will un comment this later

                                          if (_storeProvider.gifts.length !=
                                                  0 &&
                                              _storeProvider.hadGift == 0)
                                            await showMaterialModalBottomSheet(
                                                expand: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 1,
                                                barrierColor: Color(0x52000000),
                                                context: context,
                                                builder: (_) => GiftBottomSheet(
                                                      id: _storeProvider
                                                              .productDetails![
                                                          'product']['id'],
                                                    ));
                                        } else {
                                          final xx = (await showConfirmDialog(
                                                  context,
                                                  AppLocalizations.of(context)!
                                                      .login,
                                                  AppLocalizations.of(context)!
                                                      .loginText2,
                                                  [
                                                    AppLocalizations.of(
                                                            context)!
                                                        .cancel,
                                                    AppLocalizations.of(
                                                            context)!
                                                        .ok
                                                  ])) ??
                                              false;
                                          if (xx) {
                                            Navigator.of(context).pushNamed(
                                                LoginScreen.routeName);
                                          } else {}
                                        }
                                      }
                                    },
                                    child: Image.asset(
                                      Localizations.localeOf(context)
                                                  .languageCode ==
                                              'ar'
                                          ? 'assets/images/minus-ar.png'
                                          : 'assets/images/minus.png',
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 54,
                                    // padding: EdgeInsets.symmetric(horizontal: 23),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: const Color(0x1F000000)),
                                        color: const Color(0XFFFFFFFF)),
                                    child: _loading
                                        ? CustomLoading(null, 25, 25)
                                        : Text(
                                            '${_storeProvider.productDetails!['product']['cart_count']}',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xDE000000),
                                            )),
                                  ),
                                  InkWell(
                                      onTap: () async {
                                        if (_loading || _loading1) {
                                        } else {
                                          setState(() {
                                            // _plusIndex=i;
                                            _storeProductDetails =
                                                _storeProvider.productDetails![
                                                    'product']['id'];
                                          });
                                          if (_authReference.isAuth) {
                                            await _addToCartForProductDetails(
                                                _storeProductDetails,
                                                "plus",
                                                "productDetails");
                                            // _plusIndex=null;

                                            // comment for now and i will un comment this later

                                            if (_storeProvider.gifts.length !=
                                                    0 &&
                                                _storeProvider.hadGift == 0)
                                              await showMaterialModalBottomSheet(
                                                  expand: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  elevation: 1,
                                                  barrierColor:
                                                      Color(0x52000000),
                                                  context: context,
                                                  builder: (_) =>
                                                      GiftBottomSheet(
                                                        id: _storeProvider
                                                                .productDetails![
                                                            'product']['id'],
                                                      ));
                                          } else {
                                            final xx = (await showConfirmDialog(
                                                    context,
                                                    AppLocalizations.of(
                                                            context)!
                                                        .login,
                                                    AppLocalizations.of(
                                                            context)!
                                                        .loginText2,
                                                    [
                                                      AppLocalizations.of(
                                                              context)!
                                                          .cancel,
                                                      AppLocalizations.of(
                                                              context)!
                                                          .ok
                                                    ])) ??
                                                false;
                                            if (xx) {
                                              Navigator.of(context).pushNamed(
                                                  LoginScreen.routeName);
                                            } else {}
                                          }
                                        }
                                      },
                                      child: Image.asset(
                                        Localizations.localeOf(context)
                                                    .languageCode ==
                                                'ar'
                                            ? 'assets/images/plus-ar.png'
                                            : 'assets/images/plus.png',
                                        height: 40,
                                        fit: BoxFit.cover,
                                      )),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                ],
                              ),
                            )
                          : InkWell(
                              onTap: () async {
                                if (_loading || _loading1) {
                                } else {
                                  setState(() {
                                    _storeProductDetails = _storeProvider
                                        .productDetails!['product']['id'];
                                  });
                                  if (_authReference.isAuth) {
                                    await _addToCartForProductDetails(
                                        _storeProductDetails,
                                        "plus",
                                        "productDetails");
                                    // _cartIndex=null;

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
                                                id: widget.product!.id!,
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
                                          .pushNamed(LoginScreen.routeName);
                                    } else {}
                                  }
                                }
                              },
                              child: Container(
                                height: 48,
                                // width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Color(0xFF037979),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: _loading
                                    ? CustomLoading(null, 30, 30)
                                    : Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            MyCustomIcons.bag,
                                            color: Color(0xFFFFFFFF),
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .addToCart,
                                            style: TextStyle(
                                              fontSize: 14,
                                              letterSpacing: .42,
                                              color: Color(0xFFFFFFFF),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Nunito',
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
