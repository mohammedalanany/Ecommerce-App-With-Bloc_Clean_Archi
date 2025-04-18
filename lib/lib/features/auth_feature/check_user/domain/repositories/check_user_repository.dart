import 'package:dartz/dartz.dart';
import 'package:round/features/auth_feature/check_user/data/models/check_user_request.dart';
import 'package:round/features/auth_feature/check_user/data/models/login_user_request.dart';
import 'package:round/features/auth_feature/check_user/data/models/register_user_request.dart';
import 'package:round/features/auth_feature/check_user/domain/entites/user_entity.dart';

abstract class CheckUserRepository {
  Future<Either> checkUser(CheckUserReq userData);
  Future<Either> register(RegisterUserRequest registerUserRequest);
  Future<Either> login(LoginUserReq loginUserReq);
  Future<bool> tryAutoLogin();
  Future<UserEntity?> getUser();
  Future<Either> logOut();
}
