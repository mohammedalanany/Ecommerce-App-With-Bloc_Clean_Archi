import 'package:dartz/dartz.dart';
import 'package:round/core/dependency_injection/locator.dart';
import 'package:round/core/main_usecase/usecase.dart';
import 'package:round/features/auth_feature/check_user/data/models/login_user_request.dart';
import 'package:round/features/auth_feature/check_user/domain/repositories/check_user_repository.dart';

class LoginUseCase implements UseCase<Either, LoginUserReq> {
  @override
  Future<Either> call({LoginUserReq? params}) async {
    return locator<CheckUserRepository>().login(params!);
  }
}
