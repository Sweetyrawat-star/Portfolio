import 'package:flutter/material.dart';

import '../../../constants.dart';

class AboutTextWithSign extends StatelessWidget {
  const AboutTextWithSign({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About \nmy story",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: kDefaultPadding * 1.5),
        Image.asset("assets/images/dev.png",height: 250,width: 200,fit: BoxFit.fitHeight,)
      ],
    );
  }
}

