import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:rayfree_toll/utils/colors.dart';

import '../../controller/car_owner_screen_controller/send_money_controller.dart';
import '../constants_UI_widgets/background.dart';

class SendMoneyScreen extends GetView<SendMoneyController>{
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kBackground1Color,
            elevation: 0,
            title: Text(
              "S E N D  M O N E Y",
              style: TextStyle(
                color: kYellowColor
              ),
            ),
          ),
          backgroundColor: kBackground1Color,
          body: Stack(
            children: [
              background(),
              Column(
                children: [
                  sendMoneyCard(),
                ],
              )

            ],
          ),
        ));
  }
  Widget sendMoneyCard(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
     margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kWhiteColor,
      ),
      child: Column(
        children: [
           Text(
            "Send Credits To an Other RayFree Account",
             style: TextStyle(
               fontSize: 18,
               color: kBlackColor,
             ),
          ),
          const SizedBox(height: 10,),
          textField("Receiver's Plate Number"),
          textField("Toll Credits"),
          textField("Password"),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(500, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
              ),
              onPressed: (){},
              child: const Text(
                "SEND CREDITS",
                style: TextStyle(
                    fontSize: 16
                ),
              )
          )
        ],
      ),
    );
  }

  Widget textField(String title){
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1.5, color: kBlackColor)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(title),
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: title,
                ),
              ),
            ],
          ),
        )
    );
  }

}