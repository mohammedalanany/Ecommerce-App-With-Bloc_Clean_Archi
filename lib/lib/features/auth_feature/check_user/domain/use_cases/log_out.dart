import 'package:dartz/dartz.dart';
import 'package:round/core/dependency_injection/locator.dart';
import 'package:round/core/main_usecase/usecase.dart';
import 'package:round/features/auth_feature/check_user/domain/repositories/check_user_repository.dart';

class LogOutUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return locator<CheckUserRepository>().logOut();
  }
}
