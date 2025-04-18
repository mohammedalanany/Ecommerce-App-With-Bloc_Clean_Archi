import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/core/dependency_injection/locator_service.dart';
import 'package:round/features/store/data/models/home_model.dart';
import 'package:round/features/store/presentation/screens/bloc/main_home_cubit/main_home_state.dart';

class MainHomeCubit extends Cubit<MainHomeState> {
  MainHomeCubit() : super(HomeMainInitial());
  Future<void> fetchMainStoreData() async {
    emit(HomeMainLoading());
    try {
      final response = await LocatorService.fetchMainPageUseCase();
      response.fold((message) {
        emit(HomeMainError(message.toString()));
      }, (data) {
        final dataLoaded = MainHomeModel.fromJson(data);
        emit(HomeMainLoaded(dataLoaded));
      });
    } catch (e) {
      emit(HomeMainError(e.toString()));
    }
  }
}
