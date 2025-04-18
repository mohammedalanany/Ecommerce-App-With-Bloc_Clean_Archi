import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/core/dependency_injection/locator_service.dart';
import 'package:round/features/auth_feature/splash/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    var isLoggedIn = await LocatorService.tryAutoLoginUseCase.call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
