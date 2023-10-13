import 'package:get/get.dart';
import 'package:rayfree_toll/model/add_money_model_for_payment.dart';

class AddMoneyController extends GetxController{

  RxList<AddMoneyModel> itemList = [
    AddMoneyModel.positioned( "Jazz Cash", "assets/images/jazz.png"),
    AddMoneyModel.positioned("Easy Paisa", "assets/images/easypaisa.png"),
    AddMoneyModel.positioned("HBL Bank", "assets/images/hbl.png"),
    AddMoneyModel.positioned("Allied Bank", "assets/images/allied.png"),
    AddMoneyModel.positioned("Meezan Bank", "assets/images/meezan.png"),
  ].obs;

  RxList<String> paymentMethodFilteredList = RxList();
  Rx<String> selectedItem = "Select Payment Method".obs;
  RxBool cardVisible = true.obs;

  void getMethodsFromList(){
    for(AddMoneyModel model in itemList){
      paymentMethodFilteredList.addIf(!paymentMethodFilteredList.contains(model.item), model.item);
    }
    paymentMethodFilteredList.insert(0, 'Select Payment Method');
  }

  @override
  void onInit() {
    getMethodsFromList();
    super.onInit();
  }


}