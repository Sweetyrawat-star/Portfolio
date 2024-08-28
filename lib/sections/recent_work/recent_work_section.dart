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
    return Container(
      margin: const EdgeInsets.only(top: kDefaultPadding * 6),
      width: double.infinity,
      // just for demo
      // height: 600,
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
            child: size.width < DeviceType.ipad.getMaxWidth()
                ? Wrap(
                    spacing: kDefaultPadding,
                    runSpacing: kDefaultPadding * 2,
                    children: List.generate(
                      recentWorks.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: RecentWorkCard(index: index, press: () {}),
                      ),
                    ),
                  )
                : size.width < DeviceType.smallScreenLaptop.getMaxWidth()
                    ? Wrap(
                        spacing: kDefaultPadding * 2,
                        runSpacing: kDefaultPadding * 3,
                        children: List.generate(
                          recentWorks.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: RecentWorkCard(index: index, press: () {}),
                          ),
                        ),
                      ):size.width < DeviceType.mobile.getMaxWidth()
                ? Wrap(
              spacing: kDefaultPadding * 2,
              runSpacing: kDefaultPadding * 3,
              children: List.generate(
                recentWorks.length,
                    (index) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RecentWorkCard(index: index, press: () {}),
                ),
              ),
            )
                    : Wrap(
                        spacing: kDefaultPadding,
                        runSpacing: kDefaultPadding * 2,
                        children: List.generate(
                          recentWorks.length,
                          (index) => RecentWorkCard(index: index, press: () {}),
                        ),
                      ),
          ),
          const SizedBox(height: kDefaultPadding * 5),
        ],
      ),
    );
  }
}
