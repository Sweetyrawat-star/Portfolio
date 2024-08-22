import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import 'default_button.dart';

class HireMeCard extends StatefulWidget {
  const HireMeCard({
   super.key
  });

  @override
  State<HireMeCard> createState() => _HireMeCardState();
}

class _HireMeCardState extends State<HireMeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/email.png",
            height: 80,
            width: 80,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SizedBox(
              height: 80,
              child: VerticalDivider(),
            ),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Starting New Project?",
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: kDefaultPadding / 2),
                Text(
                  "Get an estimate for the new project",
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
          DefaultButton(
            text: "Hire Me!",
            imageSrc: "assets/images/hand.png",
            press: () {
              openWhatsApp();

            },
          )
        ],
      ),
    );
  }

  void openWhatsApp() async {
    const phoneNumber = "9971069669";
    final message = Uri.encodeComponent(
        "Hi,I have interest in your profile. I would like to inquire about a project");
    final url = 'https://wa.me/$phoneNumber?text=$message';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
