import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/RecentWork.dart';
import 'package:universal_html/html.dart' as html;
class RecentWorkCard extends StatefulWidget {
  const RecentWorkCard({
    super.key,
    this.index,
    required this.press,
  });

  final int? index;
  final void Function() press;

  @override
  _RecentWorkCardState createState() => _RecentWorkCardState();
}

class _RecentWorkCardState extends State<RecentWorkCard> {
  bool isHover = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isExpanded ? 450 : 250,
        width: 540,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      recentWorks[widget.index!].image!,
                      height: 180,
                      width: 180,
                      fit: BoxFit.contain,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(recentWorks[widget.index!].category!.toUpperCase()),
                            const SizedBox(height: kDefaultPadding / 2),
                            Text(
                              recentWorks[widget.index!].title!,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: kDefaultPadding),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child:  Text(
                                isExpanded? "Hide Details":"View Details",
                                style: TextStyle(decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                if (isExpanded) ...[
                  const SizedBox(height: kDefaultPadding),
                  Text(
                    recentWorks[widget.index!].description!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  // Add any additional details you'd like to show here.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          html.window.open(recentWorks[widget.index!].andiordLink!, '_blank');
                        },
                        child: const Text(
                          "Android Link",
                          style: TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          html.window.open(recentWorks[widget.index!].iosLink!, '_blank');
                        },
                        child: const Text(
                          "Ios Link",
                          style: TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          html.window.open(recentWorks[widget.index!].repoLink!, '_blank');
                        },
                        child: const Text(
                          "Github",
                          style: TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
