import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/controller/car_owner_screen_controller/car_owner_dashboard_screen_controller.dart';
import 'package:rayfree_toll/utils/colors.dart';
import 'package:rayfree_toll/view/constants_UI_widgets/background.dart';
import 'package:rayfree_toll/view/constants_UI_widgets/card_view.dart';
import 'package:rayfree_toll/view/constants_UI_widgets/drawer_widget_ui.dart';

class CarOwnerDashboardScreen extends GetView<CarOwnerDashboardScreenController>{
  const CarOwnerDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBackground1Color,
          title:  Text(
            "T O L L  C R E D I T S :  100 ",
            style: TextStyle(
              fontSize: 20,
              color: kYellowColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
        ),
        drawer: drawerView(),
        backgroundColor: kBackground1Color,

        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            background(),
            Column(
              children: [
                SizedBox(
                  width: Get.width,
                  child: Image.asset('assets/images/toll.gif',),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 15,),
                        GestureDetector(
                          onTap: controller.moveToAddMoneyScreen,
                          child: cardViewInDashboard(
                              textTitle: "ADD MONEY",
                              iconValue: Icons.add_circle_outline),
                        ),
                        const SizedBox(height: 15,),
                        GestureDetector(
                          onTap: controller.moveToSendMoneyScreen,
                          child: cardViewInDashboard(
                              textTitle: "SEND MONEY",
                              iconValue: Icons.send,),
                        ),
                        const SizedBox(height: 15,),
                        GestureDetector(
                          onTap: controller.moveToTransactionScreen,
                          child: cardViewInDashboard(
                              textTitle: "TRANSACTIONS",
                              iconValue: Icons.compare_arrows,),
                        ),
                        const SizedBox(height: 15,),
                        GestureDetector(
                          onTap: controller.moveToPaidTollScreen,
                          child: cardViewInDashboard(
                              textTitle: "PAID TOLLS",
                              iconValue: Icons.money,),
                        ),
                        const SizedBox(height: 15,),
                       // const SizedBox(height: 15,),
                        GestureDetector(
                          onTap: controller.moveToRateListScreen,
                          child: cardViewInDashboard(
                              textTitle: "RATE LIST",
                              iconValue: Icons.format_list_numbered_sharp,),
                        ),
                        const SizedBox(height: 15,),
                        GestureDetector(
                          onTap: controller.moveToTollLocationScreen,
                          child: cardViewInDashboard(
                              textTitle: "TOLL LOCATIONS",
                              iconValue: Icons.location_on,),
                        ),
                        const SizedBox(height: 15,),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }


}