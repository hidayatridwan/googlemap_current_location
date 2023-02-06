import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'google_map/google_map_bloc.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);

  final Completer<GoogleMapController> _controller = Completer();

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
            return const Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
