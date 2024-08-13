import 'package:flutter/material.dart';


import '../../components/default_button.dart';
import '../../components/my_outline_button.dart';
import '../../constants.dart';
import 'components/about_section_text.dart';
import 'components/about_text_with_sign.dart';
import 'components/experience_card.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AboutTextWithSign(),
              Expanded(
                child: AboutSectionText(
                  text:
                      "Flutter developer with 4 of experience in Flutter development. My expertise at UI design, proficient state management, and seamless cross-platform app deployment. I have a proven track record of consistently delivering high-quality, user-friendly applications on schedule. My skills and experience align perfectly with the needs of this position, ensuring successful development and deployment of cutting-edge mobile applications.",
                ),
              ),
              ExperienceCard(numOfExp: "4.4"),
              Expanded(
                child: AboutSectionText(
                  text:
                  "I am a Passionate Cross Platform Application Developer with 4 Years of experience with skills in Dart and FlutterFramework. I am very eager to write android/IOS/Web/Windows applications following best code Practices, Architecture, tools, and technologies.",
                ),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyOutlineButton(
                imageSrc: "assets/images/hand.png",
                text: "Hire Me!",
                press: () {},
              ),
              SizedBox(width: kDefaultPadding * 1.5),
              DefaultButton(
                imageSrc: "assets/images/download.png",
                text: "Download CV",
                press: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
