import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TollLocationController extends GetxController{
  late GoogleMapController mapController;
  LatLng currentLocation =  const LatLng(25.4091721, 68.2694261);
  Map<String, Marker> mapMarkers = {};

  addMarker(String id, LatLng location) async{
    var  markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        "assets/images/toll_icon.png");
    var marker = Marker(markerId: MarkerId(id),
    position: location,
      infoWindow: const InfoWindow(
        title: "Sapphire",
        snippet: "Software Company"
      ),
      icon: markerIcon,
    );
    mapMarkers[id] = marker;
  }
}