import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:round/src/helpers/my_flutter_app_icons.dart';
import 'package:round/src/mixin/alerts_mixin.dart';
import 'package:round/src/mixin/validation_mixin.dart';
import 'package:round/src/models/global/http_exception.dart';
import 'package:round/src/providers/auth/auth.dart';
import 'package:round/src/widgets/items/auth/social_login_item.dart';

import '../../../../../src/helpers/app_translations.dart';
import '../../../../../src/screens/store/store_main_screen.dart';

class SocialLogin extends StatefulWidget {
  const SocialLogin({super.key});

  @override
  State<SocialLogin> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin>
    with AlertsMixin, ValidationMixin {
  Future<void> googleLogin() async {
    EasyLoading.instance.dismissOnTap = false;
    EasyLoading.show();
    try {
      await Provider.of<Auth>(context, listen: false).googleLogin();
      EasyLoading.dismiss();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(StoreMainScreen.routeName, (route) => false);
    } on HttpException catch (error) {
      EasyLoading.dismiss();
      if (error.statusCode == 7000) {
        showErrorDialog(
            context,
            AppLocalizations.of(context)!.userCancelledLogin,
            Duration(milliseconds: 1500));
      } else
        showErrorDialog(
            context, error.toString(), Duration(milliseconds: 1500));
    } catch (e) {
      EasyLoading.dismiss();
      // showErrorDialog(context, e.toString(), Duration(milliseconds: 1500));
      throw e;
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> facebookLogin() async {
    EasyLoading.instance.dismissOnTap = false;
    EasyLoading.show();
    try {
      final response =
          await Provider.of<Auth>(context, listen: false).facebookLogin();
      EasyLoading.dismiss();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(StoreMainScreen.routeName, (route) => false);
    } on HttpException catch (error) {
      EasyLoading.dismiss();
      if (error.statusCode == 7001) {
        showErrorDialog(context, AppLocalizations.of(context)!.errorWhileLogin);
      } else
        showErrorDialog(
            context,
            error.statusCode == 7000
                ? AppLocalizations.of(context)!.userCancelledLogin
                : error.toString(),
            Duration(milliseconds: 1500));
    } catch (e) {
      EasyLoading.dismiss();
      // showErrorDialog(context, e.toString(), Duration(milliseconds: 1500));
      throw e;
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> twitterLogin() async {
    EasyLoading.instance.dismissOnTap = false;
    EasyLoading.show();
    try {
      final response =
          await Provider.of<Auth>(context, listen: false).twitterLogin();
      EasyLoading.dismiss();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(StoreMainScreen.routeName, (route) => false);
    } on HttpException catch (error) {
      EasyLoading.dismiss();
      if (error.statusCode == 7001) {
        showErrorDialog(context, AppLocalizations.of(context)!.errorWhileLogin);
      } else
        showErrorDialog(
            context,
            error.statusCode == 7000
                ? AppLocalizations.of(context)!.userCancelledLogin
                : error.toString(),
            Duration(milliseconds: 1500));
    } catch (e) {
      EasyLoading.dismiss();
      // showErrorDialog(context, e.toString(), Duration(milliseconds: 1500));
      throw e;
    } finally {
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            '${Localizations.localeOf(context).languageCode == 'en' ? 'Or' : 'أو'}',
            style: TextStyle(
              fontSize: 14,
              letterSpacing: .25,
              color: const Color(0xDE000000),
              fontWeight: FontWeight.w600,
              fontFamily: 'Nunito',
            ),
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        InkWell(
          onTap: facebookLogin,
          child: SocialLoginItem(
            child: const Icon(
              MyCustomIcons.face,
              size: 19,
              color: const Color(0xFF1976D2),
            ),
            title: "${AppLocalizations.of(context)!.continueWithFacebook}",
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: googleLogin,
          child: SocialLoginItem(
            child: Container(
                width: 20,
                height: 20,
                child: Image.asset('assets/images/gmail.png')),
            title: "${AppLocalizations.of(context)!.continueWithGoogle}",
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: twitterLogin,
          child: SocialLoginItem(
            child: Container(
                width: 20,
                height: 20,
                child: Image.asset('assets/images/twitter.png')),
            title: "${AppLocalizations.of(context)!.continueWithTwitter}",
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
