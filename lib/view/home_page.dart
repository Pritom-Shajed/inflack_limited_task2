import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inflack_limited_task2/Utils/Dimensions.dart';
import 'package:inflack_limited_task2/controller/controller.dart';
import 'package:get/get.dart';
import 'package:inflack_limited_task2/repository/api_respository.dart';
import 'package:inflack_limited_task2/view/crud%20pages/patch_page.dart';
import 'package:inflack_limited_task2/view/crud%20pages/post_page.dart';
import 'package:inflack_limited_task2/widgets/combined_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Controller(ApiRepository());
    return Scaffold(
        appBar: AppBar(
          title: const Text('API CRUD'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Get.to(() => PostApiPage()),
          label: const Text('Add'),
        ),
        body: FutureBuilder(
            future: controller.fetchApi(),
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: Dimensions.height10,
                        ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data![index];

                      return Card(
                        child: ListTile(
                            leading: Text(data.id.toString()),
                            title: CombinedText(
                              text1: 'Title: ',
                              text2: data.title!,
                            ),
                            subtitle: CombinedText(
                              text1: 'Body: ',
                              text2: data.body!,
                            ),
                            trailing: PopupMenuButton(
                                onSelected: (int menu) {
                                  if (menu == 1) {
                                    Get.to(() => PatchApiPage(
                                        apiModel: data,
                                        title: data.title!,
                                        body: data.body!));
                                  }
                                },
                                icon: const Icon(
                                  Icons.edit,
                                ),
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                        value: 1,
                                        onTap: () {},
                                        child: const Text('Patch')),
                                    PopupMenuItem(
                                        value: 2,
                                        onTap: () => controller.putApi(
                                            data, 'shajed', 'body'),
                                        child: const Text('Put')),
                                    PopupMenuItem(
                                        value: 3,
                                        onTap: () => controller
                                            .deleteApi(data)
                                            .then((value) =>
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Successfully Deleted')),
                                        child: const Text('Delete')),
                                  ];
                                })),
                      );
                    });
              }
            }));
  }
}
