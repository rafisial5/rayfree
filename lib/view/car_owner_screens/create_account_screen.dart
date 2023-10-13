import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/controller/car_owner_screen_controller/create_account_controller.dart';

import '../../utils/colors.dart';
import '../constants_UI_widgets/background.dart';
import '../constants_UI_widgets/title_text_widget.dart';

class CreateAccountScreen extends GetView<CreateAccountController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: kBackground1Color,
          body: SizedBox(
            height: Get.height,
            child: Stack(
                children: [
                  background(),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 100,),
                          titleTextWidget(),
                          textWidget('A new way  to FUTURE', kWhiteColor, 18),
                          const SizedBox(height: 20 ,),
                          customTextFieldWidget(
                              hint: "Enter your name",
                              obscureText: false,
                              controller: controller.nameController,
                              prefixIcon: Icons.email,
                              prefixIconColor: kButtonGreyDarkColor),
                          const SizedBox(height: 15,),
                          customTextFieldWidget(
                              hint: "Enter your email",
                              obscureText: false,
                              controller: controller.emailController,
                              prefixIcon: Icons.email,
                              prefixIconColor: kButtonGreyDarkColor),
                          const SizedBox(height: 15,),
                          customTextFieldWidget(
                              hint: "Enter your vehicle number",
                              obscureText: false,
                              controller: controller.vehicleNumberController,
                              prefixIcon: Icons.email,
                              prefixIconColor: kButtonGreyDarkColor),
                          const SizedBox(height: 15,),
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
                              prefixIconColor: kButtonGreyDarkColor),
                          const SizedBox(height: 10,),
                          customTextFieldWidget(
                              hint: "Confirm your Password",
                              obscureText: true,
                              controller: controller.confirmPassController,
                              prefixIcon: Icons.key,
                              prefixIconColor: kButtonGreyDarkColor),
                          const SizedBox(height: 10,),

                          const SizedBox(height: 20,),
                          buttonWidget("C R E A T E  A C C O U N T", () {
                            controller.incrementCounter();
                            // controller.signUpToFirebase(
                            //     email: controller.emailController.text,
                            //     pass: controller.passController.text,
                            //     name: controller.nameController.text,
                            //     vehicleNumber: controller.vehicleNumberController.text);
                          })

                        ],
                      ),
                    ),
                  ),]
            ),
          ),

        ));
  }




  Widget customTextFieldWidget({
    required String hint,
    required TextEditingController controller,
    required bool obscureText,
    required IconData prefixIcon,
    required Color prefixIconColor,
  }){
    return Container(
      width: 500,
      decoration: BoxDecoration(
        color: kButtonLightGreyColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        style: TextStyle(
          color: kBlackColor,
          fontSize: 18,
        ),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(prefixIcon, color: prefixIconColor,),
        ),
      ),
    );
  }
  Widget textWidget(String text, Color color, double size){
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
  Widget buttonWidget(String text, Function onChange){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),),
          primary: kButtonGreyDarkColor,
          minimumSize: const Size(500, 30),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
        ),
        onPressed:() => onChange(),
        child: Text(
          text,
          style: TextStyle(
              color: kWhiteColor,
              fontSize: 18
          ),
        )
    );
  }
}