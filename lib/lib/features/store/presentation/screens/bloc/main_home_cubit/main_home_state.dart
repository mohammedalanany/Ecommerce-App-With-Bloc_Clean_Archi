import 'package:equatable/equatable.dart';
import 'package:round/features/store/data/models/home_model.dart';

abstract class MainHomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeMainInitial extends MainHomeState {}

class HomeMainLoading extends MainHomeState {}

class HomeMainLoaded extends MainHomeState {
  final MainHomeModel mainHomeModel;

  HomeMainLoaded(this.mainHomeModel);

  @override
  List<Object?> get props => [mainHomeModel];
}

class HomeMainError extends MainHomeState {
  final String message;

  HomeMainError(this.message);

  @override
  List<Object?> get props => [message];
}

//
