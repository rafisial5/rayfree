import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rayfree_toll/controller/car_owner_screen_controller/toll_location_controller.dart';

class TollLocationScreen extends GetView<TollLocationController> {
  const TollLocationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     body: GoogleMap(

       initialCameraPosition:  CameraPosition(
         target: controller.currentLocation,
         zoom: 15,
       ),
       onMapCreated: (mController){
         controller.mapController = mController;
         controller.addMarker("test", controller.currentLocation);
       },
       markers: controller.mapMarkers.values.toSet(),

     ),
   );
  }
}
