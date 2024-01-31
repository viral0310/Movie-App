import 'package:flutter/material.dart';
import 'package:movieapp/device/device_utils.dart';
import 'package:movieapp/resource/app_colors.dart';

class AppStyle {


  static Widget text({
    String? title,
    TextAlign? align,
    double? fontSize,
    String? family,
    Color? tColor,
    FontWeight? textWeight,
    int? maxLine,
    TextOverflow? overflowDot,

  }) {
    return Text(
      title!,
      textAlign: align ?? TextAlign.start,
      overflow: overflowDot,
      maxLines: maxLine,
      style: TextStyle(
        fontFamily: 'AppFont',
        fontSize: fontSize ?? 12,
        fontWeight: textWeight ?? FontWeight.w300,
        color: tColor ?? AppColors.darkGray,
        letterSpacing: 0.06,
      ),
    );
  }


  static Widget space(double? height, double? width, context) {
    return SizedBox(
      height: DeviceUtils.getScaledHeight(context, height!),
      width: DeviceUtils.getScaledWidth(context, width!),
    );
  }

  static Widget customMovieCard({BuildContext? context,
  Widget? column,
  }) {
    return Container(
    height: DeviceUtils.getScaledWidth(context!, 0.54),
    width: DeviceUtils.getScaledHeight(context!, 0.43),
    decoration: BoxDecoration(
    color: Colors.white,
    // Red border with the width is equal to 5
    boxShadow: [
    BoxShadow(
    color: AppColors.red,
    blurRadius: 0.5, // soften the shadow
    spreadRadius: 0.5, //extend the shadow
    )
    ],
    borderRadius: BorderRadius.circular(10),
    ),
    child: column!,
   );
  }

  static Widget customImageCard({BuildContext? context,
    String? imagePath,
    double? height,
    double? width,
  }) {
    return Container(
        height: DeviceUtils.getScaledWidth(context!, width ?? 0.495),
        width: DeviceUtils.getScaledHeight(context!, height ?? 0.15),
        child: Image.network('https://image.tmdb.org/t/p/w500${imagePath!}',));
  }




}