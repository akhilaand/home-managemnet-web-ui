// Package imports:
import 'package:get/get.dart';

class SliderController extends GetxController{
  var value=0.0.obs;

  changeSliderValue(double newValue){
    value.value=newValue;
  }

}
