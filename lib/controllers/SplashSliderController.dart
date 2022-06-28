import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SplashSliderController extends GetxController{
  RxInt splashSliderIndex = 0.obs;

  onSplashSliderIndexChanged({required int index}){
    splashSliderIndex.value = index;
  }
}