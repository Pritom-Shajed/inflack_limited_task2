import 'package:flutter/material.dart';
import 'package:inflack_limited_task2/Utils/Dimensions.dart';
import 'package:inflack_limited_task2/Widgets/custom_button.dart';
import 'package:inflack_limited_task2/Widgets/custom_text_field.dart';
import 'package:inflack_limited_task2/controller/api_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

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
              horizontal: Dimensions.height20, vertical: Dimensions.height30),
          child: Column(
            children: [
              CustomTextField(controller: _titleController, hintText: 'Title'),
              SizedBox(
                height: Dimensions.height10,
              ),
              CustomTextField(
                controller: _bodyController,
                hintText: 'Body',
                inputType: TextInputType.multiline,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              CustomButton(
                onTap: () => ApiController().postApi(
                    title: _titleController.text, body: _bodyController.text),
                text: 'Post',
              )
            ],
          ),
        ),
      ),
    );
  }
}
