import 'dart:convert';

import 'package:round/core/dependency_injection/locator_service.dart';
import 'package:round/features/auth_feature/check_user/data/models/user_model.dart';
import 'package:round/features/auth_feature/check_user/domain/entites/user_entity.dart';
import 'package:round/services/api_service.dart';

abstract class MainCheckUserLocalDataService {
  Future<void> setUser(Map<String, dynamic> data);
  Future<bool> tryAutoLogin();
  Future<UserEntity?> getUser();
  Future<void> logOutLocal();
}

class CheckUserServiceLocalImpl extends MainCheckUserLocalDataService {
  @override
  Future<bool> tryAutoLogin() async {
    final userData = await LocatorService.cacheHelper.getData(key: 'user');
    if (userData == null) {
      return false;
    } else {
      setUser(json.decode(userData));
      ApiService.setToken(json.decode(userData)['token']);
      return true;
    }
  }

  @override
  Future<void> setUser(Map<String, dynamic> data) async {
    print(data);
    await LocatorService.cacheHelper.setData(
      key: 'user',
      value: json.encode(data),
    );
    ApiService.setToken(data['token']);
  }

  Future<void> logOutLocal() async {
    LocatorService.cacheHelper.deleteItem(key: 'user');
  }

  Future<UserEntity?> getUser() async {
    final jsonString = await LocatorService.cacheHelper.getData(key: 'user');
    if (jsonString == null) return null;
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return UserModel.fromJsonMap(jsonMap).toEntity();
  }
}
