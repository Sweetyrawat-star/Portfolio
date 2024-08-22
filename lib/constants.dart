import 'package:flutter/material.dart';

const kTextColor = Color(0xFF707070);
const kTextLightColor = Color(0xFF555555);

const kDefaultPadding = 20.0;


abstract class SocialLinks {
  static const String mail = "https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox";
  static const String twitter = "https://twitter.com/Sweetyrawat";
  static const String github = "https://github.com/Sweetyrawat-star?tab=repositories";
  static const String linkedin = "http://www.linkedin.com/in/sweety-rawat-688267188";
  static const String skype = "https://join.skype.com/invite/u31NbN804imW";
  static const String fiverr = "https://www.fiverr.com/sweetyflutter?up_rollout=true";
}
final kDefaultShadow = BoxShadow(
  offset: Offset(0, 50),
  blurRadius: 50,
  color: Color(0xFF0700B1).withOpacity(0.15),
);

final kDefaultCardShadow = BoxShadow(
  offset: Offset(0, 20),
  blurRadius: 50,
  color: Colors.black.withOpacity(0.1),
);

// TextField dedign
final kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

const kDefaultOutlineInputBorder = OutlineInputBorder(
  // Maybe flutter team need to fix it on web
  // borderRadius: BorderRadius.circular(50),
  borderSide: BorderSide(
    color: Color(0xFFCEE4FD),
  ),
);
