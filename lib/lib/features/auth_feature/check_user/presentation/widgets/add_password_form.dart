import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/common/bloc/button_state.dart';
import 'package:round/common/bloc/button_state_cubit.dart';
import 'package:round/common/widgets/button/custom_reactive_button.dart';
import 'package:round/core/dependency_injection/locator_service.dart';
import 'package:round/features/auth_feature/check_user/data/models/check_user_request.dart';
import 'package:round/features/auth_feature/check_user/data/models/login_user_request.dart';
import 'package:round/src/helpers/app_translations.dart';
import 'package:round/src/mixin/alerts_mixin.dart';
import 'package:round/src/mixin/validation_mixin.dart';
import 'package:round/src/screens/store/store_main_screen.dart';
import 'package:round/src/widgets/custom_form_widgets.dart';

class AddPasswordForm extends StatefulWidget {
  final CheckUserReq checkUserReq;
  final LoginUserReq loginUserReq;
  AddPasswordForm(
      {required this.checkUserReq, super.key, required this.loginUserReq});

  @override
  _EnterPasswordScreenState createState() => _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends State<AddPasswordForm>
    with AlertsMixin, ValidationMixin {
  FocusNode _focusNode1 = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 18,
          ),
          MyCustomInput(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            focusNode: _focusNode1,
            hasFocus: _focusNode1.hasFocus ? true : false,
            placeholder: AppLocalizations.of(context)!.password,
            textInputAction: TextInputAction.done,
            validator: validateShortPassword,
            obsecureText: true,
            inputType: TextInputType.text,
            onChanged: (val) {
              widget.loginUserReq.password = val.toString();
            },
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
                  LocatorService.navigationService.currentState!
                      .pushNamedAndRemoveUntil(
                          StoreMainScreen.routeName, (_) => false);
                }
              }
            },
            child: CustomReactiveButton(
              title: AppLocalizations.of(context)!.login,
              onPressed: () {
                widget.loginUserReq.type = widget.checkUserReq.type;
                widget.loginUserReq.value = widget.checkUserReq.value;
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<ButtonStateCubit>().execute(
                      params: widget.loginUserReq,
                      useCase: LocatorService.loginUseCase);
                }
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
