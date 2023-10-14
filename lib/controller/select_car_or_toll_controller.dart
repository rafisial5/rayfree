import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/utils/constants.dart';

class SelectCarOrTollController extends GetxController {
  void moveToCarOwnerLoginScreen() async {
    // if (kDebugMode) {
    //   print("======> before method call");
    // }
    // incrementCounter();
    // print("======> after method call");

    Get.toNamed(kCarOwnerLoginScreenRoute);
  }

  void incrementCounter() async {
    print("======> inside method call");

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: "mickellljcjd@gmail.com", password: "123456")
        .then((value) async {
      print("======> Email registered");

      await FirebaseFirestore.instance.collection('users').add({
        'name': 'micek',
        'email': 'mickele@example.com',
      });
      print("=====> value: ${value.toString()}");
      print("=======> okay");
    });
  }

  void moveToTollServiceLoginScreen() {
    Get.toNamed(kTollDashboardScreenRoute);
  }
}
