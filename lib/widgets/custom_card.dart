import 'package:flutter/material.dart';
import 'package:inflack_limited_task2/Utils/Dimensions.dart';
import 'package:inflack_limited_task2/Widgets/custom_button.dart';
import 'package:inflack_limited_task2/widgets/combined_text.dart';

class CustomCard extends StatelessWidget {
  final int id;
  final String title;
  final String body;
  final VoidCallback onTapUpdate;
  final VoidCallback onTapDelete;

  CustomCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.body,
      required this.onTapUpdate,
      required this.onTapDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.radius10),
          child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(
            '$id',
            style: const TextStyle(fontSize: 24),
          ),
          SizedBox(
            width: Dimensions.height10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CombinedText(
                  text1: 'Title: ',
                  text2: title,
                ),
                CombinedText(
                  text1: 'Body: ',
                  text2: body,
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomButton(
                    text: 'Update',
                    onTap: onTapUpdate,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  CustomButton(
                    text: 'Delete',
                    color: Colors.red.shade800,
                    onTap: onTapDelete,
                  ),
                ],
              )),
      ],
    ),
        ));
  }
}
