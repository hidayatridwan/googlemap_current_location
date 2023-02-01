import 'package:flutter/material.dart';
import 'package:googlemap_current_location/map_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'google_map/google_map_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// ..add(GetCurrentLocationEvent())
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleMapBloc()..add(GetCurrentLocationEvent()),
      child: MaterialApp(
        home: MapScreen(),
      ),
    );
  }
}
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final Completer<GoogleMapController> _controller = Completer();
//
//   // on below line we have specified camera position
//   static const CameraPosition _kGoogle = CameraPosition(
//     target: LatLng(20.42796133580664, 80.885749655962),
//     zoom: 14.4746,
//   );
//
//   // on below line we have created the list of markers
//   final List<Marker> _markers = <Marker>[
//     const Marker(
//         markerId: MarkerId('1'),
//         position: LatLng(20.42796133580664, 75.885749655962),
//         infoWindow: InfoWindow(
//           title: 'My Position',
//         )),
//   ];
//
//   // created method for getting user current location
//   Future<Position> getUserCurrentLocation() async {
//     await Geolocator.requestPermission()
//         .then((value) {})
//         .onError((error, stackTrace) async {
//       await Geolocator.requestPermission();
//       print("ERROR" + error.toString());
//     });
//     return await Geolocator.getCurrentPosition();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF0F9D58),
//         // on below line we have given title of app
//         title: const Text("Current Location"),
//       ),
//       body: SafeArea(
//         // on below line creating google maps
//         child: GoogleMap(
//           // on below line setting camera position
//           initialCameraPosition: _kGoogle,
//           // on below line we are setting markers on the map
//           markers: Set<Marker>.of(_markers),
//           // on below line specifying map type.
//           mapType: MapType.normal,
//           // on below line setting user location enabled.
//           myLocationEnabled: true,
//           // on below line setting compass enabled.
//           compassEnabled: true,
//           // on below line specifying controller on map complete.
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//           },
//         ),
//       ),
//       // on pressing floating action button the camera will take to user current location
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           getUserCurrentLocation().then((value) async {
//             print(value.latitude.toString() + " " + value.longitude.toString());
//
//             // marker added for current users location
//             _markers.add(Marker(
//               markerId: const MarkerId("2"),
//               position: LatLng(value.latitude, value.longitude),
//               infoWindow: const InfoWindow(
//                 title: 'My Current Location',
//               ),
//             ));
//
//             // specified current users location
//             CameraPosition cameraPosition = CameraPosition(
//               target: LatLng(value.latitude, value.longitude),
//               zoom: 14,
//             );
//
//             final GoogleMapController controller = await _controller.future;
//             controller
//                 .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//             setState(() {});
//           });
//         },
//         child: const Icon(Icons.local_activity),
//       ),
//     );
//   }
// }
