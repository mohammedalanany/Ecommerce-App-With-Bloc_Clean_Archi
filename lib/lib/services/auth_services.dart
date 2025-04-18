import 'api_service.dart';

abstract class AuthServices {
  static Future checkUser(dynamic data) async {
    return await ApiService.postService('/check-user', data: data);
  }

  static Future activateUser(dynamic data) async {
    return await ApiService.postService('/activate', data: data);
  }

  static Future register(dynamic data) async {
    return await ApiService.postService('/register', data: data);
  }

  static Future forgotPassword(dynamic data) async {
    return await ApiService.postService('/forgot-password', data: data);
  }

  static Future login(dynamic data) async {
    return await ApiService.postService('/login', data: data);
  }

  static Future resetPassword(dynamic data) async {
    return await ApiService.postService('/change-password', data: data);
  }

  static Future logout(dynamic data) async {
    return await ApiService.postService('/logout', data: data);
  }

  static Future editProfile(dynamic data) async {
    return await ApiService.postService('/edit-profile', data: data);
  }

  static Future refreshToken(dynamic data) async {
    return await ApiService.postService('/refresh-token', data: data);
  }

  static Future deleteAccount() async {
    return await ApiService.postService('/delete-account');
  }

  static Future currentUser() async {
    return await ApiService.getService('/current-user');
  }

  static Future getNotifications(dynamic params) async {
    return await ApiService.getService('/notifications', params: params);
  }

  static Future changePhoneNumber(dynamic data) async {
    return await ApiService.postService('/change-phone', data: data);
  }

  static Future changePassword(dynamic data) async {
    return await ApiService.postService('/change-password', data: data);
  }

  static Future changeStatusNotification() async {
    return await ApiService.postService('/change-notification');
  }

  static Future changeLang(dynamic data) async {
    return await ApiService.postService('/change-lang', data: data);
  }
}
