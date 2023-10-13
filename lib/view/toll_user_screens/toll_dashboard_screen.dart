import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/controller/toll_user_controller/toll_dashboard_controller.dart';
import 'package:rayfree_toll/utils/colors.dart';
import 'package:rayfree_toll/view/constants_UI_widgets/background.dart';

class TollDashboardScreen extends GetView<TollDashboardController> {
  const TollDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground1Color,
      appBar: AppBar(
        actions: [
          Icon(Icons.logout,
          color: kYellowColor,
          size: 30,
          )
        ],
        title: Text(
          "T O L L  S E R V I C E",
          style: TextStyle(
              color: kYellowColor
          ),
        ),
      ),
      body: Stack(
        children: [
          background(),
          SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  items: controller.imgList.map((e) =>
                      Center(
                        child: Image.asset(
                            e, fit: BoxFit.fitHeight, width: 1000),
                      )).toList(),

                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kWhiteColor.withOpacity(0.2),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5,),
                      Text("RNP 01",
                      style: TextStyle(
                        fontSize: 22,
                        color: kYellowColor,
                      ),),
                      GestureDetector(
                        onTap: controller.moveToCollectTaxScreen,
                          child: cardInToll("COLLECT TAX", 'assets/images/toll_car.png')),
                      GestureDetector(
                        onTap: controller.moveToRecordOfVehicleScreen,
                          child: cardInToll("RECORD OF VEHICLES", 'assets/images/car_record.png')),
                      cardInToll("COMPLAINT", 'assets/images/report.png'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),


    );
  }
  Widget cardInToll(String text, String imagePath){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kWhiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
               fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
            const Spacer(),
            Image.asset(imagePath,
            height: 50,
            width: 50,)

          ],
        ),
      ),
    );
  }
}