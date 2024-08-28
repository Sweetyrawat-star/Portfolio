import 'package:flutter/material.dart';
import 'package:portfolio/components/app_extensions.dart';

import '../../../constants.dart';
import '../../../responsive_layout.dart';

class SocalCard extends StatefulWidget {
  const SocalCard({
    this.iconSrc,
    this.name,
    this.color,
    required this.press,
  });

  final String ?iconSrc;
  final String ?name;
  final Color ?color;
  final void Function() press;

  @override
  _SocalCardState createState() => _SocalCardState();
}

class _SocalCardState extends State<SocalCard> {
  bool isHover = false;
  double ?padding,verticalPadding;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double minHeight;
    if (size.width > DeviceType.largeScreenDesktop.getMaxWidth()) {
      // Web/Desktop
      minHeight = 200;
      padding =  kDefaultPadding / 2;
      verticalPadding = kDefaultPadding * 1.0;
    } else if (size.width > DeviceType.ipad.getMaxWidth()) {
      // Tablet
      minHeight = 200;
      padding =  kDefaultPadding / 2;
      verticalPadding = kDefaultPadding * 1.0;
    } else {
      // Mobile
      minHeight = 360;padding =  0;
      verticalPadding = 0;

    }

    return FittedBox(
      child: InkWell(
        onTap: widget.press,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: AnimatedContainer(
          width: minHeight,
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            vertical: padding!,
           horizontal: verticalPadding!,
          ),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [if (isHover) kDefaultCardShadow],
          ),
          child: Row(
            children: [
              Image.asset(
                widget.iconSrc!,
                height: 80,
                width: 80,fit: BoxFit.contain,
              ),
              const SizedBox(width: kDefaultPadding),
              Text(widget.name!),
            ],
          ),
        ),
      ),
    );
  }
}
