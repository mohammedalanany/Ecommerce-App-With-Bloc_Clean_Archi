import 'package:round/core/dependency_injection/locator.dart';
import 'package:round/core/main_usecase/usecase.dart';
import 'package:round/features/auth_feature/check_user/domain/repositories/check_user_repository.dart';

class TryAutoLoginUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return locator<CheckUserRepository>().tryAutoLogin();
  }
}
