import 'package:flutter/material.dart';
import 'package:inflack_limited_task2/Utils/Dimensions.dart';

class CombinedText extends StatelessWidget {
  final String text1;
  final String text2;
  FontWeight fontWeight1;
  FontWeight fontWeight2;
  Color color1;
  Color color2;

  CombinedText({
    Key? key,
    required this.text1,
    required this.text2,
    this.fontWeight1 = FontWeight.bold,
    this.fontWeight2 = FontWeight.normal,
    this.color1 = Colors.black,
    this.color2 = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: text1,
            style: TextStyle(color: color1,fontWeight: fontWeight1, fontSize: Dimensions.textSize14)),
        TextSpan(
            text: text2,
            style: TextStyle(color: color2,fontSize: Dimensions.textSize14, fontWeight: fontWeight2)),
      ]),
    );
  }
}
