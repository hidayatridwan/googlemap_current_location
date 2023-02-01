part of 'google_map_bloc.dart';

abstract class GoogleMapEvent extends Equatable {
  const GoogleMapEvent();

  @override
  List<Object?> get props => [];
}

class GetCurrentLocationEvent extends GoogleMapEvent {}
