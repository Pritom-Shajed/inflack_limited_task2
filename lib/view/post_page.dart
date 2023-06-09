import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inflack_limited_task2/Utils/Dimensions.dart';
import 'package:inflack_limited_task2/Widgets/custom_button.dart';
import 'package:inflack_limited_task2/Widgets/custom_text_field.dart';
import 'package:inflack_limited_task2/controller/controller.dart';
import 'package:inflack_limited_task2/repository/api_respository.dart';
import 'package:inflack_limited_task2/view/home_page.dart';

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
              CustomTextField(
                labelText: 'Title',
                hintText: 'Title',
                controller: _titleController,
                inputType: TextInputType.text,
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              CustomTextField(
                labelText: 'Body',
                hintText: 'Body',
                controller: _bodyController,
                inputType: TextInputType.multiline,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              CustomButton(
                onTap: () => controller
                    .postApi(_titleController.text, _bodyController.text).then((value) => ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('Added')))).then((value) => Get.offAll(() => const HomePage())),
                text: 'Post',
              )
            ],
          ),
        ),
      ),
    );
  }
}
