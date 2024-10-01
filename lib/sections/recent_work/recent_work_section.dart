import 'package:flutter/material.dart';
import 'package:portfolio/components/app_extensions.dart';

import '../../components/hireme_card.dart';
import '../../components/section_title.dart';
import '../../constants.dart';
import '../../models/RecentWork.dart';
import '../../responsive_layout.dart';
import 'components/recent_work_card.dart';

class RecentWorkSection extends StatelessWidget {
  const RecentWorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Calculate item width dynamically based on available screen width
    int itemCountInRow = (size.width > 1110) ? 2 : 1; // Show 2 items in full view, 1 for smaller screens
    double containerWidth = (itemCountInRow == 2) ? 500 : double.infinity;

    return Container(
      margin: const EdgeInsets.only(top: kDefaultPadding * 6),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF7E8FF).withOpacity(0.3),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/recent_work_bg.png"),
        ),
      ),
      child: Column(
        children: [
          Transform.translate(
            offset: const Offset(0, -80),
            child: const HireMeCard(),
          ),
          const SectionTitle(
            title: "Recent Works",
            subTitle: "My Strong Arenas",
            color: Color(0xFFFFB100),
          ),
          const SizedBox(height: kDefaultPadding * 1.5),
          SizedBox(
            width: 1110,
            child: Wrap(
              spacing: kDefaultPadding,
              runSpacing: kDefaultPadding * 2,
              //alignment: WrapAlignment.center, // Centers the items in the row
              children: List.generate(
                recentWorks.length,
                    (index) => Container(
                  width: containerWidth, // Ensures each item has equal width
                      padding: EdgeInsets.only(left: 20,right: 20),
                  child: RecentWorkCard(
                    index: index,
                    press: () {},
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding * 5),
        ],
      ),
    );
  }
}
