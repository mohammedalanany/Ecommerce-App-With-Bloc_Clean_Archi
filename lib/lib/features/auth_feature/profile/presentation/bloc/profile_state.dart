import 'package:round/features/auth_feature/check_user/domain/entites/user_entity.dart';

abstract class ProfileState {}

class ProfileStateInitial extends ProfileState {}

class ProfileAuthenticated extends ProfileState {
  final UserEntity? user;

  ProfileAuthenticated(this.user);
}

class ProfileUnAuthenticated extends ProfileState {}
