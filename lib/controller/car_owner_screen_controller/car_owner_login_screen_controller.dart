import 'package:get/get.dart';

import '../../utils/constants.dart';

class CarOwnerLoginScreenController extends GetxController{

  void moveToCarOwnerDashBoardScreen(){
    Get.toNamed(kCarOwnerDashboardScreenRoute);
  }
}