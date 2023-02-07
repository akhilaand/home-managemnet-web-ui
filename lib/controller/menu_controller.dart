import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:home_management_week6/routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = livingRoomRoute.obs;

  chanegActiveIten(String itemName){
    activeItem.value=itemName;
  }
}
