import 'package:flutter/material.dart';
import 'package:round/src/helpers/app_translations.dart';
import 'package:round/src/screens/store/store_main_screen.dart';

import '../../../../../core/theme/app_colors.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border(
            bottom: BorderSide(color: const Color(0x29000000), width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 21,
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    StoreMainScreen.routeName, (_) => false);
              },
              child: Icon(
                Icons.clear,
                color: const Color(0xFF000000),
              )),
          const SizedBox(
            height: 29,
          ),
          Text(
            AppLocalizations.of(context)!.loginOrSignup,
            style: TextStyle(
              fontSize: 24,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w800,
              fontFamily: 'Playfair',
            ),
          ),
          const SizedBox(
            height: 17,
          ),
        ],
      ),
    );
  }
}
