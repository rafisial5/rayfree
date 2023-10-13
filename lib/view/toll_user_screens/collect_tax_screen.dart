import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/controller/toll_user_controller/collect_tax_controller.dart';
import 'package:rayfree_toll/utils/colors.dart';
import 'package:rayfree_toll/view/constants_UI_widgets/background.dart';

class CollectTaxScreen extends GetView<CollectTaxController>{
  const CollectTaxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: kBackground1Color,
      appBar: AppBar(
      title: Text(
        "COLLECT TAX",
        style: TextStyle(
          color: kYellowColor
        ),
      ),
    ),
    body:  Stack(
      children: [
        background(),
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: kWhiteColor.withOpacity(0.2),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Obx(
                  () => Text(
                    controller.scannedText.value == "" ? "COLLECT TAX OF VEHICLE" :
                    controller.scannedText.value.toString(),
                    style: TextStyle(
                      color: kBlackColor,
                      fontSize: 22,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kWhiteColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Column(
                      children: [
                        Text("Enter Plate Number of Vehicle",
                        style: TextStyle(
                          color: kBlackColor,
                          fontSize: 18,
                        ),),
                        const SizedBox(height: 15,),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: kBlackColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: kBlackColor)),
                            hintText: "ABC 123"
                          ),
                          textAlign: TextAlign.center,
                        ),
                        // controller.imageFile! != null ?
                        // Image.file(File(controller.imageFile!.path)) :
                        Container(
                          width: 300,
                          height: 300,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 20,),
                        ElevatedButton(
                            onPressed: (){
                              controller.getImage();
                            },
                            child: const Text(
                              "COLLECT TAX",
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(500, 50)
                          ),

                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    )


  );
  }

}