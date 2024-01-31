import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movieapp/binding/homebinding.dart';
import 'package:movieapp/binding/movie_detail_binding.dart';
import 'package:movieapp/screen/home.dart';
import 'package:movieapp/screen/moviedetail.dart';


class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Home.pageId,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: MovieDetail.pageId,
      page: () => MovieDetail(),
      binding: MovieDetailBinding(),
    ),
  ];
}