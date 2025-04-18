import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/common/bloc/button_state.dart';
import 'package:round/common/bloc/button_state_cubit.dart';
import 'package:round/src/widgets/custom_loading.dart';

class CustomReactiveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  const CustomReactiveButton({required this.onPressed, this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonStateCubit, ButtonState>(
        builder: (context, state) {
      if (state is ButtonLoadingState) {
        return _loading();
      }
      return _initial();
    });
  }

  Widget _loading() {
    return CustomLoading();
  }

  Widget _initial() {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF037979),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          title!,
          style: TextStyle(
            fontSize: 14,
            letterSpacing: .42,
            color: const Color(0xFFFFFFFF),
            fontWeight: FontWeight.w700,
            fontFamily: 'Nunito',
          ),
        ),
      ),
    );
  }
}
