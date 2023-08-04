import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passi_app/widgets/loading.dart';
import 'dart:ui' as ui;
import '../models/Event.dart';

class AppMapView extends StatefulWidget {
  final LatLng? center;
  List<Event> events;
  final bool? useGeoLoc;
  final bool? canInteract; 
  AppMapView({this.center, this.events = const [], this.useGeoLoc = false, this.canInteract = true, super.key});
  @override
  State<AppMapView> createState() => AppMapViewState();
}

class AppMapViewState extends State<AppMapView> {
  final _controller = Completer();
  String? mapTheme;
  late CameraPosition cameraPosition;
  late Set<Marker> markers;
  late Future<void> _data;

  @override
  void initState() {
    super.initState();
    _data = _fromLatLngToMarkers();
    cameraPosition = CameraPosition(
      target: widget.center ?? const LatLng(4.591667, -74.123886),
      zoom: 14.4746,
    );

    markers = {};

    Future.delayed(Duration.zero).then((_) async {
      mapTheme = await DefaultAssetBundle.of(context)
          .loadString("assets/map_theme.json");
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Permisos de geolocalizacion desabilitados.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Los permisos de geolocalizacion estan denegados');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Los Permisos de Geolocalizacion estan denegados de forma permanente, no podemos solicitarlos.');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _data,
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: cameraPosition,
              zoomGesturesEnabled: widget.canInteract ?? true,
              onMapCreated: (GoogleMapController controller) {
                controller.setMapStyle(mapTheme);
                if(widget.useGeoLoc == true) {
                  _determinePosition().then(
                  (position) => controller.animateCamera(
                    CameraUpdate.newLatLng(
                        LatLng(position.latitude, position.longitude)),
                  ),
                );
                }
                

                _controller.complete(controller);
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              markers: markers,
              mapToolbarEnabled: false,
              buildingsEnabled: false,
              zoomControlsEnabled: false,
              compassEnabled: false,
            );
          default:
            return const Loading();
        }
      },
    );
  }

  Future<void> _fromLatLngToMarkers() async {
    final Uint8List markerIconBytes = await getBytesFromAsset("assets/images/passi_pet.png", 300);
    final icon = BitmapDescriptor.fromBytes(markerIconBytes);
    for (var event in widget.events) {
        final marker = Marker(
        markerId: MarkerId(event.id),
        draggable: false,
        icon: icon,
        position: LatLng(event.coords.lat, event.coords.lng),
        anchor: const Offset(0.5, 0.5)
        
      );
      setState(() {
        markers.add(marker);
      });
      
    }
  }

  // Future<BitmapDescriptor> _fromUrlToBitmap(String path) async {
  //   Uri url = Uri.parse(path);
  //   final request = await http.get(url);
  //   final bytes = request.bodyBytes;
  //   return BitmapDescriptor.fromBytes(bytes, size: const Size(.0001, .001));
  // }


  Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
}
}
