import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'google_map_event.dart';

part 'google_map_state.dart';

class GoogleMapBloc extends Bloc<GoogleMapEvent, GoogleMapState> {
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    return await Geolocator.getCurrentPosition();
  }

  GoogleMapBloc() : super(GoogleMapInitialState()) {
    on<GetCurrentLocationEvent>((event, emit) async {
      final Position position = await getUserCurrentLocation();
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 19,
      );
      final List<Marker> markers = <Marker>[];
      markers.add(Marker(
        markerId: const MarkerId("2"),
        position: LatLng(position.latitude, position.longitude),
      ));

      emit(GoogleMapLoadState(location: cameraPosition, markers: markers));
    });
  }
}
