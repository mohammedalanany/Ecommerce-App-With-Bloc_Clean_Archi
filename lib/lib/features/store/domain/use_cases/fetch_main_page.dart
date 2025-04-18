import 'package:dartz/dartz.dart';
import 'package:round/core/dependency_injection/locator.dart';
import 'package:round/core/main_usecase/usecase.dart';
import 'package:round/features/store/data/data_source/store_remote_data_source.dart';

class FetchMainPageUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return locator<StoreMainRemoteDataSource>().fetchHomeData();
  }
}
