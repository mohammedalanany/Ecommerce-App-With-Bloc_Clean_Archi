import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/common/bloc/button_state_cubit.dart';
import 'package:round/core/dependency_injection/locator_service.dart';
import 'package:round/features/auth_feature/check_user/data/models/check_user_request.dart';
import 'package:round/features/auth_feature/check_user/data/models/login_user_request.dart';
import 'package:round/features/auth_feature/check_user/presentation/widgets/add_password_form.dart';
import 'package:round/src/helpers/app_translations.dart';
import 'package:round/src/screens/auth/reset_password_screens/reset_passward_screen.dart';

class AddPasswordScreen extends StatefulWidget {
  final CheckUserReq checkUserReq;
  AddPasswordScreen({required this.checkUserReq, super.key});
  static const routeName = '/add-password-screen';
  @override
  _EnterPasswordScreenState createState() => _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends State<AddPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
          //size: 25,
        ),
        // leading: Icon(Icons.arrow_back),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(64.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color(0x29000000), width: 1)),
            ),
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 25),
            width: MediaQuery.of(context).size.width,
            child: Text(
              AppLocalizations.of(context)!.enterYourPassword,
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF037979),
                fontWeight: FontWeight.w800,
                fontFamily: 'Playfair',
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddPasswordForm(
                checkUserReq: widget.checkUserReq,
                loginUserReq: LoginUserReq()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {
                  LocatorService.navigationService.currentState!
                      .pushNamed(ResetPasswordScreen.routeName);
                },
                child: Text(
                  AppLocalizations.of(context)!.forgetPassword,
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: .1,
                    decoration: TextDecoration.underline,
                    color: Color(0xDE000000),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
