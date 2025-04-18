import 'package:dartz/dartz.dart';
import 'package:round/core/dependency_injection/locator.dart';
import 'package:round/core/dependency_injection/locator_service.dart';
import 'package:round/features/auth_feature/check_user/data/data_source/remote_data_source.dart';
import 'package:round/features/auth_feature/check_user/data/models/check_user_request.dart';
import 'package:round/features/auth_feature/check_user/data/models/login_user_request.dart';
import 'package:round/features/auth_feature/check_user/data/models/register_user_request.dart';
import 'package:round/features/auth_feature/check_user/domain/entites/user_entity.dart';
import 'package:round/features/auth_feature/check_user/domain/repositories/check_user_repository.dart';

class CheckUserRepositoryImpl extends CheckUserRepository {
  @override
  Future<Either> checkUser(CheckUserReq userData) async {
    return await locator<MainCheckUserService>().checkUser(userData);
  }

  @override
  Future<Either> register(RegisterUserRequest registerUserRequest) async {
    return await locator<MainCheckUserService>().register(registerUserRequest);
  }

  @override
  Future<Either> login(LoginUserReq loginUserReq) async {
    return await locator<MainCheckUserService>().login(loginUserReq);
  }

  @override
  Future<bool> tryAutoLogin() async {
    return await LocatorService.mainCheckUserLocalDataService.tryAutoLogin();
  }

  @override
  Future<UserEntity?> getUser() async {
    return await LocatorService.mainCheckUserLocalDataService.getUser();
  }

  @override
  Future<Either> logOut() async {
    return await locator<MainCheckUserService>().logOut();
  }
}
