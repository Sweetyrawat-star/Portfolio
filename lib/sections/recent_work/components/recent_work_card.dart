import 'package:flutter/material.dart';
import '../../../components/loading_colorChanger_button.dart';
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(recentWorks[widget.index!]
                                .category!
                                .toUpperCase()),
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
                              child: Text(
                                isExpanded ? "Hide Details" : "View Details",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                /*  if (isExpanded) ...[
                  const SizedBox(height: kDefaultPadding),
                  Text(
                    recentWorks[widget.index!].description!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  // Use Wrap widget for dynamic button layout
                  Wrap(
                    spacing: kDefaultPadding, // Space between buttons
                    runSpacing: kDefaultPadding / 2, // Space between rows
                    children: [
                      if (recentWorks[widget.index!].andiordLink!.isNotEmpty)
                        SwipeButton(
                          onTap: () {
                            html.window.open(recentWorks[widget.index!].andiordLink!, '_blank');
                          },
                          color: Colors.blue,
                          successColor: Colors.green,
                          loadingColor: Colors.grey,
                          buttonText: "Android",
                        ),
                      if (recentWorks[widget.index!].iosLink!.isNotEmpty)
                        SwipeButton(
                          onTap: () {
                            html.window.open(recentWorks[widget.index!].iosLink!, '_blank');
                          },
                          color: Colors.blue,
                          successColor: Colors.green,
                          loadingColor: Colors.grey,
                          buttonText: "iOS",
                        ),
                      if (recentWorks[widget.index!].repoLink!.isNotEmpty)
                        SwipeButton(
                          onTap: () {
                            html.window.open(recentWorks[widget.index!].repoLink!, '_blank');
                          },
                          color: Colors.blue,
                          successColor: Colors.green,
                          loadingColor: Colors.grey,
                          buttonText: "Github",
                        ),
                    ],
                  ),
                ],*/
                if (isExpanded) ...[
                  const SizedBox(height: kDefaultPadding),
                  Text(
                    recentWorks[widget.index!].description!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: kDefaultPadding),
                  // Add any additional details you'd like to show here.
                  Row(
                    mainAxisAlignment: _getButtonAlignment(),
                    children: [
                      recentWorks[widget.index!].andiordLink!.isEmpty
                          ? Container()
                          : SwipeButton(
                              onTap: () {
                                html.window.open(
                                    recentWorks[widget.index!].andiordLink!,
                                    '_blank');
                              },
                              color: Color(0xFFF08080),
                              successColor: const Color(
                                  0xFFFFA07A),
                              loadingColor:
                                  Color(0xffCD5C5C),
                              buttonText:
                                  "Android",
                            ),
                      recentWorks[widget.index!].iosLink!.isEmpty
                          ? Container()
                          : SwipeButton(
                              onTap: () {
                                // Custom action when swipe is successful
                                html.window.open(
                                    recentWorks[widget.index!].iosLink!,
                                    '_blank');
                              },
                              color: Color(0xffFF6347),
                              successColor: Color(0xffFF7F50),
                              loadingColor: Colors.grey,
                              buttonText: "IOS",
                            ),
                      recentWorks[widget.index!].repoLink!.isEmpty
                          ? Container()
                          : SwipeButton(
                              onTap: () {
                                html.window.open(
                                    recentWorks[widget.index!].repoLink!,
                                    '_blank');
                              },
                              color: Color(0xff778899),
                              successColor: Color(0xffD3D3D3),
                              loadingColor: Colors.grey,
                              buttonText: "Github",
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

  MainAxisAlignment _getButtonAlignment() {
    int buttonCount = [
      recentWorks[widget.index!].andiordLink!.isNotEmpty,
      recentWorks[widget.index!].iosLink!.isNotEmpty,
      recentWorks[widget.index!].repoLink!.isNotEmpty,
    ].where((linkExists) => linkExists).length;

    return buttonCount <= 1
        ? MainAxisAlignment.center
        : MainAxisAlignment.spaceEvenly;
  }
}

