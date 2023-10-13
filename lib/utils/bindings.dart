import 'package:get/get.dart';
import 'package:rayfree_toll/controller/car_owner_screen_controller/add_money_controller.dart';
import 'package:rayfree_toll/controller/car_owner_screen_controller/car_owner_dashboard_screen_controller.dart';
import 'package:rayfree_toll/controller/car_owner_screen_controller/car_owner_login_screen_controller.dart';
import 'package:rayfree_toll/controller/car_owner_screen_controller/paid_toll_controller.dart';
import 'package:rayfree_toll/controller/car_owner_screen_controller/rate_list_controller.dart';
import 'package:rayfree_toll/controller/car_owner_screen_controller/send_money_controller.dart';
import 'package:rayfree_toll/controller/car_owner_screen_controller/toll_location_controller.dart';
import 'package:rayfree_toll/controller/car_owner_screen_controller/transaction_controller.dart';
import 'package:rayfree_toll/controller/select_car_or_toll_controller.dart';
import 'package:rayfree_toll/controller/toll_user_controller/collect_tax_controller.dart';
import 'package:rayfree_toll/controller/toll_user_controller/toll_dashboard_controller.dart';

import '../controller/car_owner_screen_controller/create_account_controller.dart';
import '../controller/toll_user_controller/record_of_vehicle_controller.dart';

class ScreenBindings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => SelectCarOrTollController());
   Get.lazyPut(() => CarOwnerLoginScreenController());
   Get.lazyPut(() => CarOwnerDashboardScreenController());
   Get.lazyPut(() => AddMoneyController());
   Get.lazyPut(() => SendMoneyController());
   Get.lazyPut(() => TransactionController());
   Get.lazyPut(() => PaidTollController());
   Get.lazyPut(() => RateListController());
   Get.lazyPut(() => TollLocationController());
   Get.lazyPut(() => TollDashboardController());
   Get.lazyPut(() => CollectTaxController());
   Get.lazyPut(() => RecordOfVehicleController());
   Get.lazyPut(() => CreateAccountController());
  }
  
}