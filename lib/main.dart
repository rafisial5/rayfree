import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/utils/bindings.dart';
import 'package:rayfree_toll/utils/constants.dart';
import 'package:rayfree_toll/utils/route_management.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    initialRoute: kSelectCarOrTollScreenRoute,
    initialBinding: ScreenBindings(),
    getPages: RouteManagement.getPages(),
    debugShowCheckedModeBanner: false,
  ));
}


