import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/Model/model_get_movies.dart';
import 'package:movieapp/api/api_repositary.dart';
import 'package:movieapp/controller/base_controller.dart';
import 'package:movieapp/device/app_utility.dart';
import 'package:movieapp/resource/app_string.dart';

class HomeController extends BaseController {
  @override
  void errorHandler() {

  }
  @override
  void onInit() {
    super.onInit();
    getPopularMovie();
    getTopRatedMovie();
    getUpComingMovie();
  }

  Rx<ModelGetMovie> popularMovieDetails = ModelGetMovie().obs;
  Rx<ModelGetMovie> topRatedMovieDetails = ModelGetMovie().obs;
  Rx<ModelGetMovie> upComingMovieDetails = ModelGetMovie().obs;
  var popularMovieList = <Results>[].obs;
  RxBool isPopularApiLoading = true.obs;
  RxBool isUpComingApiLoading = true.obs;
  RxBool isTopRatedApiLoading = true.obs;
  BuildContext? context;


  getPopularMovie({int? pag}) async {
    isPopularApiLoading.value = true;
    ModelGetMovie? master =
    await ApiRepository().getPopularMovie(
        onNoInternet: () {
      AppUtility.showRedToastMessage(context, AppStrings.strNoInternetConnection);
    });
      if (master != null) {
        isPopularApiLoading.value = false;

          popularMovieDetails.value = master;
          popularMovieList.addAll(master.results!);

      }
      else {
        AppUtility.showRedToastMessage(context, 'data not found');
      }
  }

  getTopRatedMovie() async {
    isTopRatedApiLoading.value = true;
    ModelGetMovie? master =
    await ApiRepository().getTopRatedMovie(onNoInternet: () {
      AppUtility.showRedToastMessage(context, AppStrings.strNoInternetConnection);
    });
    if (master != null) {
      isTopRatedApiLoading.value = false;
      topRatedMovieDetails.value = master;
    } else {
      AppUtility.showRedToastMessage(context, 'data not found');
    }
  }

  getUpComingMovie() async {
    isUpComingApiLoading.value = true;
    ModelGetMovie? master =
    await ApiRepository().getUpComingMovie(onNoInternet: () {
      AppUtility.showRedToastMessage(context, AppStrings.strNoInternetConnection);
    });
    if (master != null) {
      isUpComingApiLoading.value = false;
      upComingMovieDetails.value = master;
    } else {
      AppUtility.showRedToastMessage(context, 'data not found');
    }
  }
}