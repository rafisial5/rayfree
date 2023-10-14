import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/view/initials/signup/create_account_controller.dart';

import '../../../utils/colors.dart';
import '../../constants_UI_widgets/background.dart';
import '../../constants_UI_widgets/title_text_widget.dart';

class CreateAccountScreen extends GetView<CreateAccountController> {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackground1Color,
      body: SizedBox(
        height: Get.height,
        child: Stack(children: [
          background(),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    titleTextWidget(),
                    textWidget('A new way  to FUTURE', kWhiteColor, 18),
                    const SizedBox(
                      height: 20,
                    ),
                    customTextFieldWidget(
                        hint: "Enter your name",
                        obscureText: false,
                        controller: controller.nameController,
                        prefixIcon: Icons.email,
                        prefixIconColor: kButtonGreyDarkColor,
                        validator: controller.validateName),
                    const SizedBox(
                      height: 15,
                    ),
                    customTextFieldWidget(
                        hint: "Enter your email",
                        obscureText: false,
                        controller: controller.emailController,
                        prefixIcon: Icons.email,
                        prefixIconColor: kButtonGreyDarkColor,
                        validator: controller.validateEmail),
                    const SizedBox(
                      height: 15,
                    ),
                    customTextFieldWidget(
                        hint: "Enter your vehicle number",
                        obscureText: false,
                        controller: controller.vehicleNumberController,
                        prefixIcon: Icons.email,
                        prefixIconColor: kButtonGreyDarkColor,
                        validator: controller.validateVehicleNumber),
                    const SizedBox(
                      height: 15,
                    ),
                    // customTextFieldWidget(
                    //     hint: "Enter your email",
                    //     obscureText: false,
                    //     prefixIcon: Icons.email,
                    //     prefixIconColor: kButtonGreyDarkColor),
                    // const SizedBox(height: 15,),
                    customTextFieldWidget(
                        hint: "Enter your Password",
                        obscureText: true,
                        controller: controller.passController,
                        prefixIcon: Icons.key,
                        prefixIconColor: kButtonGreyDarkColor,
                        validator: controller.validatePassword),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFieldWidget(
                        hint: "Confirm your Password",
                        obscureText: true,
                        controller: controller.confirmPassController,
                        prefixIcon: Icons.key,
                        prefixIconColor: kButtonGreyDarkColor,
                        validator: (value) =>
                            controller.validateConfirmPassword(
                                value, controller.confirmPassController.text)),
                    const SizedBox(
                      height: 10,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      return buttonWidget("C R E A T E  A C C O U N T", () {
                        controller.signupWithFirebase();
                      }, isloading: controller.isloading.value);
                    }),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    ));
  }

  Widget customTextFieldWidget(
      {required String hint,
      required TextEditingController controller,
      required bool obscureText,
      required IconData prefixIcon,
      required Color prefixIconColor,
      required Function(String)? validator}) {
    return Container(
        width: 500,
        decoration: BoxDecoration(
          color: kButtonLightGreyColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          style: TextStyle(
            color: kBlackColor,
            fontSize: 18,
          ),
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              prefixIcon,
              color: prefixIconColor,
            ),
          ),
          validator: validator != null
              ? (value) => validator(value!)
              : (value) {
                  return null;
                },
        ));
  }

  Widget textWidget(String text, Color color, double size) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }

  Widget buttonWidget(String text, Function onChange,
      {bool isloading = false}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: kButtonGreyDarkColor,
          minimumSize: const Size(500, 30),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
        ),
        onPressed: () => onChange(),
        child: isloading
            ? const CupertinoActivityIndicator(
                color: Colors.white,
              )
            : Text(
                text,
                style: TextStyle(color: kWhiteColor, fontSize: 18),
              ));
  }
}
