import 'package:get/instance_manager.dart';
import 'package:movieapp/controller/movie_detail_controller.dart';




class MovieDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailController>(() =>  MovieDetailController());
  }

}