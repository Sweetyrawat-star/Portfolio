import 'package:flutter/material.dart';
import 'package:portfolio/components/app_extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';
import '../responsive_layout.dart';
import 'default_button.dart';

class HireMeCard extends StatefulWidget {
  const HireMeCard({super.key});

  @override
  State<HireMeCard> createState() => _HireMeCardState();
}

class _HireMeCardState extends State<HireMeCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double maxHeight, minHeight,textHeader,miniHeader;
    if (size.width > DeviceType.largeScreenDesktop.getMaxWidth()) {
      // Web/Desktop
      maxHeight = 900;
      minHeight = 700;
      textHeader = 42;
      miniHeader = 16;
    } else if (size.width > DeviceType.ipad.getMaxWidth()) {
      // Tablet
      maxHeight = 600;
      minHeight = 500;
      textHeader = 18;
      miniHeader = 12;
    } else {
      // Mobile
      textHeader = 16;
      maxHeight = 400;
      minHeight = 300;
      miniHeader = 10;
    }
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding ),
        constraints: const BoxConstraints(maxWidth: 1110),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [kDefaultShadow],
        ),
        child: size.width > DeviceType.ipad.getMaxWidth()
            ? Row(
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
                   Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Starting New Project?",
                          style: TextStyle(
                              fontSize: textHeader, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: kDefaultPadding / 2),
                        Text(
                          "Get an estimate for the new project",
                          style: TextStyle(fontWeight: FontWeight.w200,fontSize: miniHeader),
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
              )
            : Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/email.png",
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(width: 20,),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Starting New Project?",
                            style: TextStyle(
                                fontSize: textHeader, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Get an estimate for the new project",
                            style: TextStyle(fontWeight: FontWeight.w200,fontSize: miniHeader),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  DefaultButton(
                    text: "Hire Me!",
                    imageSrc: "assets/images/hand.png",
                    press: () {
                      openWhatsApp();
                    },
                  )
                ],
              ),
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
