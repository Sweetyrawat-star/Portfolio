import 'package:flutter/material.dart';
import 'package:portfolio/sections/about/about_section.dart';
import 'package:portfolio/sections/contact/contact_section.dart';
import 'package:portfolio/sections/feedback/feedback_section.dart';
import 'package:portfolio/sections/recent_work/recent_work_section.dart';
import 'package:portfolio/sections/service/service_section.dart';
import 'package:portfolio/sections/topSection/top_section.dart';
import 'constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey serviceKey = GlobalKey();
  final GlobalKey feedbackKey = GlobalKey();
  final GlobalKey workKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            TopSection(
              onMenuItemClicked: (index) {
                if (index == 0) {
                  scrollToSection(homeKey);
                } else if (index == 1) {
                  scrollToSection(aboutKey);
                } else if (index == 2) {
                  scrollToSection(feedbackKey);
                } else if (index == 3) {
                  scrollToSection(workKey);
                } else if (index == 4) {
                  scrollToSection(serviceKey);
                }
                else if (index == 5) {
                  scrollToSection(contactKey);
                }
              },
            ),
            const SizedBox(height: kDefaultPadding * 2),
            AboutSection(key: aboutKey),
            ServiceSection(key: serviceKey),
            RecentWorkSection(key: workKey),
            FeedbackSection(key: feedbackKey),
            const SizedBox(height: kDefaultPadding),
            ContactSection(key: contactKey),
          ],
        ),
      ),
    );
  }
}
