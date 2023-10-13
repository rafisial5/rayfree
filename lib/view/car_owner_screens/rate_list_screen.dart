import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/utils/colors.dart';

import '../../controller/car_owner_screen_controller/rate_list_controller.dart';
import '../constants_UI_widgets/background.dart';

class RateListScreen extends GetView<RateListController>{
  const RateListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kBackground1Color,
            elevation: 0,
            title: Text(
              "R A T E   L I S T",
              style: TextStyle(
                color: kYellowColor,
                fontSize: 20
              ),
            ),
          ),
          backgroundColor: kBackground1Color,
          body: Stack(
            children: [
              background(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      children: [
                        textTitle("#"),
                        const Spacer(),
                        textTitle("Category"),
                        const Spacer(),
                        textTitle("Toll Tax"),
                      ],
                    ),
                  ),
                  const Divider(thickness: 2,),
                  tableRowItem("1", "C A R", "Rs. 30  "),
                  const Divider(thickness: 2,),
                  tableRowItem("2", "W A G O N", "Rs. 50  "),
                  const Divider(thickness: 2,),
                  tableRowItem("3", "B U S E S", "Rs. 100"),
                  const Divider(thickness: 2,),
                  tableRowItem("4", "2 AXEL TRUCK", "Rs. 120"),
                  const Divider(thickness: 2,),
                  tableRowItem("5", "3 AXEL TRUCK", "Rs. 120"),
                  const Divider(thickness: 2,),
                  tableRowItem("6", "ARTICULATED TRUCK", "Rs. 250"),

                ],
              )
               ]
          ),
        ));
  }
  Widget tableRowItem(String num, String category, String price){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textTitle(num),
          // const Spacer(),
          textTitle(category),
          // const Spacer(),
          textTitle(price),
        ],
      ),
    );
  }
  Widget textTitle(String text){
    return   Center(
      child: Text(
        text,
        style: TextStyle(
          color: kWhiteColor,
          fontSize: 18,
        ),
      ),
    );
  }

}