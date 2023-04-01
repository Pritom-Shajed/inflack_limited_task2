import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inflack_limited_task2/Utils/Dimensions.dart';
import 'package:inflack_limited_task2/Widgets/custom_button.dart';
import 'package:inflack_limited_task2/Widgets/custom_text_field.dart';
import 'package:inflack_limited_task2/controller/controller.dart';
import 'package:inflack_limited_task2/model/api_model.dart';
import 'package:inflack_limited_task2/repository/api_respository.dart';
import 'package:inflack_limited_task2/view/home_page.dart';

class PatchApiPage extends StatefulWidget {
  String title;
  String body;
  ApiModel apiModel;

  PatchApiPage(
      {Key? key,
      required this.title,
      required this.body,
      required this.apiModel})
      : super(key: key);

  @override
  State<PatchApiPage> createState() => _PatchApiPageState();
}

class _PatchApiPageState extends State<PatchApiPage> {
  var _titleController = TextEditingController();
  var _bodyController = TextEditingController();

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.title);
    _bodyController = TextEditingController(text: widget.body);
    super.initState();
  }

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
                onTap: () {
                  controller.putApi(widget.apiModel, _titleController.text,
                      _bodyController.text).then((value) => ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                    backgroundColor: Colors.green,
                      content: Text('Updated')))).then((value) => Get.offAll(() => const HomePage()));
                },
                text: 'Update',
              )
            ],
          ),
        ),
      ),
    );
  }
}
