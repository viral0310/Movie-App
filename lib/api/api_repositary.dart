import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/Model/model_get_movies.dart';
import 'package:movieapp/Model/model_movie_details.dart';
import 'package:movieapp/resource/app_string.dart';
import 'api_path.dart';



class ApiRepository {
  void showApiLog(String message) {
    print(message);
  }

  // Future<Map<String, String>> getHeaderWithToken() async {
  //   String? authToken = await AppPreference.readString(AppPreference.authToken);
  //
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'token': authToken!,
  //     'language': 'da'
  //   };
  //   return headers;
  // }

  // Login API
  // Future<ModelLogin?> loginApi(
  //     {required String userName,
  //       required String password,
  //
  //       VoidCallback? onNoInternet}) async {
  //   final connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.none) {
  //     if (onNoInternet != null) onNoInternet();
  //     return null;
  //   }
  //
  //   const String tag = 'login';
  //   ModelLogin? data;
  //   String? deviceType = '';
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   if (Platform.isAndroid) {
  //     AndroidDeviceInfo info = await deviceInfo.androidInfo;
  //     deviceType = "android";
  //   } else {
  //     IosDeviceInfo info = await deviceInfo.iosInfo;
  //     deviceType = "ios";
  //   }
  //
  //   var body = {
  //     ApiPath.userName: userName,
  //     ApiPath.passWord: password,
  //     ApiPath.deviceType: deviceType,
  //     // ApiPath.deviceToken:await getFcmToken(),
  //   };
  //   var rawBody = json.encode(body);
  //   showApiLog('$tag body: $rawBody');
  //
  //   var url = Uri.parse(ApiPath.login);
  //   showApiLog('$tag URL: $url');
  //
  //   try {
  //     final response = await http.post(
  //       url,
  //       body: body,
  //       //headers: {'Content-Type': 'application/json'},
  //     );
  //     showApiLog('$tag Response: Status Code: ${response.statusCode}');
  //     showApiLog('$tag Response: ${response.body}');
  //     var decodedResult = jsonDecode(response.body);
  //     data = ModelLogin.fromJson(decodedResult);
  //     return data;
  //   } on SocketException {
  //     showApiLog('$tag ${AppStrings.strNoInternetConnection}');
  //     return null;
  //   } catch (error) {
  //     showApiLog('$tag Error: ${error.toString()}');
  //     return null;
  //   }
  // }

  Future<ModelGetMovie?> getPopularMovie(
      {int? pageCount,VoidCallback? onNoInternet}) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (onNoInternet != null) onNoInternet();
      return null;
    }
    const String tag = 'getPopularMovie';
    ModelGetMovie? data;
    var store = {'api_key':'9776330dc76bf80fa28e9cde5742a552'};
    String quaryString = Uri(queryParameters: store).query;
    //
    // var pageNO = {'page': pageCount};
    // String quaryPageString = Uri(queryParameters: pageNO).query;

    var url = Uri.parse('${ApiPath.getPopularMovies}?$quaryString');
    showApiLog('$tag URL: $url');
    try {
      var response = await http.get(url,);
      showApiLog('$tag Response: Status Code: ${response.statusCode}');
      showApiLog('$tag Response: ${response.body}');
      var decodedResult = jsonDecode(response.body);
      data = ModelGetMovie.fromJson(decodedResult);
      return data;
    } on SocketException {
      showApiLog('$tag ${AppStrings.strNoInternetConnection}');
      return null;
    } catch (error) {
      showApiLog('$tag Error: ${error.toString()}');
      return null;
    }
  }

  Future<ModelGetMovie?> getTopRatedMovie(
      { VoidCallback? onNoInternet}) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (onNoInternet != null) onNoInternet();
      return null;
    }
    const String tag = 'getTopRatedMovie';
    ModelGetMovie? data;

    var store = {'api_key':'9776330dc76bf80fa28e9cde5742a552'};
    String quaryString = Uri(queryParameters: store).query;

    var url = Uri.parse('${ApiPath.getTopRatedMovies}?$quaryString');
    showApiLog('$tag URL: $url');

    try {
      var response = await http.get(url,);
      showApiLog('$tag Response: Status Code: ${response.statusCode}');
      showApiLog('$tag Response: ${response.body}');
      var decodedResult = jsonDecode(response.body);
      data = ModelGetMovie.fromJson(decodedResult);
      return data;
    } on SocketException {
      showApiLog('$tag ${AppStrings.strNoInternetConnection}');
      return null;
    } catch (error) {
      showApiLog('$tag Error: ${error.toString()}');
      return null;
    }
  }

  Future<ModelGetMovie?> getUpComingMovie(
      { VoidCallback? onNoInternet}) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (onNoInternet != null) onNoInternet();
      return null;
    }
    const String tag = 'getUpComingMovie';
    ModelGetMovie? data;
    var store = {'api_key':'9776330dc76bf80fa28e9cde5742a552'};
    String quaryString = Uri(queryParameters: store).query;
    var url = Uri.parse('${ApiPath.getUpcomingMovies}?$quaryString');
    showApiLog('$tag URL: $url');
    try {
      var response = await http.get(url,);
      showApiLog('$tag Response: Status Code: ${response.statusCode}');
      showApiLog('$tag Response: ${response.body}');
      var decodedResult = jsonDecode(response.body);
      data = ModelGetMovie.fromJson(decodedResult);
      return data;
    } on SocketException {
      showApiLog('$tag ${AppStrings.strNoInternetConnection}');
      return null;
    } catch (error) {
      showApiLog('$tag Error: ${error.toString()}');
      return null;
    }
  }

  Future<ModelMovieDetails?> getMovieDetail(
      { VoidCallback? onNoInternet, int? id}) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (onNoInternet != null) onNoInternet();
      return null;
    }
    const String tag = 'getMovieDetail';
    ModelMovieDetails? data;
    var store = {'api_key':'9776330dc76bf80fa28e9cde5742a552'};
    String quaryString = Uri(queryParameters: store).query;
    var url = Uri.parse('${ApiPath.getMovieDetail}$id?$quaryString');
    showApiLog('$tag URL: $url');
    try {
      var response = await http.get(url);
      showApiLog('$tag Response: Status Code: ${response.statusCode}');
      showApiLog('$tag Response: ${response.body}');
      var decodedResult = jsonDecode(response.body);
      data = ModelMovieDetails.fromJson(decodedResult);
      return data;
    } on SocketException {
      showApiLog('$tag ${AppStrings.strNoInternetConnection}');
      return null;
    } catch (error) {
      showApiLog('$tag Error: ${error.toString()}');
      return null;
    }
  }

}
