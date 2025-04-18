import 'package:dartz/dartz.dart';
import 'package:round/core/dependency_injection/locator.dart';
import 'package:round/core/main_usecase/usecase.dart';
import 'package:round/features/auth_feature/check_user/data/models/check_user_request.dart';
import 'package:round/features/auth_feature/check_user/domain/repositories/check_user_repository.dart';

class CheckUseCase implements UseCase<Either, CheckUserReq> {
  @override
  Future<Either> call({CheckUserReq? params}) async {
    return locator<CheckUserRepository>().checkUser(params!);
  }
}
