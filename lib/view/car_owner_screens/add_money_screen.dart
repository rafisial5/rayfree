import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayfree_toll/controller/car_owner_screen_controller/add_money_controller.dart';
import 'package:rayfree_toll/model/add_money_model_for_payment.dart';
import 'package:rayfree_toll/utils/colors.dart';
import 'package:rayfree_toll/view/constants_UI_widgets/background.dart';

class AddMoneyScreen extends GetView<AddMoneyController>{
  const AddMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return SafeArea(
       child: Scaffold(
         appBar: AppBar(
           backgroundColor: kBackground1Color,
           elevation: 0,
           title: Text("A D D  M O N E Y", style:  TextStyle(color: kYellowColor),),
         ),
         backgroundColor: kBackground1Color,
         body: Stack(
           children: [
             background(),
             Column(
               children: [
                  _customDropdown(
                     data: controller.paymentMethodFilteredList,
                     selectedValue: controller.selectedItem,
                     onItemChanged: (dropdownItem) {
                       controller.selectedItem.value = dropdownItem;
                     },
                   ),
                 const Divider(thickness: 2, indent: 8, endIndent: 8),
                  Expanded(
                      child:SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Obx(
                            () => Column(
                            children: [
                              for(AddMoneyModel model in controller.itemList)
                                if(controller.selectedItem.value == model.item || controller.selectedItem.value == "Select Payment Method" )
                                  containerView(model: model)
                            ],
                          ),
                        ),
                      )),
               ],
             )
           ],
         ),
       ));
  }
  Widget _customDropdown(
      {required RxList<String> data,
        required selectedValue,
        void Function(dynamic)? onItemChanged}) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(top: 20, bottom: 10, left: 8, right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kWhiteColor,
      ),
      child: Obx(
            () => DropdownButton(
          value: selectedValue.value,
          isExpanded: true,
          underline: const SizedBox(),
          style: const TextStyle(color: Colors.white),
          icon: const Icon(Icons.keyboard_arrow_down, size: 30),
          iconEnabledColor: Colors.black,
          items: data.map<DropdownMenuItem>((selectedItem) {
            return DropdownMenuItem(
              value: selectedItem,
              child: Text(
                selectedItem.toString(),
                style: const TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: onItemChanged,
        ),
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

  Widget containerView({required AddMoneyModel model}){
    return Visibility(
      visible: controller.cardVisible.value,
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 20,right: 20),
        padding: const EdgeInsets.all(10),
        width: Get.width,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(model.path, scale: 2,),
              ],
            ),
            Text("Send money in Company's ${model.item} account, to get Toll Credits in your account",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16
            ),),
            const Text("+923123456789" , style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            textField("Account Holder Name"),
            textField("TID Number"),
            const SizedBox(height: 5,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(500, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )
              ),
                onPressed: (){},
                child: const Text(
                  "SEND REQUEST",
                  style: TextStyle(
                    fontSize: 16
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

}