import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/utils/colors.dart';

Widget cardViewInDashboard({required String textTitle, required IconData iconValue}) {
  return Container(
    padding: const EdgeInsets.only(left: 7, right: 7),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: kYellowColor,
    ),
    child: Container(
      height: 90 ,
      width: Get.width-50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kWhiteColor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              textTitle,
              style: TextStyle(
                color: kBlackColor,
                fontSize: 18
              ),
            ),
            Icon(
              iconValue,
              color: kBlueLightColor,
              size: 50,),
          ],
        ),
      ),
    ),
  );
}