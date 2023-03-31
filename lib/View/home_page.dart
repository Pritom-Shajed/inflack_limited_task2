import 'package:flutter/material.dart';
import 'package:inflack_limited_task2/Utils/Dimensions.dart';
import 'package:inflack_limited_task2/Widgets/custom_button.dart';
import 'package:inflack_limited_task2/Widgets/custom_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API CRUD'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height20,
              vertical: Dimensions.height30),
          child: Column(
            children: [
              CustomTextField(hintText: 'Title'),
              SizedBox(height: Dimensions.height10,),
              CustomTextField(hintText: 'Body'),
              SizedBox(height: Dimensions.height20,),
              CustomButton(onTap: (){}, text: 'Post')
            ],
          ),
        ),
      ),
    );
  }
}
