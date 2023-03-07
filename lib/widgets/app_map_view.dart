// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Google Maps Demo',
//       home: AppMapView(),
//     );
//   }
// }

// class AppMapView extends StatefulWidget {
//   @override
//   State<AppMapView> createState() => AppMapViewState();
// }

// class AppMapViewState extends State<AppMapView> {
//   Completer<GoogleMapController> _controller = Completer();
//   String? mapTheme;

//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(Duration.zero).then((value) async {
//       mapTheme = await DefaultAssetBundle.of(context).loadString("assets/map_theme.json");
//     });
//   }

//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//     return await Geolocator.getCurrentPosition();
//   }

//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static final CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       mapType: MapType.normal,
//       initialCameraPosition: _kGooglePlex,
//       onMapCreated: (GoogleMapController controller) {
//         controller.setMapStyle(mapTheme);
//         _determinePosition().then(
//           (position) => controller.animateCamera(
//             CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
//           ),
//         );

//         _controller.complete(controller);
//       },
//       myLocationEnabled: true,
//       myLocationButtonEnabled: false,
//       markers: {
//         Marker(
//           markerId: MarkerId("1"),
//           draggable: false,
//         )
//       },
//       mapToolbarEnabled: false,
//       buildingsEnabled: false,
//       zoomControlsEnabled: false,
//       compassEnabled: false,
//     );
//   }

//   // Future<void> _goToTheLake() async {
//   //   final GoogleMapController controller = await _controller.future;
//   //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   // }
// }
