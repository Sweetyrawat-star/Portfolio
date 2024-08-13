import 'package:flutter/material.dart';
import 'package:portfolio/sections/about/about_section.dart';
import 'package:portfolio/sections/contact/contact_section.dart';
import 'package:portfolio/sections/feedback/feedback_section.dart';
import 'package:portfolio/sections/recent_work/recent_work_section.dart';
import 'package:portfolio/sections/service/service_section.dart';
import 'package:portfolio/sections/topSection/top_section.dart';

import 'constants.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopSection(),
            const SizedBox(height: kDefaultPadding * 2),
            AboutSection(),
            ServiceSection(),
            RecentWorkSection(),
            FeedbackSection(),
            const SizedBox(height: kDefaultPadding),
            ContactSection(),
            // This SizeBox just for demo
            // SizedBox(
            //   height: 500,
            // )
          ],
        ),
      ),
    );
  }
}
