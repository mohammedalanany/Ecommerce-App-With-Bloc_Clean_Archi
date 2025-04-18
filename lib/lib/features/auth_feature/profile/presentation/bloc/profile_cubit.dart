import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/core/dependency_injection/locator_service.dart';
import 'package:round/features/auth_feature/profile/presentation/bloc/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileStateInitial());

  void getUser() async {
    var user = await LocatorService.getUserUseCase.call();
    print('user$user');
    if (user != null) {
      emit(ProfileAuthenticated(user));
    } else {
      emit(ProfileUnAuthenticated());
    }
  }
}
