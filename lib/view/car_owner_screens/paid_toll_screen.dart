import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/controller/car_owner_screen_controller/paid_toll_controller.dart';
import 'package:rayfree_toll/utils/colors.dart';

import '../constants_UI_widgets/background.dart';

class PaidTollScreen extends GetView<PaidTollController>{
  const PaidTollScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: kBackground1Color,
          appBar: AppBar(
            backgroundColor: kBackground1Color,
            elevation: 0,
            title: Text(
              "T O L L  P A I D  R E C O R D S",
              style: TextStyle(
                color: kYellowColor,
              ),
            ),
          ),
          body: Stack(
            children: [
              background(),
              SingleChildScrollView(
                 physics: const BouncingScrollPhysics(),
                 child: Column(
                   children: [
                     for( int i = 0; i < 11; i++)
                       paidTollCard(),
                     ],
                 ),
               )
            ],
          ),
        ));
  }

  Widget paidTollCard(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kWhiteColor
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showText(title: "ABC 123", size: 24, color: kBlueLightColor),
              const SizedBox(height: 5,),
              Row(
                children: [
                  showText(title: "Toll: ", size: 18, color: kBlackColor),
                  showText(title: "Ranipur ", size: 18, color: kBlueLightColor),
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                children: [
                  showText(title: "Rs: ", size: 18, color: kBlackColor),
                  showText(title: "30", size: 18, color: kBlueLightColor),
                ],
              )
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showText(title: "01/01/2022", size: 18, color: kBlackColor),
              const SizedBox(height: 10,),
              showText(title: "5:42 am", size: 18, color: kBlackColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget showText({required String title, required double size, required Color color}){
    return Text(
      title,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }

}