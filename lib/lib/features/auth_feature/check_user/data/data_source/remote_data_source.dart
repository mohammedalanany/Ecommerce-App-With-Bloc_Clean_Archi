import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:round/core/dependency_injection/locator_service.dart';
import 'package:round/features/auth_feature/check_user/data/models/check_user_request.dart';
import 'package:round/features/auth_feature/check_user/data/models/login_user_request.dart';
import 'package:round/features/auth_feature/check_user/data/models/register_user_request.dart';
import 'package:round/services/auth_services.dart';

abstract class MainCheckUserService {
  Future<Either> checkUser(CheckUserReq userCheck);
  Future<Either> register(RegisterUserRequest registerUserRequest);
  Future<Either> login(LoginUserReq loginUserReq);
  Future<Either> logOut();
}

class CheckUserServiceImpl extends MainCheckUserService {
  @override
  Future<Either> checkUser(CheckUserReq userCheck) async {
    final data = {
      "value": userCheck.value,
      "type": userCheck.type,
    };
    print(data);
    try {
      var response = await AuthServices.checkUser(data);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> register(RegisterUserRequest registerUserRequest) async {
    final data = {
      "username": registerUserRequest.username,
      "birth_date": registerUserRequest.birth_date,
      "email": registerUserRequest.email,
      "phone": registerUserRequest.phone,
      "password": registerUserRequest.password,
      "password_confirmation": registerUserRequest.password_confirmation,
    };
    if (registerUserRequest.email == '' || registerUserRequest.email == null)
      data.remove(data.remove('email'));
    if (registerUserRequest.phone == '' || registerUserRequest.phone == null)
      data.remove(data.remove('phone'));
    if (registerUserRequest.birth_date == '' ||
        registerUserRequest.birth_date == null)
      data.remove(data.remove('birth_date'));
    print(data);
    try {
      var response = await AuthServices.register(data);
      if (response.statusCode != 200) {
        return Left(json.decode(response.body)['message'].toString());
      }
      return Right(response);

      //   setUser(response.body, true);
    } catch (e) {
      return Left(e.toString());
    }
  }

//593029187   //password
  @override
  Future<Either> login(LoginUserReq loginUserReq) async {
    final data = {
      "value": loginUserReq.value,
      "type": loginUserReq.type,
      "password": loginUserReq.password,
    };
    print(data);
    try {
      var response = await AuthServices.login(data);
      if (response.statusCode != 200) {
        return Left(json.decode(response.body)['message'].toString());
      }
      Map<String, dynamic> userData =
          json.decode(response.body) as Map<String, dynamic>;
      await LocatorService.mainCheckUserLocalDataService.setUser(userData);

      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> logOut() async {
    try {
      EasyLoading.show();

      var response = await AuthServices.logout({});
      LocatorService.mainCheckUserLocalDataService.logOutLocal();
      EasyLoading.dismiss();
      if (response.statusCode != 200) {
        return Left(json.decode(response.body)['message'].toString());
      }
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
