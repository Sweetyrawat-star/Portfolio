import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/components/app_extensions.dart';
import '../../constants.dart';
import '../../responsive_layout.dart';
import 'components/logo_blur_box.dart';
import 'components/menu.dart';
import 'components/person_pic.dart';

class TopSection extends StatelessWidget {
  final Function(int) onMenuItemClicked;

  const TopSection({super.key, required this.onMenuItemClicked});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double maxHeight, minHeight;
    if (size.width > DeviceType.largeScreenDesktop.getMaxWidth()) {
      // Web/Desktop
      maxHeight = 900;
      minHeight = 700;
    } else if (size.width > DeviceType.ipad.getMaxWidth()) {
      // Tablet
      maxHeight = 600;
      minHeight = 500;
    } else {
      // Mobile
      maxHeight = 400;
      minHeight = 300;
    }

    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        minHeight: minHeight,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bac8.jpg"),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: kDefaultPadding),
        width: 1200,
        child: Stack(
          children: [
            LogoAndBlurBox(size: size),
            const Positioned(
              bottom: 0,
              right: 0,
              child: PersonPic(),
            ),
            Positioned(
              bottom: 0,
              child: Menu(
                onMenuItemClicked: onMenuItemClicked,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
