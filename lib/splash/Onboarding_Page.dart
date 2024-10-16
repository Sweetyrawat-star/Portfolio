import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/home_screen.dart';
import 'package:portfolio/splash/Splash_Page.dart';

import 'CardPlanet.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final data = [
    CardData(
      title: 'Welcome To My Portfolio',
      subtitle: 'Building beautiful mobile experiences with Flutter, transforming ideas into seamless apps.',
      image: LottieBuilder.asset('assets/animation/img-4.json'),
      backgroundColor: Color(0xff313866),
      titleColor: Color(0xFFFE7BE5),
      subtitleColor: Color(0xFFFFF3DA),
      text: "Next",
      backgroundimage: LottieBuilder.asset('assets/animation/bubble.json'),
    ),
    CardData(
      title: 'Transforming Mobile Experiences with Flutter',
      subtitle: "Building intuitive, cross-platform mobile apps that captivate and deliver, from concept to completion",
      image: LottieBuilder.asset('assets/animation/img-2.json'),
      backgroundColor: Color(0xFF163020),
      titleColor: Color(0xFFFE7BE5),
      subtitleColor: Colors.yellow,
      text: "Next",
      backgroundimage: LottieBuilder.asset('assets/animation/bubble.json'),
    ),
    CardData(
      title: 'Crafting the Future of Mobile Apps with Flutter',
      subtitle: "Building modern, responsive, and scalable mobile applications for the future of digital experiences.",
      image: LottieBuilder.asset('assets/animation/img-3.json'),
      backgroundColor: Color(0xFFFF4E11A6),
      titleColor: Color(0xFFFE7BE5),
      subtitleColor: Colors.white,
      text:"Next",
      backgroundimage: LottieBuilder.asset('assets/animation/bubble.json'),
    ),
    CardData(
      title: "From Vision to Mobile Reality with Flutter",
      subtitle: "Specializing in Flutter to deliver exceptional, cross-platform mobile experiences for businesses and users alike.",
      image: LottieBuilder.asset('assets/animation/img-5.json'),
      backgroundColor: Color(0xFF3887BE),
      titleColor: Color(0xFFFE7BE5),
      subtitleColor: Colors.white,
      text:"Go To Home",
      backgroundimage: LottieBuilder.asset('assets/animation/bubble.json'),
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ConcentricPageViewScreen(
            itemCount: data.length,
            text: data.map((e) => e.text).toList(),
            colors: data.map((e) => e.backgroundColor).toList(),
            onChange: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            onFinish: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }));
            },
            itemBuilder: (int index) {
              return CardUIView(data: data[index]);
            },
          ),

        ],
      ),
    );
  }
}
