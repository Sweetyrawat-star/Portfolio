import 'package:flutter/material.dart';
import 'package:portfolio/components/app_extensions.dart';


import '../../components/section_title.dart';
import '../../constants.dart';
import '../../models/Feedback.dart';
import '../../responsive_layout.dart';
import 'components/feedback_card.dart';

class FeedbackSection extends StatelessWidget {
  const FeedbackSection({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2.5),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          const SectionTitle(
            title: "Feedback Received",
            subTitle: "Client’s testimonials that inspired me a lot",
            color: Color(0xFF00B1FF),
          ),
          const SizedBox(height: kDefaultPadding),
          size.width > DeviceType.smallScreenLaptop.getMaxWidth()? Wrap(
            spacing: kDefaultPadding * 1.5,
            runSpacing: kDefaultPadding * 2.5,
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              feedbacks.length,
              (index) => FeedbackCard(index: index),
            ),
          ):Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              feedbacks.length,
                  (index) => FeedbackCard(index: index),
            ),
          ),
        ],
      ),
    );
  }
}
