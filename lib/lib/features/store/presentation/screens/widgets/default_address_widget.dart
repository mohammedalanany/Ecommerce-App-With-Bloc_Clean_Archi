import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/core/dependency_injection/locator_service.dart';
import 'package:round/features/auth_feature/check_user/presentation/check-user_screen.dart';
import 'package:round/features/store/presentation/screens/bloc/main_home_cubit/main_home_cubit.dart';
import 'package:round/features/store/presentation/screens/bloc/main_home_cubit/main_home_state.dart';
import 'package:round/src/helpers/app_translations.dart';
import 'package:round/src/helpers/my_flutter_app_icons.dart';
import 'package:round/src/mixin/alerts_mixin.dart';
import 'package:shimmer/shimmer.dart';

class DefaultAddressWidget extends StatefulWidget {
  const DefaultAddressWidget({super.key});

  @override
  State<DefaultAddressWidget> createState() => _DefaultAddressWidgetState();
}

class _DefaultAddressWidgetState extends State<DefaultAddressWidget>
    with AlertsMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainHomeCubit, MainHomeState>(
      builder: (context, state) {
        if (state is HomeMainLoaded) {
          return Container(
              height: 44,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                      color: const Color(0x1F000000),
                      width: 1,
                    ), // #29000000
                    bottom: BorderSide(
                      color: const Color(0x1F000000),
                      width: 1,
                    )),
              ),
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    MyCustomIcons.location_2,
                    color: const Color(0xFF000000),
                    size: 20,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  if (state.mainHomeModel.defaultAddresses.isEmpty)
                    Text(
                      AppLocalizations.of(context)!.chooseYourDefaultAddress,
                      //'13th, King Abdullah street',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Color(0xDE000000),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        letterSpacing: .25,
                      ),
                    ),
                  if (state.mainHomeModel.defaultAddresses.isNotEmpty)
                    Text(
                      state.mainHomeModel.defaultAddresses[0].street ?? "",
                      //'13th, King Abdullah street',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Color(0xDE000000),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        letterSpacing: .25,
                      ),
                    ),
                  Spacer(),
                  InkWell(
                    onTap: () async {
                      if (LocatorService.authProvider.isAuth) {
                        /*
                        Navigator.of(context)
                            .pushNamed(SelectAddressScreen.routeName)
                            .then((value) =>
                            _addressProvider.clearDeliveryAddress())
                            .then((value) => _fetchDefaultAddress());
                     */
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
                    child: Text(
                      AppLocalizations.of(context)!.change,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Color(0xFF037979),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ));
        } else if (state is HomeMainLoading) {
          return Container(
              height: 44,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                      color: const Color(0x1F000000),
                      width: 1,
                    ), // #29000000
                    bottom: BorderSide(
                      color: const Color(0x1F000000),
                      width: 1,
                    )),
              ),
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    MyCustomIcons.location_2,
                    color: const Color(0xFF000000),
                    size: 20,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    color: Color(0xFFFFFFFF),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      direction: ShimmerDirection.rtl,
                      enabled: true,
                      child: Container(
                        color: Color(0xFFFFFFFF),
                        width: MediaQuery.of(context).size.width * .25,
                        height: 12,
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xFFFFFFFF),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      direction: ShimmerDirection.rtl,
                      enabled: true,
                      child: Container(
                        color: Color(0xFFFFFFFF),
                        width: MediaQuery.of(context).size.width * .25,
                        height: 12,
                      ),
                    ),
                  ),
                  Spacer()
                ],
              ));
        }
        return SizedBox();
      },
    );
  }
}
