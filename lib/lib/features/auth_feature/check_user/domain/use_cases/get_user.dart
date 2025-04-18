import 'package:round/core/dependency_injection/locator.dart';
import 'package:round/core/main_usecase/usecase.dart';
import 'package:round/features/auth_feature/check_user/domain/entites/user_entity.dart';
import 'package:round/features/auth_feature/check_user/domain/repositories/check_user_repository.dart';

class GetUserUseCase implements UseCase<UserEntity?, dynamic> {
  @override
  Future<UserEntity?> call({dynamic params}) async {
    return locator<CheckUserRepository>().getUser();
  }
}
