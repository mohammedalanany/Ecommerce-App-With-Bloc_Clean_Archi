import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/features/auth_feature/check_user/presentation/check-user_screen.dart';
import 'package:round/features/store/presentation/screens/bloc/main_home_cubit/main_home_cubit.dart';
import 'package:round/features/store/presentation/screens/bloc/main_home_cubit/main_home_state.dart';
import 'package:round/src/helpers/app_translations.dart';
import 'package:round/src/helpers/my_flutter_app_icons.dart';
import 'package:round/src/mixin/alerts_mixin.dart';
import 'package:round/src/screens/store/cart_screen.dart';

import '../../../../../../core/dependency_injection/locator_service.dart';

class CartCountWidget extends StatefulWidget {
  const CartCountWidget({super.key});

  @override
  State<CartCountWidget> createState() => _CartCountWidgetState();
}

class _CartCountWidgetState extends State<CartCountWidget> with AlertsMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainHomeCubit, MainHomeState>(
      builder: (context, state) {
        if (state is HomeMainLoaded) {
          return GestureDetector(
            onTap: () async {
              if (LocatorService.authProvider.isAuth) {
                Navigator.of(context).pushNamed(CartScreen.routeName);
                //.then((value) => _fetchCartCountForPurchase());
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
                  Navigator.of(context).pushNamed(CheckUserScreen.routeName);
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
                  if (state.mainHomeModel.cartCount != 0)
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
                          state.mainHomeModel.cartCount.toString(),
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
          );
        } else if (state is HomeMainLoading) {
          return SizedBox();
        }
        return SizedBox();
      },
    );
  }
}
