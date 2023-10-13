import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/controller/toll_user_controller/record_of_vehicle_controller.dart';
import 'package:rayfree_toll/utils/colors.dart';
import 'package:rayfree_toll/view/constants_UI_widgets/background.dart';

class RecordOfVehicleScreen extends GetView<RecordOfVehicleController>{
  const RecordOfVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground1Color,
      appBar: AppBar(
        title: Text(
          "RECORD OF VEHICLE",
          style: TextStyle(
            color: kYellowColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          background(),
          SingleChildScrollView(
            child: Column(
              children: [

              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cardInRecordOfVehicle(){
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                "Vehicle No.",
              )
            ],
          )
        ],
      ),
    );
  }


}