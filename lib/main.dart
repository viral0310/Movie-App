import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/get_routes.dart';
import 'screen/home.dart';




void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Home(),
      getPages: AppPages.pages,
    );
  }
}