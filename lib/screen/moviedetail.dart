import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/controller/movie_detail_controller.dart';
import 'package:movieapp/resource/app_colors.dart';
import 'package:movieapp/resource/app_style.dart';



class MovieDetail extends GetView<MovieDetailController> {
  MovieDetail({Key? key}) : super(key: key);
  static String pageId = "/movieDetail";
  final controllerr = Get.put(MovieDetailController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.black),
          elevation: 2,
          backgroundColor: AppColors.red,
          centerTitle: true,
          leading: InkWell(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back_rounded,size: 20,color: AppColors.black,)),
          title:Text(
            'Movie Detail',
            style: TextStyle(
                fontSize: 18,
                color: AppColors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
      body:
    Obx(()=> controllerr.isApiLoading.value
    ?   Center(
    child: CircularProgressIndicator(
    color: AppColors.red,
    ),
    ):
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          AppStyle.customImageCard(context: context,
              imagePath: controllerr.movieDetails.value.posterPath.toString(),
            height: 0.50,
            width: 0.80,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyle.space(0.005, 0.0, context),
              AppStyle.text(title: controllerr.movieDetails.value.originalTitle.toString(),
                fontSize: 18,
                tColor: AppColors.black,
                textWeight: FontWeight.w500,
              ),
              AppStyle.space(0.005, 0.0, context),
              AppStyle.text(title: controllerr.movieDetails.value.overview.toString(),
                fontSize: 14,
                tColor: AppColors.darkGray,
                textWeight: FontWeight.w500,
              ),
              AppStyle.space(0.01, 0.0, context),
              AppStyle.text(title: 'Release Date: ${controllerr.movieDetails.value.releaseDate.toString()}',
                fontSize: 12,
                tColor: AppColors.darkGray,
                textWeight: FontWeight.w400,
              ),
              AppStyle.space(0.005, 0.0, context),

              AppStyle.text(title: 'Popularity: ${controllerr.movieDetails.value.popularity.toString()}',
                fontSize: 12,
                tColor: AppColors.darkGray,
                textWeight: FontWeight.w400,
              ),
              AppStyle.space(0.005, 0.0, context),
              AppStyle.text(title: 'Vote Count: ${controllerr.movieDetails.value.voteCount.toString()}',
                fontSize: 12,
                tColor: AppColors.darkGray,
                textWeight: FontWeight.w400,
              ),
              AppStyle.space(0.005, 0.0, context),
              AppStyle.text(title: 'Vote Average: ${controllerr.movieDetails.value.voteAverage.toString()}',
                fontSize: 12,
                tColor: AppColors.darkGray,
                textWeight: FontWeight.w400,
              ),
            ],
          ),
        ],
        ),
      ),
    ),
    );
  }
}
