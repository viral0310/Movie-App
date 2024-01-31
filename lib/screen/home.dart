import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/controller/homecontroller.dart';
import 'package:movieapp/device/device_utils.dart';
import 'package:movieapp/resource/app_colors.dart';
import 'package:movieapp/resource/app_style.dart';
import 'package:movieapp/screen/moviedetail.dart';


class Home extends GetView<HomeController> {
  Home({Key? key}) : super(key: key);
  static String pageId = "/home";
  final controllerr = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,

      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.black),
          elevation: 2,
          backgroundColor: AppColors.red,
          centerTitle: true,

          title:Text(
            'Movies List',
            style: TextStyle(
                fontSize: 18,
                color: AppColors.white,
                fontWeight: FontWeight.w500),
          ),
          bottom: TabBar(
            indicatorColor: AppColors.yellow,
            onTap: (int index){
              if(index == 0){
                 controllerr.getPopularMovie();
              }
              else if (index == 1){
                controllerr.getTopRatedMovie();
              }
              else{
                controllerr.getUpComingMovie();
              }
            },
            labelColor: AppColors.yellow,
            unselectedLabelColor: AppColors.white,
            indicatorWeight: 3.0,

            tabs: const [
              Tab(text: 'Populer',),
              Tab(text: 'Top Rated'),
              Tab(text: 'Up Coming'),
            ],
          ),
        ),
        body: TabBarView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                Expanded(
                  child: Obx(()=> controllerr.isPopularApiLoading.value && controllerr.popularMovieList.isEmpty
      ?   Center(
      child: CircularProgressIndicator(
        color: AppColors.red,
      ),
    ):ListView.builder(
                    shrinkWrap: true,

                   // controller: controllerr.scrollcontroller,
                    itemCount: controllerr.popularMovieList!.length,
                   itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Get.toNamed(MovieDetail.pageId,
                                  arguments:
                                  controllerr.popularMovieList[index].id);
                            },
                            child: AppStyle.customMovieCard(context: context,
                            column: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      AppStyle.customImageCard(context: context, imagePath: controllerr.popularMovieDetails.value.results![index].posterPath.toString()),
                                      AppStyle.space(0.0, 0.033, context),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width: DeviceUtils.getScaledWidth(context, 0.51),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            AppStyle.text(title: controllerr.popularMovieList[index].originalTitle.toString(),
                                              maxLine: 2,
                                              overflowDot: TextOverflow.ellipsis,
                                              fontSize: 18,
                                              tColor: AppColors.black,
                                              textWeight: FontWeight.w500,
                                            ),
                                            AppStyle.space(0.005, 0.0, context),
                                            AppStyle.text(title: controllerr.popularMovieList[index].overview.toString(),
                                              maxLine: 3,
                                              overflowDot: TextOverflow.ellipsis,
                                              fontSize: 14,
                                              tColor: AppColors.darkGray,
                                              textWeight: FontWeight.w500,
                                            ),
                                            AppStyle.space(0.01, 0.0, context),
                                            AppStyle.text(title: 'Release Date: ${controllerr.popularMovieList[index].releaseDate.toString()}',
                                              fontSize: 12,
                                              tColor: AppColors.darkGray,
                                              textWeight: FontWeight.w400,
                                            ),
                                            AppStyle.space(0.005, 0.0, context),

                                            AppStyle.text(title: 'Popularity: ${controllerr.popularMovieList[index].popularity.toString()}',
                                              fontSize: 12,
                                              tColor: AppColors.darkGray,
                                              textWeight: FontWeight.w400,
                                            ),
                                            AppStyle.space(0.005, 0.0, context),
                                            AppStyle.text(title: 'Vote Count: ${controllerr.popularMovieList[index].voteCount.toString()}',
                                              fontSize: 12,
                                              tColor: AppColors.darkGray,
                                              textWeight: FontWeight.w400,
                                            ),
                                            AppStyle.space(0.005, 0.0, context),
                                            AppStyle.text(title: 'Vote Average: ${controllerr.popularMovieList[index].voteAverage.toString()}',
                                              fontSize: 12,
                                              tColor: AppColors.darkGray,
                                              textWeight: FontWeight.w400,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],),
                        ),
                          ),
                      )
                      );
                    }
                  ),
                  ),
                ),
                // Obx(() => controllerr.loadingPopularMovie.value==true
                //     ? CircularProgressIndicator(color: AppColors.red,)
                //     : const SizedBox(
                //   width: 0,
                //   height: 0,
                // ))
              ],
            ),
            Obx(()=> controllerr.isTopRatedApiLoading.value
    ?   Center(
    child: CircularProgressIndicator(
    color: AppColors.red,
    ),
    ):ListView.builder(
              itemCount: controllerr.topRatedMovieDetails.value.results!.length,
              itemBuilder: (context, index) {
                return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Get.toNamed(MovieDetail.pageId,
                              arguments:
                              controllerr.topRatedMovieDetails.value.results![index].id);
                        },
                        child: AppStyle.customMovieCard(context: context,
                          column:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    AppStyle.customImageCard(context: context, imagePath: controllerr.topRatedMovieDetails.value.results![index].posterPath.toString()),
                                    AppStyle.space(0.0, 0.033, context),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: DeviceUtils.getScaledWidth(context, 0.51),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppStyle.text(title: controllerr.topRatedMovieDetails.value.results![index].originalTitle.toString(),
                                            maxLine: 2,
                                            overflowDot: TextOverflow.ellipsis,
                                            fontSize: 18,
                                            tColor: AppColors.black,
                                            textWeight: FontWeight.w500,
                                          ),
                                          AppStyle.space(0.005, 0.0, context),
                                          AppStyle.text(title: controllerr.topRatedMovieDetails.value.results![index].overview.toString(),
                                            maxLine: 3,
                                            overflowDot: TextOverflow.ellipsis,
                                            fontSize: 14,
                                            tColor: AppColors.darkGray,
                                            textWeight: FontWeight.w500,
                                          ),
                                          AppStyle.space(0.01, 0.0, context),
                                          AppStyle.text(title: 'Release Date: ${controllerr.topRatedMovieDetails.value.results![index].releaseDate.toString()}',
                                            fontSize: 12,
                                            tColor: AppColors.darkGray,
                                            textWeight: FontWeight.w400,
                                          ),
                                          AppStyle.space(0.005, 0.0, context),

                                          AppStyle.text(title: 'Popularity: ${controllerr.topRatedMovieDetails.value.results![index].popularity.toString()}',
                                            fontSize: 12,
                                            tColor: AppColors.darkGray,
                                            textWeight: FontWeight.w400,
                                          ),
                                          AppStyle.space(0.005, 0.0, context),
                                          AppStyle.text(title: 'Vote Count: ${controllerr.topRatedMovieDetails.value.results![index].voteCount.toString()}',
                                            fontSize: 12,
                                            tColor: AppColors.darkGray,
                                            textWeight: FontWeight.w400,
                                          ),
                                          AppStyle.space(0.005, 0.0, context),
                                          AppStyle.text(title: 'Vote Average: ${controllerr.topRatedMovieDetails.value.results![index].voteAverage.toString()}',
                                            fontSize: 12,
                                            tColor: AppColors.darkGray,
                                            textWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],),
                        ),
                      ),
                    )
                );
              }
          ),
            ),
          Obx(()=> controllerr.isUpComingApiLoading.value
    ?   Center(
    child: CircularProgressIndicator(
    color: AppColors.red,
    ),
    ):
        ListView.builder(
            itemCount: controllerr.upComingMovieDetails.value.results!.length,
            itemBuilder: (context, index) {
              return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Get.toNamed(MovieDetail.pageId,
                            arguments: controllerr.upComingMovieDetails.value.results![index].id);
                      },
                      child: AppStyle.customMovieCard(context: context,
                        column:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  AppStyle.customImageCard(context: context, imagePath: controllerr.upComingMovieDetails.value.results![index].posterPath.toString()),
                                  AppStyle.space(0.0, 0.033, context),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: DeviceUtils.getScaledWidth(context, 0.51),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AppStyle.text(title: controllerr.upComingMovieDetails.value.results![index].originalTitle.toString(),
                                          maxLine: 2,
                                          overflowDot: TextOverflow.ellipsis,
                                          fontSize: 18,
                                          tColor: AppColors.black,
                                          textWeight: FontWeight.w500,
                                        ),
                                        AppStyle.space(0.005, 0.0, context),
                                        AppStyle.text(title: controllerr.upComingMovieDetails.value.results![index].overview.toString(),
                                          maxLine: 3,
                                          overflowDot: TextOverflow.ellipsis,
                                          fontSize: 14,
                                          tColor: AppColors.darkGray,
                                          textWeight: FontWeight.w500,
                                        ),
                                        AppStyle.space(0.01, 0.0, context),
                                        AppStyle.text(title: 'Release Date: ${controllerr.upComingMovieDetails.value.results![index].releaseDate.toString()}',
                                          fontSize: 12,
                                          tColor: AppColors.darkGray,
                                          textWeight: FontWeight.w400,
                                        ),
                                        AppStyle.space(0.005, 0.0, context),

                                        AppStyle.text(title: 'Popularity: ${controllerr.upComingMovieDetails.value.results![index].popularity.toString()}',
                                          fontSize: 12,
                                          tColor: AppColors.darkGray,
                                          textWeight: FontWeight.w400,
                                        ),
                                        AppStyle.space(0.005, 0.0, context),
                                        AppStyle.text(title: 'Vote Count: ${controllerr.upComingMovieDetails.value.results![index].voteCount.toString()}',
                                          fontSize: 12,
                                          tColor: AppColors.darkGray,
                                          textWeight: FontWeight.w400,
                                        ),
                                        AppStyle.space(0.005, 0.0, context),
                                        AppStyle.text(title: 'Vote Average: ${controllerr.upComingMovieDetails.value.results![index].voteAverage.toString()}',
                                          fontSize: 12,
                                          tColor: AppColors.darkGray,
                                          textWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],),
                      ),
                    ),
                  )
              );
            }
        ),
          ),
          ],
        ),
        // SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.all(15.0),
        //     child: Column(
        //       children: [
        //
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
