import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/components/app_extensions.dart';
import '../../../components/app_styles.dart';
import '../../../constants.dart';
import '../../../responsive_layout.dart';

class GlassContent extends StatelessWidget {
  const GlassContent({
    this.size,
  });

  final Size? size;

  @override
  Widget build(BuildContext context) {
    // Determine the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine the constraints and styles based on the screen width
    double maxWidth, maxHeight;
    TextStyle textStyle;
    TextStyle? textStyle2;
    String developerName;

    if (screenWidth > DeviceType.smallScreenLaptop.getMaxWidth()) {
      // Web/Desktop
      maxWidth = 1110;
      maxHeight = size!.height * 0.7;
      textStyle = AppStyles.s52;
      developerName = "Sweety \nRawat";
      textStyle2 =  AppStyles.s32;

    } else if (screenWidth > DeviceType.ipad.getMaxWidth()) {
      // Tablet
      maxWidth = 750;
      maxHeight = size!.height * 0.6;
      textStyle = AppStyles.s32;
      developerName = "Sweety Rawat";
      textStyle2 =  AppStyles.s32;
    } else {
      // Mobile
      maxWidth = 550;
      developerName = "Sweety Rawat";
      maxHeight = size!.height * 0.4;
      textStyle = AppStyles.s14;
      textStyle2 =  AppStyles.s18;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
          width: double.infinity,
          color: Colors.white.withOpacity(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello There!",
                style: textStyle2
              ),
              Text(
                developerName,
                style: textStyle,
                softWrap: true,
              ),
              Text(
                "Mobile App Developer",
                style: textStyle2
              ),
            ],
          ),
        ),
      ),
    );
  }
}
