import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LoadMapScreen extends StatefulWidget {
  static const routeName = '/load_map';
  const LoadMapScreen({Key? key}) : super(key: key);

  @override
  State<LoadMapScreen> createState() => _LoadMapScreenState();
}

class _LoadMapScreenState extends State<LoadMapScreen> {
  final GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  final List<PositionItem> arrPositionItems = <PositionItem>[];
  late GoogleMapController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load map from user location"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: InkWell(
          onTap: () async {
            await getCurrentPosistion();
          },
          child: Column(
            children: [
              Text("Load Map"),
              Container(
                width: 300,
                height: 500,
                child: GoogleMap(
                  initialCameraPosition: userInitialPosition(),
                  onMapCreated: onMapCreated,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getCurrentPosistion() async {
    final hasPermission = await handlePermission();
    if (!hasPermission) {
      return;
    }
    final position = await geolocatorPlatform.getCurrentPosition();
    print(">>> current lat, lng: " + position.latitude.toString() + ", " + position.longitude.toString());
    updatePosistionList(PositionItemType.position, position.toString());
    controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 15.0
          )
        )
    );
  }

  Future<bool> handlePermission() async {
    bool locationServiceEnabled;
    LocationPermission locationPermission;
    locationServiceEnabled = await geolocatorPlatform.isLocationServiceEnabled();
    if (!locationServiceEnabled) {
      updatePosistionList(PositionItemType.log, "Location service belum diaktifkan");
      return false;
    }
    locationPermission = await geolocatorPlatform.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await geolocatorPlatform.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        updatePosistionList(PositionItemType.log, "Permission denied");
        return false;
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      updatePosistionList(PositionItemType.log, "Permission denied forever");
      return false;
    }
    updatePosistionList(PositionItemType.log, "Permission granted");
    return true;
  }

  void updatePosistionList(PositionItemType type, String displayValue) {
    arrPositionItems.add(PositionItem(type, displayValue));
    setState(() {

    });
  }

  CameraPosition userInitialPosition() {
    return CameraPosition(
      target: LatLng(-7.2834288,112.726619),
      zoom: 15.0,
    );
  }

  void onMapCreated(GoogleMapController gmapController) {
    setState(() {
      controller = gmapController;
    });
  }
}

enum PositionItemType {
  log,
  position
}

class PositionItem {

  PositionItem(this.type, this.displayValue);

  final PositionItemType type;
  final String displayValue;
}