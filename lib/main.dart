import 'package:flutter/material.dart';
import 'package:googlemap_current_location/map_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'google_map/google_map_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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