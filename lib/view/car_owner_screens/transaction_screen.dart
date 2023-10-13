import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/controller/car_owner_screen_controller/transaction_controller.dart';
import 'package:rayfree_toll/utils/colors.dart';

import '../constants_UI_widgets/background.dart';

class TransactionScreen extends GetView<TransactionController>{
  const TransactionScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: kBackground1Color,
          appBar: AppBar(
            backgroundColor: kBackground1Color,
            elevation: 0,
            title: Text(
              "T R A N S A C T I O N",
              style: TextStyle(
                  color: kYellowColor
              ),
            ),
          ),
          body: Stack(
            children: [
              background(),
              Column(
                children: [
                  customTabBAr(),
                  const Divider( thickness: 2,),
                  Obx(
                      () => Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: controller.screenFirst.value ? Column(
                            children: [
                              for(int i = 0; i < 10; i++)
                                sentCreditsWidget(),
                            ],
                          ) : Column(
                            children: [
                              for(int i = 0; i < 5; i++)
                                receivedCreditsWidget(),
                            ],
                          )

                    )),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget sentCreditsWidget(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.2)
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showText(title: "ABC 123", size: 24, color: kYellowColor),
              Row(
                children: [
                  showText(title: "Rs. ", size: 20, color: kWhiteColor),
                  showText(title: "100", size: 20, color: kWhiteColor),
                ],
              ),


            ],
          ),
          const Spacer(),
          showText(title: "01/01/2022", size: 22, color: kWhiteColor)
        ],
      ),
    );
  }

  Widget receivedCreditsWidget(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withOpacity(0.2)
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showText(title: "Received from:", size: 16, color: kWhiteColor),
              showText(title: "ABC 123", size: 24, color: kYellowColor),
              Row(
                children: [
                  showText(title: "Rs. ", size: 20, color: kWhiteColor),
                  showText(title: "100", size: 20, color: kWhiteColor),
                ],
              ),


            ],
          ),
          const Spacer(),
          showText(title: "01/01/2022", size: 22, color: kWhiteColor)
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

  Widget customTabBAr(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      height: 40,
      width: Get.width,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(
          () => Row(
          children: [
            GestureDetector(
              onTap: (){
                controller.colorOne.value = true;
                controller.screenFirst.value = true;
              },
              child: Container(
                height: 40,
                width: Get.width/2-50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
                  color: controller.colorOne.value ? kButtonGreyDarkColor :
                  kButtonLightGreyColor,
                ),
                child: Center(
                  child: Text(
                    "SENT",
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 20
                    ),
                  )
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
               controller.colorOne.value = false;
               controller.screenFirst.value = false;
              },
              child: Container(
                height: 40,
                width: Get.width/2-50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
                  color: controller.colorOne.value ? kButtonLightGreyColor :
                  kButtonGreyDarkColor,
                ),
                child: Center(
                    child: Text(
                      "Added\\Received",
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 20
                      ),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}