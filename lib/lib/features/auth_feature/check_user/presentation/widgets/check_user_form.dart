import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/common/bloc/button_state.dart';
import 'package:round/common/bloc/button_state_cubit.dart';
import 'package:round/common/widgets/button/custom_reactive_button.dart';
import 'package:round/core/dependency_injection/locator_service.dart';
import 'package:round/features/auth_feature/check_user/data/models/check_user_request.dart';
import 'package:round/features/auth_feature/check_user/presentation/register_screen.dart';
import 'package:round/src/helpers/app_translations.dart';
import 'package:round/src/mixin/alerts_mixin.dart';
import 'package:round/src/mixin/validation_mixin.dart';
import 'package:round/src/screens/auth/verfication_screens/verfication_screen.dart';
import 'package:round/src/widgets/custom_form_widgets.dart';

import '../add_password_screen.dart';

class CheckUserForm extends StatefulWidget {
  final CheckUserReq checkUserReq;
  CheckUserForm({required this.checkUserReq, super.key});

  @override
  State<CheckUserForm> createState() => _CheckUserFormState();
}

class _CheckUserFormState extends State<CheckUserForm>
    with AlertsMixin, ValidationMixin {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyCustomInput(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            placeholder: AppLocalizations.of(context)!.phoneNumberOrEmail,
            textInputAction: TextInputAction.done,
            onChanged: (val) {
              RegExp _numeric = RegExp(r'^-?[0-9]+$');
              widget.checkUserReq.type =
                  _numeric.hasMatch(val!) ? 'phone' : 'email';
              widget.checkUserReq.value = val;
            },
            validator: (val) => validateValue(val!),
            onSaved: (val) {
              RegExp _numeric = RegExp(r'^-?[0-9]+$');
              widget.checkUserReq.type =
                  _numeric.hasMatch(val!) ? 'phone' : 'email';
              widget.checkUserReq.value = val;
            },
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              AppLocalizations.of(context)!.sendYouAnActivationCode,
              style: TextStyle(
                fontSize: 12,
                letterSpacing: .4,
                color: const Color(0x99000000),
                fontWeight: FontWeight.w600,
                fontFamily: 'Nunito',
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) async {
              if (state is ButtonFailureState) {
                print(state.errorMessage);
                var snackBar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }

              if (state is ButtonSuccessState) {
                final statusCode = state.data.statusCode;
                print(statusCode);
                if (statusCode == 200) {
                  LocatorService.navigationService.push(
                      AddPasswordScreen(checkUserReq: widget.checkUserReq));
                }
                if (statusCode == 400) {
                  LocatorService.navigationService
                      .push(RegisterScreen(checkUserReq: widget.checkUserReq));
                }

                if (statusCode == 202) {
                  var xx = await showConfirmDialog(
                      context,
                      AppLocalizations.of(context)!.loginFailed,
                      widget.checkUserReq.type == 'phone'
                          ? AppLocalizations.of(context)!
                              .yourPhoneIsNotActivated
                          : AppLocalizations.of(context)!
                              .yourEmailIsNotActivated,
                      [
                        AppLocalizations.of(context)!.cancel,
                        AppLocalizations.of(context)!.ok,
                      ]);
                  if (xx) {
                    final responseData = await LocatorService.authProvider
                        .sendActivationCode(
                            widget.checkUserReq as Map<String, dynamic>);
                    Navigator.of(context)
                        .pushNamed(VerificationScreen.routeName);
                  }
                }
              }
            },
            child: CustomReactiveButton(
              title: AppLocalizations.of(context)!.continueWord,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<ButtonStateCubit>().execute(
                      params: widget.checkUserReq,
                      useCase: LocatorService.checkUseCase);
                }
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
