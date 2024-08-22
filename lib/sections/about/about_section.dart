import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io' as io;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import '../../components/default_button.dart';
import '../../components/my_outline_button.dart';
import '../../constants.dart';
import 'components/about_section_text.dart';
import 'components/about_text_with_sign.dart';
import 'components/experience_card.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);
  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  Future<void> downloadFile() async {
    try {
      final ByteData data = await rootBundle.load('assets/resume/Resume.pdf');
      if (kIsWeb) {
        final blob = html.Blob([data.buffer.asUint8List()], 'application/pdf');
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..setAttribute("download", "resume.pdf")
          ..click();
        html.Url.revokeObjectUrl(url);
      } else {
        String path;
        if (io.Platform.isAndroid || io.Platform.isIOS) {
          final directory = await getApplicationDocumentsDirectory();
          path = directory.path;
        } else if (io.Platform.isWindows || io.Platform.isLinux || io.Platform.isMacOS) {
          final directory = await getDownloadsDirectory();
          path = directory!.path;
        } else {
          throw UnsupportedError('Unsupported platform');
        }
        final file = io.File('$path/resume.pdf');
        await file.writeAsBytes(data.buffer.asUint8List());
        print('Resume downloaded: ${file.path}');
      }
    } catch (e) {
      print('Error downloading file: $e');
    }
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


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          const Row(
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
          const SizedBox(height: kDefaultPadding * 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyOutlineButton(
                imageSrc: "assets/images/hand.png",
                text: "Hire Me!",
                press: () {
                  openWhatsApp();

                },
              ),
              const SizedBox(width: kDefaultPadding * 1.5),
              DefaultButton(
                imageSrc: "assets/images/download.png",
                text: "Download CV",
                press: () {
                  downloadFile();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
