import 'package:flutter/cupertino.dart';

class CardData{

  final String title;
  final String subtitle;
  final Widget image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final Widget backgroundimage;
  final String text;

  CardData(  {
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    required this.backgroundimage,
    required this.text,
  });

}

class CardUIView extends StatelessWidget {
  const CardUIView({super.key, required this.data});
  final CardData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(child: data.backgroundimage), // Use Positioned if needed
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 6),
              Expanded(
                flex: 25,
                child: data.image,
              ),
              Text(
                data.title.toUpperCase(),
                style: TextStyle(
                  color: data.titleColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.clip,
                ),
                maxLines: 1,
              ),
              const Spacer(),
              Text(
                data.subtitle,
                style: TextStyle(
                  color: data.subtitleColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}