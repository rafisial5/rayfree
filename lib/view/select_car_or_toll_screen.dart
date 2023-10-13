import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/controller/select_car_or_toll_controller.dart';
import 'package:rayfree_toll/utils/colors.dart';
import 'package:rayfree_toll/view/constants_UI_widgets/background.dart';
import 'package:rayfree_toll/view/constants_UI_widgets/title_text_widget.dart';

class SelectCarOrTollScreen extends GetView<SelectCarOrTollController>{
  const SelectCarOrTollScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: kBackground1Color,
          body: Stack(
          alignment: Alignment.center,
          children: [
            background(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     titleTextWidget(),
                     textWidget('A new way  to FUTURE', kWhiteColor, 18),
                     const SizedBox(height: 30,),
                     buttonWidget("Use as a Car Owner",controller.moveToCarOwnerLoginScreen),
                      const SizedBox(height: 10,),
                     buttonWidget("Use as a Toll service",controller.moveToTollServiceLoginScreen),

                    ],
                  ),
                ),
              ),
            )
          ],
        )

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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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