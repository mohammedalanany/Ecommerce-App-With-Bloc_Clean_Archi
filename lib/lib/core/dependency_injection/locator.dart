import 'package:get_it/get_it.dart';
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
import 'package:round/features/store/data/data_source/store_remote_data_source.dart';
import 'package:round/features/store/data/repositories_impl/check_user_repository_impl.dart';
import 'package:round/features/store/domain/repositories/main_home_repository.dart';
import 'package:round/features/store/domain/use_cases/fetch_main_page.dart';
import 'package:round/features/store/domain/use_cases/fetch_main_page_products.dart';
import 'package:round/features/store/presentation/screens/bloc/home_products_cubit/recommend_product_cubit.dart';
import 'package:round/features/store/presentation/screens/bloc/main_home_cubit/main_home_cubit.dart';
import 'package:round/helper/cache_helper.dart';
import 'package:round/services/navigation_service.dart';

import '../../services/api_service.dart';
import '../../src/providers/auth/auth.dart';
import '../../src/providers/global/language.dart';

GetIt locator = GetIt.instance;

Future<void> setupServices() async {
  // Services
  locator.registerLazySingleton<CacheHelper>(() => CacheHelper());

  locator.registerLazySingleton<ApiService>(() => ApiService());
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerSingleton<MainCheckUserService>(CheckUserServiceImpl());
  locator.registerSingleton<MainCheckUserLocalDataService>(
      CheckUserServiceLocalImpl());
  locator.registerSingleton<StoreMainRemoteDataSource>(
      StoreMainRemoteDataSourceImpl());
  // Repositories
  locator.registerSingleton<CheckUserRepository>(CheckUserRepositoryImpl());

  locator.registerSingleton<MainHomeRepository>(MainHomeRepositoryImpl());
  // Usecases
  locator.registerSingleton<CheckUseCase>(CheckUseCase());
  locator.registerSingleton<RegisterUseCase>(RegisterUseCase());
  locator.registerSingleton<LoginUseCase>(LoginUseCase());
  locator.registerSingleton<TryAutoLoginUseCase>(TryAutoLoginUseCase());
  locator.registerSingleton<GetUserUseCase>(GetUserUseCase());
  locator.registerSingleton<LogOutUseCase>(LogOutUseCase());
  locator.registerSingleton<FetchMainPageUseCase>(FetchMainPageUseCase());
  locator.registerSingleton<FetchMainPageProductsUseCase>(
      FetchMainPageProductsUseCase());

//bloc

  //////////////////////////////////////////////
  locator.registerLazySingleton<Auth>(() => Auth());
  locator.registerLazySingleton<AppLanguage>(() => AppLanguage());

  locator.registerLazySingleton<MainHomeCubit>(() => MainHomeCubit());
  // locator
  //   .registerLazySingleton<SearchProductsCubit>(() => SearchProductsCubit());

  locator.registerLazySingleton<RecommendsProductsCubit>(
      () => RecommendsProductsCubit());
}
