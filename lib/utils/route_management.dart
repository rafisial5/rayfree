import 'package:get/get.dart';
import 'package:rayfree_toll/utils/bindings.dart';
import 'package:rayfree_toll/utils/constants.dart';
import 'package:rayfree_toll/view/car_owner_screens/add_money_screen.dart';
import 'package:rayfree_toll/view/car_owner_screens/car_owner_dashboard_screen.dart';
import 'package:rayfree_toll/view/car_owner_screens/car_owner_login_screen.dart';
import 'package:rayfree_toll/view/car_owner_screens/paid_toll_screen.dart';
import 'package:rayfree_toll/view/car_owner_screens/rate_list_screen.dart';
import 'package:rayfree_toll/view/car_owner_screens/send_money_screen.dart';
import 'package:rayfree_toll/view/car_owner_screens/toll_location_screen.dart';
import 'package:rayfree_toll/view/select_car_or_toll_screen.dart';
import 'package:rayfree_toll/view/toll_user_screens/collect_tax_screen.dart';
import 'package:rayfree_toll/view/toll_user_screens/record_of_vehicle_screen.dart';
import 'package:rayfree_toll/view/toll_user_screens/toll_dashboard_screen.dart';

import '../view/car_owner_screens/transaction_screen.dart';
import '../view/initials/signup/create_account_screen.dart';

class RouteManagement {
  static List<GetPage> getPages() {
    return [
      GetPage(
          name: kSelectCarOrTollScreenRoute,
          page: () => const SelectCarOrTollScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kCarOwnerLoginScreenRoute,
          page: () => const CarOwnerLoginScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kCarOwnerDashboardScreenRoute,
          page: () => const CarOwnerDashboardScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kAddMoneyScreenRoute,
          page: () => const AddMoneyScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kSendMoneyScreenRoute,
          page: () => const SendMoneyScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kRateListScreenRoute,
          page: () => const RateListScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kTransactionScreenRoute,
          page: () => const TransactionScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kPaidTollScreenRoute,
          page: () => const PaidTollScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kTollLocationScreenRoute,
          page: () => const TollLocationScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kTollDashboardScreenRoute,
          page: () => const TollDashboardScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kCollectTaxScreenRoute,
          page: () => const CollectTaxScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kRecordOfVehicleScreenRoute,
          page: () => const RecordOfVehicleScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kCreateAccountScreeenRoute,
          page: () => const CreateAccountScreen(),
          binding: ScreenBindings()),
    ];
  }
}
