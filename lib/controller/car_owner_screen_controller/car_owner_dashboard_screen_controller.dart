import 'package:get/get.dart';
import 'package:rayfree_toll/utils/constants.dart';

class CarOwnerDashboardScreenController extends GetxController{

  void moveToAddMoneyScreen(){
    Get.toNamed(kAddMoneyScreenRoute);
  }
  void moveToSendMoneyScreen(){
    Get.toNamed(kSendMoneyScreenRoute);
  }
  void moveToTransactionScreen(){
    Get.toNamed(kTransactionScreenRoute);
  }
  void moveToRateListScreen(){
    Get.toNamed(kRateListScreenRoute);
  }
  void moveToPaidTollScreen(){
    Get.toNamed(kPaidTollScreenRoute);
  }
  void moveToTollLocationScreen(){
    Get.toNamed(kTollLocationScreenRoute);
  }

}