import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/common/bloc/button_state_cubit.dart';
import 'package:round/features/auth_feature/check_user/data/models/check_user_request.dart';
import 'package:round/features/auth_feature/check_user/data/models/register_user_request.dart';
import 'package:round/features/auth_feature/check_user/presentation/widgets/register_form.dart';
import 'package:round/src/helpers/app_translations.dart';

class RegisterScreen extends StatefulWidget {
  final CheckUserReq checkUserReq;

  RegisterScreen({required this.checkUserReq, super.key});
  static const routeName = '/register-screen';
  @override
  _AddInfoScreenState createState() => _AddInfoScreenState();
}

class _AddInfoScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: const Color(0xFF000000),
          //size: 25,
        ),
        //leading:const Icon(Icons.arrow_back),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(64.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: const Color(0x29000000), width: 1)),
            ),
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 25),
            width: MediaQuery.of(context).size.width,
            child: Text(
              AppLocalizations.of(context)!.addYourInfo,
              style: TextStyle(
                fontSize: 24,
                color: const Color(0xFF037979),
                fontWeight: FontWeight.w800,
                fontFamily: 'Playfair',
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: RegisterForm(
          checkUserReq: widget.checkUserReq,
          registerUserReq: RegisterUserRequest(),
        ),
      ),
    );
  }
}
