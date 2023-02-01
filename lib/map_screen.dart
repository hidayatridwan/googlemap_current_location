import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'google_map/google_map_bloc.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);

  final Completer<GoogleMapController> _controller = Completer();

  // static const CameraPosition _initialLocation = CameraPosition(
  //   target: LatLng(-6.1753430897686545, 106.82714845868072),
  //   zoom: 19,
  // );
  //
  // final List<Marker> _markers = <Marker>[];
  //
  // Future<Position> getUserCurrentLocation() async {
  //   await Geolocator.requestPermission()
  //       .then((value) {})
  //       .onError((error, stackTrace) async {
  //     await Geolocator.requestPermission();
  //   });
  //   return await Geolocator.getCurrentPosition();
  //   // return await Geolocator.getCurrentPosition().then((value) async {
  //   //     _markers.add(Marker(
  //   //       markerId: const MarkerId("2"),
  //   //       position: LatLng(value.latitude, value.longitude),
  //   //     ));
  //   //
  //   //     CameraPosition cameraPosition = CameraPosition(
  //   //       target: LatLng(value.latitude, value.longitude),
  //   //       zoom: 14,
  //   //     );
  //   //
  //   //     final GoogleMapController controller = await _controller.future;
  //   //     controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  //   //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GoogleMapBloc, GoogleMapState>(
        builder: (context, state) {

            if (state is GoogleMapLoadState){
              return GoogleMap(
                  initialCameraPosition: state.location,
                  markers: Set<Marker>.of(state.markers),
                  myLocationEnabled: true,
                  compassEnabled: true,
                  onMapCreated: (GoogleMapController controller)async {
                    final GoogleMapController controller = await _controller.future;
                    controller.animateCamera(CameraUpdate.newCameraPosition(state.location));

                    _controller.complete(controller);
                  });
            }
            return const SizedBox();
            // return GoogleMap(
            //     initialCameraPosition: state.location,
            //     markers: Set<Marker>.of(state.markers),
            //     myLocationEnabled: true,
            //     compassEnabled: true,
            //     onMapCreated: (GoogleMapController controller)async {
            //       final GoogleMapController controller = await _controller.future;
            //       controller.animateCamera(CameraUpdate.newCameraPosition(state.location));
            //
            //       _controller.complete(controller);
            //     });
        },
      ),
    );
  }
}
