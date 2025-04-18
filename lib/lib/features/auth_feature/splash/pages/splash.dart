import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/features/auth_feature/check_user/presentation/check-user_screen.dart';
import 'package:round/features/auth_feature/splash/bloc/splash_cubit.dart';
import 'package:round/features/auth_feature/splash/bloc/splash_state.dart';
import 'package:round/src/screens/store/store_main_screen.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/Splash-Page';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is UnAuthenticated) {
              Future.delayed(Duration(seconds: 2), () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    opaque: true,
                    settings: RouteSettings(name: CheckUserScreen.routeName),
                    transitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (BuildContext context, _, __) =>
                        CheckUserScreen(),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) =>
                            FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  ),
                );
              });
            }
            if (state is Authenticated) {
              Future.delayed(Duration(seconds: 2), () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    opaque: true,
                    settings: RouteSettings(name: StoreMainScreen.routeName),
                    transitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (BuildContext context, _, __) =>
                        StoreMainScreen(),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) =>
                            FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  ),
                );
              });
            }
          },
          child: Scaffold(
            backgroundColor: Color(0xFF037979),
            body: Container(
              alignment: Alignment.center,
              child: Center(
                child: Hero(
                    tag: 'splash-logo',
                    child: Image.asset(
                      'assets/images/Logo.png',
                    )),
              ),
            ),
          )),
    );
  }
}
