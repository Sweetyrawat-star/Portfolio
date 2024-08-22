import 'package:flutter/material.dart';
import 'package:portfolio/components/app_extensions.dart';

import '../../../responsive_layout.dart';

class PersonPic extends StatelessWidget {
  const PersonPic({super.key});

  @override
  Widget build(BuildContext context) {
    double maxHeight, maxWidth;
    Size size = MediaQuery.of(context).size;
    if (size.width > DeviceType.largeScreenDesktop.getMaxWidth()) {
      // Web/Desktop
      maxWidth= 639;
      maxHeight= 860;
    } else if (size.width > DeviceType.ipad.getMaxWidth()) {
      // Tablet
      maxHeight = 600;
      maxWidth = 450;
    } else {
      // Mobile
      maxHeight = 350;
      maxWidth = 300;
    }


    return  Container(
      constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
      child: Image.asset("assets/images/developer.png"),
    );
  }
}
