part of 'google_map_bloc.dart';

abstract class GoogleMapState extends Equatable {
  const GoogleMapState();

  @override
  List<Object> get props => [];
}

class GoogleMapInitialState extends GoogleMapState {}

class GoogleMapLoadState extends GoogleMapState {
  final CameraPosition location;
  final List<Marker> markers;

  const GoogleMapLoadState({required this.location, required this.markers});

  @override
  List<Object> get props => [location, markers];
}
