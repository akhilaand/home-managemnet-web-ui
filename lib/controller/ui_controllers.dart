import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UiClassControllers extends GetxController{
  var tag=0.obs;

  changeTagValue({required int newValue}){
    tag.value=newValue;
  }
}