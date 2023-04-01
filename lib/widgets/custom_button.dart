import 'package:flutter/material.dart';
import 'package:inflack_limited_task2/Utils/dimensions.dart';
import 'package:inflack_limited_task2/Utils/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  String text;
  Color color;
  CustomButton({Key? key, required this.onTap, required this.text, this.color = Colors.deepPurple}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: Dimensions.buttonWidth,
        padding: EdgeInsets.all(Dimensions.height10),
        decoration:  BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(Dimensions.radius8),
            color: color),
        child:  Text(text, style: TextStyle(color: Colors.white, fontSize: Dimensions.textSize16,),),
      ),
    );
  }
}
