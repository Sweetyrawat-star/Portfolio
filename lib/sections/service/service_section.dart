import 'package:flutter/material.dart';
import 'package:portfolio/components/app_extensions.dart';
import '../../components/section_title.dart';
import '../../constants.dart';
import '../../models/Service.dart';
import '../../responsive_layout.dart';
import 'components/service_card.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          const SectionTitle(
            color: Color(0xFFFF0000),
            title: "Service Offerings",
            subTitle: "My Strong Areas",
          ),
          // If screen width is greater than iPad's max width, show in a Row, else use Wrap for mobile devices
          size.width > DeviceType.ipad.getMaxWidth()
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              services.length,
                  (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ServiceCard(index: index),
                ),
              ),
            ),
          )
              : Wrap(
            spacing: kDefaultPadding * 1.5,
            runSpacing: kDefaultPadding * 2.5,
            alignment: WrapAlignment.center,
            children: List.generate(
              services.length,
                  (index) => ServiceCard(index: index),
            ),
          ),
        ],
      ),
    );
  }
}
