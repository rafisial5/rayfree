import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/utils/colors.dart';
import 'package:rayfree_toll/utils/constants.dart';
import 'package:rayfree_toll/view/constants_UI_widgets/background.dart';
import 'package:rayfree_toll/view/constants_UI_widgets/title_text_widget.dart';

import '../../controller/car_owner_screen_controller/car_owner_login_screen_controller.dart';

class CarOwnerLoginScreen extends GetView<CarOwnerLoginScreenController>{
  const CarOwnerLoginScreen({Key? key}) : super(key: key);

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
                     const SizedBox(height: 200,),
                   titleTextWidget(),
                     textWidget('A new way  to FUTURE', kWhiteColor, 18),
                     const SizedBox(height: 20 ,),
             customTextFieldWidget(
               hint: "Enter your email",
               obscureText: false,
               prefixIcon: Icons.email,
               prefixIconColor: kButtonGreyDarkColor),
             const SizedBox(height: 15,),
             customTextFieldWidget(
               hint: "Enter your Password",
               obscureText: true,
               prefixIcon: Icons.key,
               prefixIconColor: kButtonGreyDarkColor),
             const SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   GestureDetector(
                     onTap: () {
                        Get.toNamed(kCreateAccountScreeenRoute);
                     },
                     child: textWidget(
                       "Create an account",
                       kBlackColor,
                       16),
                   ),
                   // textWidget(
                   //  "Forget password",
                   //  kButtonGreyDarkColor,
                   //  16)
                 ],
             ),
                     const SizedBox(height: 20,),
                     buttonWidget("L O G I N", controller.moveToCarOwnerDashBoardScreen)

               ],
             ),
               ),
             ),]
          ),
        ),
      ),
    );
  }

  Widget customTextFieldWidget({
    required String hint,
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