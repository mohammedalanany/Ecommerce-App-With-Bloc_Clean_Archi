import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:round/common/bloc/button_state.dart';
import 'package:round/common/bloc/button_state_cubit.dart';
import 'package:round/core/dependency_injection/locator_service.dart';
import 'package:round/features/auth_feature/check_user/presentation/check-user_screen.dart';
import 'package:round/features/auth_feature/profile/presentation/bloc/profile_cubit.dart';
import 'package:round/features/auth_feature/profile/presentation/bloc/profile_state.dart';
import 'package:round/src/helpers/app_translations.dart';
import 'package:round/src/helpers/my_flutter_app_icons.dart';
import 'package:round/src/mixin/alerts_mixin.dart';
import 'package:round/src/mixin/navigation_mixin.dart';
import 'package:round/src/models/global/http_exception.dart';
import 'package:round/src/providers/auth/auth.dart';
import 'package:round/src/providers/orders/orders.dart';
import 'package:round/src/screens/auth/store_setting_screen/store_setting_screen.dart';
import 'package:round/src/screens/global/about_screen.dart';
import 'package:round/src/screens/global/contact_us_screen.dart';
import 'package:round/src/screens/global/delivery_policy_screen.dart';
import 'package:round/src/screens/global/our_policy_screen.dart';
import 'package:round/src/screens/global/return_policy_screen.dart';
import 'package:round/src/screens/global/terms_screen.dart';
import 'package:round/src/screens/store/my_wallet_screen.dart';
import 'package:round/src/screens/timeout_splash_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile-screen';

  @override
  _StoreMoreScreenState createState() => _StoreMoreScreenState();
}

class _StoreMoreScreenState extends State<ProfileScreen>
    with AlertsMixin, NavigationMixin {
  GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  bool _isLoading200 = false;
  Future<void> _getMyWallet() async {
    if (this.mounted) {
      setState(() {
        _isLoading200 = true;
      });
    }
    EasyLoading.show();
    try {
      await _ordersProvider.getMyWallet();
    } on HttpException catch (error) {
      if (error.statusCode == 401) {
        _authReference.logoutDone();
      } else {
        showErrorDialog(context, error.toString());
      }
    } catch (error) {
      throw error;
    } finally {
      if (this.mounted)
        setState(() {
          _isLoading200 = false;
        });
      EasyLoading.dismiss();
    }
  }

  late Auth _authReference;
  late OrdersProvider _ordersProvider;
  bool isFirst = false;
  @override
  void didChangeDependencies() {
    // if (_authReference.isAuth) _getMyWallet();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ProfileCubit()..getUser()),
            BlocProvider(create: (context) => ButtonStateCubit()),
          ],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileUnAuthenticated) {
                      return Column(
                        children: [
                          Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFF037979),
                              //border: Border(bottom: BorderSide(color:const Color(0x29000000),width: 1)),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(CheckUserScreen.routeName);
                              },
                              child: Container(
                                height: 37,
                                // width: 78,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(8),
                                ),

                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    AppLocalizations.of(context)!.login,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xDEFFFFFF),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (state is ProfileAuthenticated) {
                      return Container(
                        height: 190,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xFF037979),
                          //border: Border(bottom: BorderSide(color:const Color(0x29000000),width: 1)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 16,
                                ),
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //       color: Color(0x26000000),
                                      //       offset: Offset(0, 2.0),
                                      //       blurRadius: 2.0),
                                      // ],
                                      ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(7),
                                      child: state.user!.photo == null ||
                                              state.user!.photo == ''
                                          ? Image.network(
                                              'https://round.com/images/placeholder.png',
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              state.user!.photo!,
                                              fit: BoxFit.cover,
                                            )),
                                ),
                                Spacer(),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          StoreSettingScreen.routeName);
                                    },
                                    child: Icon(
                                      MyCustomIcons.my_account,
                                      color: Color(0xFFFFFFFF),
                                      size: 21,
                                    )),
                                const SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${state.user!.username ?? ''}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: .12,
                                        color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Playfair',
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                BlocListener<ButtonStateCubit, ButtonState>(
                                  listener: (context, state) async {
                                    if (state is ButtonFailureState) {
                                      print(state.errorMessage);
                                      var snackBar = SnackBar(
                                        content: Text(state.errorMessage),
                                        behavior: SnackBarBehavior.floating,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }

                                    if (state is ButtonSuccessState) {
                                      final statusCode = state.data.statusCode;
                                      print(statusCode);
                                      if (statusCode == 200) {
                                        LocatorService
                                            .navigationService.currentState!
                                            .pushNamedAndRemoveUntil(
                                                CheckUserScreen.routeName,
                                                (_) => false);
                                      }
                                    }
                                  },
                                  child: InkWell(
                                    child: Container(
                                      height: 37,
                                      // width: 78,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0x29FFFFFF)),
                                        color: Color(0xFF037979),
                                        borderRadius: BorderRadius.circular(8),
                                      ),

                                      alignment: Alignment.center,
                                      child: Text(
                                        state.user != null
                                            ? AppLocalizations.of(context)!
                                                .logOut
                                            : AppLocalizations.of(context)!
                                                .login,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xDEFFFFFF),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ),
                                    onTap: () async {
                                      if (state.user != null) {
                                        final xx = (await showConfirmDialog(
                                                context,
                                                AppLocalizations.of(context)!
                                                    .logOut,
                                                AppLocalizations.of(context)!
                                                    .confirmLogoutText,
                                                [
                                                  AppLocalizations.of(context)!
                                                      .cancel,
                                                  AppLocalizations.of(context)!
                                                      .logOut
                                                ])) ??
                                            false;
                                        if (xx) {
                                          await context
                                              .read<ButtonStateCubit>()
                                              .execute(
                                                  useCase: LocatorService
                                                      .logOutUseCase);
                                          EasyLoading.dismiss();
                                        }
                                      } else
                                        Navigator.of(context).pushNamed(
                                            CheckUserScreen.routeName);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(MyWalletScreen.routeName)
                                    .then((value) =>
                                        _ordersProvider.clearMyBalance());
                              },
                              child: Container(
                                height: 48,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      MyCustomIcons.my_wallet,
                                      size: 19,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 24,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.myWallet1,
                                      style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: .1,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                    Spacer(),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is ProfileStateInitial) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xFF037979),
                        //border: Border(bottom: BorderSide(color:const Color(0x29000000),width: 1)),
                      ),
                    ); // Default UI
                  },
                ),
                PopupMenuButton(
                  offset: Localizations.localeOf(context).languageCode == 'ar'
                      ? Platform.isIOS
                          ? Offset(-40, -10)
                          : Offset(-40, 10)
                      : Platform.isIOS
                          ? Offset(40, -10)
                          : Offset(40, 10),
                  // offset: Localizations.localeOf(context).languageCode == 'ar' ?
                  // Offset(-40,20): Offset(40,20),
                  onSelected: (String val) {
                    Navigator.of(context).push(slideRightRouteBuilder(
                        context,
                        TimeoutSplashScreen(),
                        Duration(milliseconds: 600),
                        {'timeout': Duration(milliseconds: 2500), 'lang': val},
                        TimeoutSplashScreen.routeName));
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem<String>(
                      child: Text(
                        Localizations.localeOf(context).languageCode == 'ar'
                            ? 'العربيه'
                            : 'Arabic',
                        style: TextStyle(
                          color: Localizations.localeOf(context).languageCode ==
                                  'ar'
                              ? Color(0xFF000000).withOpacity(.3)
                              : Color(0xFF000000),
                          fontSize: 12,
                        ),
                        // AppLocalizations.of(context).arabic
                      ),
                      value: 'ar',
                      enabled:
                          Localizations.localeOf(context).languageCode != 'ar',
                    ),
                    PopupMenuItem<String>(
                      child: Text(
                        Localizations.localeOf(context).languageCode == 'ar'
                            ? 'الانجليزيه'
                            : 'English',
                        //  AppLocalizations.of(context).english
                        style: TextStyle(
                          color: Localizations.localeOf(context).languageCode ==
                                  'en'
                              ? Color(0xFF000000).withOpacity(.3)
                              : Color(0xFF000000),
                          fontSize: 12,
                        ),
                      ),
                      value: 'en',
                      enabled:
                          Localizations.localeOf(context).languageCode != 'en',
                    )
                  ],
                  child: Container(
                    height: 48,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(
                          MyCustomIcons.language,
                          size: 19,
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Text(
                          Localizations.localeOf(context).languageCode == 'ar'
                              ? 'اللغة'
                              : 'Language',
                          //AppLocalizations.of(context).language,
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: .1,
                            color: const Color(0xDE000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Nunito',
                          ),
                        ),
                        Spacer(),
                        Text(
                          Localizations.localeOf(context).languageCode == 'en'
                              ? Localizations.localeOf(context).languageCode ==
                                      'ar'
                                  ? 'الانجليزيه'
                                  : 'English'
                              // AppLocalizations.of(context).english
                              : Localizations.localeOf(context).languageCode ==
                                      'ar'
                                  ? 'العربيه'
                                  : 'Arabic',
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: .1,
                            color: const Color(0xFF037979),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Nunito',
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(ContactUsScreen.routeName);
                  },
                  child: Container(
                    height: 48,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(
                          MyCustomIcons.contact,
                          size: 19,
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Text(
                          AppLocalizations.of(context)!.contactUs,
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: .1,
                            color: const Color(0xDE000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  width: double.infinity,
                  color: Color(0x1F037979),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //About Us Terms & Conditions Our Policy Exchange and Return Policy Shipping Policy
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AboutScreen.routeName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.aboutUs,
                          style: TextStyle(
                              color: const Color(0xDE000000),
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              letterSpacing: .08),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(TermsScreen.routeName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.termsAndConditions,
                          style: TextStyle(
                              color: const Color(0xDE000000),
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              letterSpacing: .08),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(OurPolicyScreen.routeName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.ourPolicy,
                          style: TextStyle(
                              color: const Color(0xDE000000),
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              letterSpacing: .08),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ReturnPolicyScreen.routeName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.exchangeAndReturnPolicy,
                          style: TextStyle(
                              color: const Color(0xDE000000),
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              letterSpacing: .08),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(DeliveryPolicyScreen.routeName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.shippingPolicy,
                          style: TextStyle(
                              color: const Color(0xDE000000),
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              letterSpacing: .08),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
