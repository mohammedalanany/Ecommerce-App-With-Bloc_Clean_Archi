import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/common/bloc/button_state_cubit.dart';
import 'package:round/features/auth_feature/check_user/data/models/check_user_request.dart';
import 'package:round/features/auth_feature/check_user/presentation/widgets/check_user_form.dart';
import 'package:round/src/screens/auth/login_screens/widgets/login_header.dart';
import 'package:round/src/screens/auth/login_screens/widgets/social_login.dart';

import '../../../../../core/dependency_injection/locator_service.dart';

class CheckUserScreen extends StatefulWidget {
  static const routeName = '/check-user-screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<CheckUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeader(),
                SizedBox(
                  height: 16,
                ),
                CheckUserForm(
                  checkUserReq: CheckUserReq(),
                ),
                LocatorService.authProvider.socialActive == 1
                    ? SocialLogin()
                    : SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
