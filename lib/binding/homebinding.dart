import 'package:get/instance_manager.dart';
import 'package:movieapp/controller/homecontroller.dart';



class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() =>  HomeController());
  }

}