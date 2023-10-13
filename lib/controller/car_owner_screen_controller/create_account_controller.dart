import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController{
 TextEditingController nameController = TextEditingController();
 TextEditingController emailController = TextEditingController();
 TextEditingController vehicleNumberController = TextEditingController();
 TextEditingController passController = TextEditingController();
 TextEditingController confirmPassController = TextEditingController();

// Example: Add data to Firestore

  void incrementCounter() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "mickelllshjd@gmail.com",
        password: "123456").then((value) async {
      await FirebaseFirestore.instance.collection('users').add({
        'name': 'John Doe',
        'email': 'johndoe@example.com',
      });
      print("=====> value: ${value.toString()}");
      print("=======> okay");
    });

  }




 // CollectionReference users = FirebaseFirestore.instance.collection('users');
 //
 // Future<void> addUser() {
 //   print("====> before add suser");
 //   // Call the user's CollectionReference to add a new user
 //   return users
 //       .add({
 //     'name': "name",
 //     'email': "email",
 //     'vehicleNumber': "vehicleNumber",
 //     'pass': "pass" // 42
 //   })
 //       .then((value) => print("User Added"))
 //       .catchError((error) => print("Failed to add user: $error"));
 // }





 void signUpToFirebase({required String email, required String pass, required name,
   required String vehicleNumber}) async {
   print("====== clicked");





  // await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //     email: email,
  //     password: pass).then((value) async {
  //   Get.snackbar(
  //     'Success',
  //     "Email registered successfully",
  //     snackPosition: SnackPosition.TOP,
  //     backgroundColor: Colors.white,
  //     colorText: Colors.black,
  //   );
        // print("============> created : value : $value");
        // print("============> created : value : ${value.user!.uid}");
       Map<String, String> sendData = {
         'name': "name",
         'email': "email",
         'vehicleNumber': "vehicleNumber",
         'pass': "pass",
       };


         await FirebaseFirestore.instance
             .collection("user").doc().set(sendData).then((value) {
               print("=====> after clikc: ");
           Get.snackbar(
                 'Success',
                 "User Signup Successfully",
                 snackPosition: SnackPosition.TOP,
                 backgroundColor: Colors.white,
                 colorText: Colors.black,
                );
         });


      // await firestore_set("user", null, sendData).then((value) {
      //  Get.snackbar(
      //   'Success',
      //   "User Signup Successfully",
      //   snackPosition: SnackPosition.TOP,
      //   backgroundColor: Colors.white,
      //   colorText: Colors.black,
      //  );
      // });

  // }).onError((error, stackTrace) {
  //   if(error.toString().contains("The email address is already in use by another")){
  //     Get.snackbar(
  //       'Error',
  //       "The email address is already in use by another user",
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.white,
  //       colorText: Colors.black,
  //     );
  //   }else if(error.toString().contains("Password should be at least 6 characters")){
  //     Get.snackbar(
  //       'Error',
  //       "Password should be at least 6 characters",
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.white,
  //       colorText: Colors.black,
  //     );
  //   }else{
  //     Get.snackbar(
  //       'Error',
  //       "${error.toString}",
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.white,
  //       colorText: Colors.black,
  //     );
  //   }
  //
  //
  // });
 }
}