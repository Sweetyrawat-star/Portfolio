import 'package:flutter/material.dart';
import '../../../constants.dart';

class Menu extends StatefulWidget {
  final Function(int) onMenuItemClicked;
  const Menu({super.key, required this.onMenuItemClicked});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  int hoverIndex = 0;
  List<String> menuItems = [
    "Home",
    "About",
    "Feedback",
    "Projects",
    "Services",
    "Contact"
  ];

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    var screenWidth = MediaQuery.of(context).size.width;

    // Adjust padding dynamically based on screen size
    double horizontalPadding = screenWidth > 800
        ? kDefaultPadding * 2.5
        : kDefaultPadding;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
      height: screenWidth > 800?100: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          menuItems.length,
              (index) => Flexible(child: buildMenuItem(index, screenWidth)),
        ),
      ),
    );
  }

  Widget buildMenuItem(int index, double screenWidth) {
    // Adjust font size based on screen width
    double fontSize = screenWidth > 800 ? 20 : 10;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        widget.onMenuItemClicked(index);
      },
      onHover: (value) {
        setState(() {
          value ? hoverIndex = index : hoverIndex = selectedIndex;
        });
      },
      child: Container(
        constraints: BoxConstraints(
          minWidth: screenWidth > 800 ? 122 : 80, // Adjust width based on screen size
        ),
        height: screenWidth > 800?100: 80,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              menuItems[index],
              style: TextStyle(fontSize: fontSize, color: kTextColor),
            ),
            // Hover effect
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: 0,
              right: 0,
              bottom: selectedIndex != index && hoverIndex == index ? -20 : -32,
              child: Image.asset("assets/images/Hover.png"),
            ),
            // Select effect
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: 0,
              right: 0,
              bottom: selectedIndex == index ? -2 : -32,
              child: Image.asset("assets/images/Hover.png"),
            ),
          ],
        ),
      ),
    );
  }
}
