import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inflack_limited_task2/Utils/Dimensions.dart';
import 'package:inflack_limited_task2/Widgets/custom_button.dart';
import 'package:inflack_limited_task2/Widgets/custom_text_field.dart';
import 'package:inflack_limited_task2/controller/controller.dart';
import 'package:inflack_limited_task2/repository/api_respository.dart';

class PostApiPage extends StatelessWidget {
  PostApiPage({Key? key}) : super(key: key);

  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var controller = Controller(ApiRepository());
    return Scaffold(
      appBar: AppBar(
        title: const Text('POST'),
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
                onTap: () => controller
                    .postApi(_titleController.text, _bodyController.text)
                    .then((value) =>
                        Fluttertoast.showToast(msg: 'Added Successfully')),
                text: 'Post',
              )
            ],
          ),
        ),
      ),
    );
  }
}
