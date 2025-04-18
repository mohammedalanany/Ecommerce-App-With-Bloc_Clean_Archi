import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:round/common/bloc/button_state.dart';
import 'package:round/common/bloc/button_state_cubit.dart';
import 'package:round/common/widgets/button/custom_reactive_button.dart';
import 'package:round/core/dependency_injection/locator_service.dart';
import 'package:round/features/auth_feature/check_user/data/models/check_user_request.dart';
import 'package:round/features/auth_feature/check_user/data/models/register_user_request.dart';
import 'package:round/src/helpers/app_translations.dart';
import 'package:round/src/mixin/alerts_mixin.dart';
import 'package:round/src/mixin/validation_mixin.dart';
import 'package:round/src/screens/auth/verfication_screens/verfication_screen.dart';
import 'package:round/src/screens/global/terms_screen.dart';
import 'package:round/src/widgets/custom_form_widgets.dart';

class RegisterForm extends StatefulWidget {
  final RegisterUserRequest registerUserReq;

  final CheckUserReq checkUserReq;
  RegisterForm(
      {required this.checkUserReq, super.key, required this.registerUserReq});
  @override
  _AddInfoScreenState createState() => _AddInfoScreenState();
}

class _AddInfoScreenState extends State<RegisterForm>
    with AlertsMixin, ValidationMixin {
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              MyCustomInput(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                placeholder: AppLocalizations.of(context)!.userName,
                textInputAction: TextInputAction.next,
                validator: (val) => validateUsername(val!),
                inputType: TextInputType.text,
                onChanged: (val) {
                  widget.registerUserReq?.username = val;
                },
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  AppLocalizations.of(context)!
                      .theWordThisNameWillAppearOnYourAccount,
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: .4,
                    color: Color(0x99000000),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  final chosenDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(1990),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());
                  if (chosenDate != null)
                    setState(() {
                      widget.registerUserReq?.birth_date =
                          DateFormat('yyyy-MM-dd').format(chosenDate);
                    });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0x29000000),
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Text(
                        widget.registerUserReq?.birth_date == null
                            ? AppLocalizations.of(context)!.dateOfBirth
                            : widget.registerUserReq?.birth_date.toString() ??
                                '',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF000000).withOpacity(.6),
                          // height: 1.5,
                          letterSpacing: .29,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  AppLocalizations.of(context)!.birthDateText,
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: .4,
                    color: Color(0x99000000),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              MyCustomInput(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),

                placeholder: AppLocalizations.of(context)!.email,
                textInputAction: TextInputAction.next,
                enabled: widget.checkUserReq.type == 'email' ? false : true,
                initialValue: widget.checkUserReq.type == 'email'
                    ? widget.checkUserReq.value
                    : null,
                // validator: validateEmail,
                inputType: TextInputType.text,
                onChanged: (val) {
                  widget.registerUserReq?.email = val;
                },
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.checkUserReq.type == 'phone'
                      ? AppLocalizations.of(context)!.optional
                      : AppLocalizations.of(context)!
                          .theCodeWillBeSentToYourEmail,
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: .4,
                    color: Color(0x99000000),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              MyCustomInput(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                initialValue: widget.checkUserReq.type == 'phone'
                    ? widget.checkUserReq.value
                    : null,
                enabled: widget.checkUserReq.type == 'phone' ? false : true,
                placeholder: AppLocalizations.of(context)!.phone1,
                textInputAction: TextInputAction.next,
                //  validator: validateEmail,
                onChanged: (val) {
                  widget.registerUserReq?.phone = val;
                },
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.checkUserReq.type == 'phone'
                      ? AppLocalizations.of(context)!
                          .theCodeWillBeSentToYourMobileNumber
                      : AppLocalizations.of(context)!.optional,
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: .4,
                    color: Color(0x99000000),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 48,
                padding: EdgeInsets.only(
                  // bottom: 5,
                  top: 8,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    ),
                    border: Border.all(
                      width: 1.0,
                    )),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: validatePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordController,
                  onChanged: (val) {
                    widget.registerUserReq?.password = val;
                  },
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xDE000000),
                    letterSpacing: .29,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Nunito',
                  ),
                  keyboardType: TextInputType.text,
                  cursorColor: const Color(0xFF05B09C),
                  cursorHeight: 20,
                  cursorWidth: 1.5,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.password,
                    contentPadding:
                        const EdgeInsets.only(left: 15, right: 15, top: -10),
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0x99000000),
                      // height: 1.5,
                      letterSpacing: .4,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Nunito',
                    ),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF000000).withOpacity(.6),
                      // height: 1.5,
                      letterSpacing: .29,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Nunito',
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    //labelText: labelText,
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 48,
                padding: EdgeInsets.only(
                  // bottom: 5,
                  top: 8,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    border: Border.all(
                      width: 1.0,
                    )),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (val) {
                    widget.registerUserReq?.password_confirmation = val;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).unfocus();
                  },
                  validator: (val) {
                    if (_passwordController.text != val)
                      return '${AppLocalizations.of(context)!.validateConfirmPassword}';
                    else
                      return null;
                  },
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xDE000000),
                    // height: 2,
                    letterSpacing: .29,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Nunito',
                  ),
                  keyboardType: TextInputType.text,
                  cursorColor: const Color(0xFF05B09C),
                  cursorHeight: 20,
                  cursorWidth: 1.5,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.reenterPassword,
                    contentPadding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: -10), // floatingLabelBehavior:

                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0x99000000),
                      // height: 1.5,
                      letterSpacing: .4,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Nunito',
                    ),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF000000).withOpacity(.6),
                      // height: 1.5,
                      letterSpacing: .29,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Nunito',
                    ),
                    // hintText: placeholder,
                    //  alignLabelWithHint: true,
                    // prefix: prefixWidget,
                    // suffixIcon: suffixIcon,
                    // prefixIcon: prefixIcon,
                    // errorText: errorText,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    //labelText: labelText,
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  AppLocalizations.of(context)!.passwordText,
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: .4,
                    color: Color(0x99000000),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(TermsScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text.rich(
                    TextSpan(
                      text: "${AppLocalizations.of(context)!.bySelecting} ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xDE000000),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Nunito',
                      ),
                      // " By selecting Agree and continue below, I agree to round's Terms and conditions "
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '${AppLocalizations.of(context)!.agreeAndContinue}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xDE000000),
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Nunito',
                            //   decoration:TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xDE000000),
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Nunito',
                            //   decoration:TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!.belowIAgree,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xDE000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Nunito',
                          ),
                        ),
                        TextSpan(
                          text: "${AppLocalizations.of(context)!.toround} ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xDE000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Nunito',
                          ),
                        ),
                        TextSpan(
                          text:
                              AppLocalizations.of(context)!.termsAndConditions1,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xDE000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Nunito',
                            decoration: TextDecoration.underline,
                            letterSpacing: .1,
                          ),
                        ),
                        // can add more TextSpans here...
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
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
                    print(state.data.statusCode);

                    final responseData = json.decode(state.data..body);
                    print(responseData);
                    Navigator.of(context).pushReplacementNamed(
                        VerificationScreen.routeName,
                        arguments: {
                          'registerData': widget.registerUserReq,
                          'response_data': responseData
                        });
                  }
                },
                child: CustomReactiveButton(
                  title: AppLocalizations.of(context)!.agreeAndContinue1,
                  onPressed: () {
                    widget.checkUserReq.type == 'phone'
                        ? widget.registerUserReq.phone =
                            widget.checkUserReq.value
                        : widget.registerUserReq.email =
                            widget.checkUserReq.value;
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context.read<ButtonStateCubit>().execute(
                          params: widget.registerUserReq,
                          useCase: LocatorService.registerUseCase);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
