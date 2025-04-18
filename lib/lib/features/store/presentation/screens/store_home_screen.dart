import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/features/store/presentation/screens/bloc/main_home_cubit/main_home_cubit.dart';
import 'package:round/features/store/presentation/screens/widgets/cart_count_widget.dart';
import 'package:round/features/store/presentation/screens/widgets/category_widget.dart';
import 'package:round/features/store/presentation/screens/widgets/default_address_widget.dart';
import 'package:round/features/store/presentation/screens/widgets/recommend_offers_products_widgets.dart';
import 'package:round/features/store/presentation/screens/widgets/slider_widgets.dart';
import 'package:round/src/helpers/app_translations.dart';
import 'package:round/src/helpers/my_flutter_app_icons.dart';
import 'package:round/src/mixin/alerts_mixin.dart';
import 'package:round/src/screens/store/product_search_store_screen.dart';

class StoreHomeScreen extends StatefulWidget {
  static const routeName = '/store-home-screen';
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreHomeScreen> with AlertsMixin {
  @override
  Widget build(BuildContext context) {
    print('StoreHomeScreen');
    return BlocProvider(
      create: (context) => MainHomeCubit()..fetchMainStoreData(),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Container(
              height: 17,
              width: 74,
              child: Image.asset(
                'assets/images/Logo200.png',
              ),
            ),
            actions: [
              CartCountWidget(),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        ProductSearchStoreScreen.routeName,
                        arguments: {
                          'categoryId': 0,
                        });
                    /*
                  .then((value) => _storeProvider.clearStoreSearch())
                   */
                  },
                  child: Icon(
                    MyCustomIcons.search,
                    color: const Color(0xFF000000),
                    size: 17,
                  )),
              const SizedBox(
                width: 16,
              ),
            ],
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(44.0),
                child: DefaultAddressWidget()),
          ),
          backgroundColor: Color(0xFFF2F2F2),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 16,
              )),
              SliverToBoxAdapter(
                child: SliderWidgets(),
              ),
              SliverToBoxAdapter(
                  child: const SizedBox(
                height: 16,
              )),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppLocalizations.of(context)!.storeCategories,
                    style: TextStyle(
                        fontSize: 16,
                        color: const Color(0xDE000000),
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Playfair',
                        letterSpacing: .12),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: const SizedBox(
                height: 8,
              )),
              SliverToBoxAdapter(child: CategoryWidget()),
              SliverToBoxAdapter(
                  child: const SizedBox(
                height: 16,
              )),
              SliverToBoxAdapter(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      //color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        AppLocalizations.of(context)!.recommendedProducts, //
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
                              'is_recommended': "${1}",
                            });
                        /*
                            .then((value) => _storeProvider.clearStoreSearch())
                             */
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
              ),
              SliverToBoxAdapter(
                  child: Container(
                // color: Colors.white,
                height: 6,
              )),
              SliverToBoxAdapter(
                child: RecommendOffersProductsWidget(),
              ),
            ],
            // ),
          )),
    );
  }
}
