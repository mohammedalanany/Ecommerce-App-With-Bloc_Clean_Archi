import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/features/store/presentation/screens/bloc/main_home_cubit/main_home_cubit.dart';
import 'package:round/features/store/presentation/screens/bloc/main_home_cubit/main_home_state.dart';
import 'package:round/src/helpers/app_translations.dart';
import 'package:round/src/helpers/my_flutter_app_icons.dart';
import 'package:round/src/screens/store/product_search_store_screen.dart';
import 'package:round/src/widgets/items/store/store_categories_item.dart';
import 'package:round/src/widgets/shimmers/category_shimmer.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainHomeCubit, MainHomeState>(
      builder: (context, state) {
        if (state is HomeMainLoaded) {
          return Container(
            height: 108,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (c, i) => i == 0
                  ? InkWell(
                      onTap: () {
                        //  LocatorService.searchProductsCubit
                        //    .searchProductsParamsModel.category_id = '0';
                        final storeMainCubit = context.read<MainHomeCubit>();

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: storeMainCubit,
                              child: ProductSearchStoreScreen(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 108,
                        width: 108,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: const Color(0xFFE3E6E6), width: 1),
                            color: const Color(0xFFFFFFFF)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 11,
                            ),
                            Icon(
                              MyCustomIcons.all,
                              color: Color(0xFF037979),
                              size: 22,
                            ),
                            Spacer(),
                            //const SizedBox(height: 23,),
                            Text(
                                AppLocalizations.of(context)!.allSections ?? "",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xDE000000),
                                )),
                          ],
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        //    LocatorService.searchProductsCubit
                        //       .searchProductsParamsModel.category_id =
                        state.mainHomeModel.storeCategories![i - 1].id
                            .toString();
                        final storeMainCubit = context.read<MainHomeCubit>();

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: storeMainCubit,
                              child: ProductSearchStoreScreen(),
                            ),
                          ),
                        );
                      },
                      child: StoreCategoriesItem(
                        photo:
                            state.mainHomeModel.storeCategories![i - 1].photo,
                        categoryName:
                            state.mainHomeModel.storeCategories![i - 1].name,
                      ),
                    ),
              separatorBuilder: (_, __) => SizedBox(
                width: 8,
              ),
              itemCount: state.mainHomeModel.storeCategories!.length == 0
                  ? 5
                  : state.mainHomeModel.storeCategories!.length + 1,
            ),
          );
        } else if (state is HomeMainLoading) {
          return Container(
              height: 108,
              child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (_, __) => SizedBox(
                        width: 8,
                      ),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (c, i) => CategoryShimmer(
                        selected: i,
                        name:
                            Localizations.localeOf(context).languageCode == 'ar'
                                ? i == 0
                                    ? "كل\nالاقسام"
                                    : i == 1
                                        ? "العنايه\nبالشعر"
                                        : i == 2
                                            ? "العنايه\بالجسم"
                                            : i == 3
                                                ? "العنايه\بالوجه"
                                                : "العنايه\بالمرأة"
                                : i == 0
                                    ? "All\nSections"
                                    : i == 1
                                        ? "HAIR\nCARE"
                                        : i == 2
                                            ? "MEDICAL\nEQUIPMENTS"
                                            : i == 3
                                                ? "Skin\ncare"
                                                : "FACE\nCARE",
                      )));
        }
        return SizedBox();
      },
    );
  }
}
