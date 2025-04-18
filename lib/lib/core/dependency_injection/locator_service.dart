import 'package:round/core/dependency_injection/locator.dart';
import 'package:round/features/auth_feature/check_user/data/data_source/local_data_source.dart';
import 'package:round/features/auth_feature/check_user/data/data_source/remote_data_source.dart';
import 'package:round/features/auth_feature/check_user/data/repositories_impl/check_user_repository_impl.dart';
import 'package:round/features/auth_feature/check_user/domain/repositories/check_user_repository.dart';
import 'package:round/features/auth_feature/check_user/domain/use_cases/check_user.dart';
import 'package:round/features/auth_feature/check_user/domain/use_cases/get_user.dart';
import 'package:round/features/auth_feature/check_user/domain/use_cases/log_out.dart';
import 'package:round/features/auth_feature/check_user/domain/use_cases/login_user.dart';
import 'package:round/features/auth_feature/check_user/domain/use_cases/register_user.dart';
import 'package:round/features/auth_feature/check_user/domain/use_cases/try_auto_login.dart';
import 'package:round/features/store/domain/use_cases/fetch_main_page.dart';
import 'package:round/features/store/domain/use_cases/fetch_main_page_products.dart';
import 'package:round/features/store/presentation/screens/bloc/home_products_cubit/recommend_product_cubit.dart';
import 'package:round/features/store/presentation/screens/bloc/main_home_cubit/main_home_cubit.dart';
import 'package:round/helper/cache_helper.dart';
import 'package:round/services/navigation_service.dart';

import '../../services/api_service.dart';
import '../../src/providers/auth/auth.dart';
import '../../src/providers/global/language.dart';

abstract class LocatorService {
  // Services
  static CacheHelper get cacheHelper => locator<CacheHelper>();

  static MainCheckUserLocalDataService get mainCheckUserLocalDataService =>
      locator<MainCheckUserLocalDataService>();
  static MainCheckUserService get mainCheckUserService =>
      locator<MainCheckUserService>();
  static NavigationService get navigationService =>
      locator<NavigationService>();
  // Repositories
  static CheckUserRepository get checkUserRepository =>
      locator<CheckUserRepositoryImpl>();
  // UseCases
  static CheckUseCase get checkUseCase => locator<CheckUseCase>();
  static RegisterUseCase get registerUseCase => locator<RegisterUseCase>();
  static LoginUseCase get loginUseCase => locator<LoginUseCase>();
  static TryAutoLoginUseCase get tryAutoLoginUseCase =>
      locator<TryAutoLoginUseCase>();
  static GetUserUseCase get getUserUseCase => locator<GetUserUseCase>();
  static LogOutUseCase get logOutUseCase => locator<LogOutUseCase>();
  static FetchMainPageUseCase get fetchMainPageUseCase =>
      locator<FetchMainPageUseCase>();
  static FetchMainPageProductsUseCase get fetchMainPageProductsUseCase =>
      locator<FetchMainPageProductsUseCase>();

  //bloc

  /////////////
  static Auth get authProvider => locator<Auth>();
  static AppLanguage get appLanguage => locator<AppLanguage>();
  static ApiService get apiService => locator<ApiService>();
  //static SearchProductsCubit get searchProductsCubit =>
  //   locator<SearchProductsCubit>();

  static MainHomeCubit get storeMainCubit => locator<MainHomeCubit>();
  static RecommendsProductsCubit get recommendsProductsCubit =>
      locator<RecommendsProductsCubit>();
}
