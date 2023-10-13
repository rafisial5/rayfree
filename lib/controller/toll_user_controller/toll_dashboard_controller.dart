import 'package:get/get.dart';
import 'package:rayfree_toll/utils/constants.dart';

class TollDashboardController extends  GetxController{
  List<String> imgList = [
   "assets/images/toll_onec.jpg",
   "assets/images/toll_twoc.jpg",
   "assets/images/toll_three.jpg",
   "assets/images/toll_four.jpg",
   "assets/images/toll_fivec.jpg",
 ];

  void moveToCollectTaxScreen(){
   Get.toNamed(kCollectTaxScreenRoute);
  }
  void moveToRecordOfVehicleScreen(){
   Get.toNamed(kRecordOfVehicleScreenRoute);
  }
}