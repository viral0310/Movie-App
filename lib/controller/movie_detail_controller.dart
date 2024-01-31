import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/Model/model_get_movies.dart';
import 'package:movieapp/Model/model_movie_details.dart';
import 'package:movieapp/api/api_repositary.dart';
import 'package:movieapp/controller/base_controller.dart';
import 'package:movieapp/device/app_utility.dart';
import 'package:movieapp/resource/app_string.dart';

class MovieDetailController extends BaseController {
  @override
  void errorHandler() {

  }
  int? movieId;
  @override
  void onInit() async{
    super.onInit();
    movieId = Get.arguments;
    await getMovieDetails(mId: movieId);
  }


  Rx<ModelMovieDetails> movieDetails = ModelMovieDetails().obs;
  RxBool isApiLoading = true.obs;
  BuildContext? context;

  getMovieDetails({int? mId}) async {
    isApiLoading.value = true;
    ModelMovieDetails? master = await ApiRepository().getMovieDetail(
        id: mId,
        onNoInternet: () {
      AppUtility.showRedToastMessage(context, AppStrings.strNoInternetConnection);
    });
    if (master != null) {
      isApiLoading.value = false;
      movieDetails.value = master;
    } else {
      AppUtility.showRedToastMessage(context, 'data not found');
    }
  }


}