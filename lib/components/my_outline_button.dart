import 'package:flutter/material.dart';

import '../constants.dart';

class MyOutlineButton extends StatelessWidget {
  const MyOutlineButton({
    super.key,
    this.imageSrc,
    this.text,
    this.press, this.height, this.width,
  });

  final String? imageSrc;
  final String? text;
  final double? height;
  final double? width;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          maximumSize: Size(width!, height!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          side: const BorderSide(color: Color(0xFFEDEDED)),
          padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding,
            horizontal: kDefaultPadding * 2.5,
          ),
        ),
        onPressed: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageSrc!,
              height: 40,
            ),
            const SizedBox(width: kDefaultPadding),
            Text(text!)
          ],
        ),
      ),
    );
  }
}
