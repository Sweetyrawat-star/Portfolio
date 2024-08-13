import 'package:flutter/material.dart';

class Feedback {
  final String ?name;
  final String ?review;
  final String ?userPic;
  final int ?id;
  final Color ?color;

  Feedback({this.name, this.review, this.userPic, this.id, this.color});
}

// List of demo feedbacks
List<Feedback> feedbacks = [
  Feedback(
    id: 1,
    name: "Ronald Thompson",
    review: review,
    userPic: "assets/images/people.png",
    color: const Color(0xFFFFF3DD),
  ),
  Feedback(
    id: 2,
    name: "Christen Grey",
    review: review1,
    userPic: "assets/images/person1.jpeg",
    color: const Color(0xFFD9FFFC),
  ),
  Feedback(
    id: 3,
    name: "Praveen Grover",
    review: review2,
    userPic: "assets/images/person2.jpeg",
    color: const Color(0xFFFFE0E0),
  ),
];

String review =
    "The team's professionalism and attention to detail exceeded our expectations—delivering outstanding results ahead of schedule.";
String review1 =
    "Working with them was a seamless experience; they truly understood our vision and brought it to life beautifully.";
String review2 =
    "Exceptional service from start to finish! Their expertise and commitment made all the difference in our project's success.";