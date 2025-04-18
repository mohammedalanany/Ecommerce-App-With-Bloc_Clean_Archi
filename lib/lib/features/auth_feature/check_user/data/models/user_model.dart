import 'package:equatable/equatable.dart';
import 'package:round/features/auth_feature/check_user/domain/entites/user_entity.dart';

class UserModel extends Equatable {
  int? id;
  String? username;
  int? phoneCode;
  String? phone;
  String? email;
  String? address;
  String? about;
  String? bio;
  String? photo;
  String? lang;
  int? activeEmail;
  int? activePhone;
  bool? isWorker;
  int? userTypeId;
  int? isNotification;
  int? notificationCount;
  String? token;
  String? birthDate;

  UserModel.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        username = map["username"],
        phoneCode = map["phonecode"],
        phone = map["phone"],
        email = map["email"],
        birthDate = map["birth_date"],
        address = map["address"],
        about = map["about"],
        bio = map["bio"],
        photo = map["photo"],
        lang = map["lang"],
        activeEmail = map["active_email"],
        activePhone = map["active_phone"],
        isWorker = map["is_worker"],
        userTypeId = map["user_type_id"],
        isNotification = map["notification"],
        notificationCount = map["notification_count"],
        token = map["token"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['username'] = username;
    data['phonecode'] = phoneCode;
    data['phone'] = phone;
    data['email'] = email;
    data['birth_date'] = birthDate;
    data['bio'] = bio;
    data['address'] = address;
    data['photo'] = photo;
    data['lang'] = lang;
    data['active_email'] = activeEmail;
    data['active_phone'] = activePhone;
    data['is_worker'] = isWorker;
    data['user_type_id'] = userTypeId;
    data['notification'] = isNotification;
    data['notification_count'] = notificationCount;
    data['token'] = token;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, username, email, phone, photo, token];
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
        id: id,
        username: username,
        phone: phone,
        email: email,
        photo: photo,
        token: token);
  }
}
