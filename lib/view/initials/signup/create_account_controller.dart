import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/services/user_service.dart';
import 'package:rayfree_toll/utils/constants.dart';

class CreateAccountController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: "Demo");
  TextEditingController emailController =
      TextEditingController(text: "demo@hotmail.com");
  TextEditingController vehicleNumberController =
      TextEditingController(text: "AAAAA");
  TextEditingController passController =
      TextEditingController(text: "1234567890");
  TextEditingController confirmPassController =
      TextEditingController(text: "1234567890");
  RxBool isloading = false.obs;

  signupWithFirebase() async {
    try {
      if (formKey.currentState!.validate()) {
        isloading.value = true;
        await UserService.signupUser(
          nameController.text.trim(),
          emailController.text.trim(),
          passController.text.trim(),
          vehicleNumberController.text.trim(),
        );
        Get.toNamed(kCarOwnerDashboardScreenRoute);
      }
    } catch (e) {
      print("something went wrong in signup user:$e");
      //TODO: Handle the errors
    } finally {
      isloading.value = false;
    }
  }

  //validators

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
        .hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  String? validateVehicleNumber(String value) {
    if (value.isEmpty) {
      return 'Vehicle number is required';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Confirm password is required';
    } else if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  //   void incrementCounter() async {
  //   await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(
  //           email: "mickelllshjd@gmail.com", password: "123456")
  //       .then((value) async {
  //     await FirebaseFirestore.instance.collection('users').add({
  //       'name': 'John Doe',
  //       'email': 'johndoe@example.com',
  //     });
  //     print("=====> value: ${value.toString()}");
  //     print("=======> okay");
  //   });
  // }

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

  // void signUpToFirebase(
  //     {required String email,
  //     required String pass,
  //     required name,
  //     required String vehicleNumber}) async {
  //   print("====== clicked");

  //   // await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //   //     email: email,
  //   //     password: pass).then((value) async {
  //   //   Get.snackbar(
  //   //     'Success',
  //   //     "Email registered successfully",
  //   //     snackPosition: SnackPosition.TOP,
  //   //     backgroundColor: Colors.white,
  //   //     colorText: Colors.black,
  //   //   );
  //   // print("============> created : value : $value");
  //   // print("============> created : value : ${value.user!.uid}");
  //   Map<String, String> sendData = {
  //     'name': "name",
  //     'email': "email",
  //     'vehicleNumber': "vehicleNumber",
  //     'pass': "pass",
  //   };

  //   await FirebaseFirestore.instance
  //       .collection("user")
  //       .doc()
  //       .set(sendData)
  //       .then((value) {
  //     print("=====> after clikc: ");
  //     Get.snackbar(
  //       'Success',
  //       "User Signup Successfully",
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.white,
  //       colorText: Colors.black,
  //     );
  //   });

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
  // }
}
