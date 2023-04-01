import 'package:flutter/material.dart';
import 'package:inflack_limited_task2/Utils/Dimensions.dart';
import 'package:inflack_limited_task2/controller/controller.dart';
import 'package:get/get.dart';
import 'package:inflack_limited_task2/repository/api_respository.dart';
import 'package:inflack_limited_task2/view/update_page.dart';
import 'package:inflack_limited_task2/view/post_page.dart';
import 'package:inflack_limited_task2/widgets/custom_card.dart';

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
             if(snapshot.connectionState == ConnectionState.done){
               if (!snapshot.hasData) {
                 return const Center(child: Text('No Data Found'),);
               } else {
                 return ListView.separated(
                     separatorBuilder: (context, index) => SizedBox(
                       height: Dimensions.height10,
                     ),
                     itemCount: snapshot.data!.length,
                     itemBuilder: (context, index) {
                       var data = snapshot.data![index];

                       return CustomCard(
                           id: data.id!,
                           title: data.title!,
                           body: data.body!,
                           onTapUpdate: () => Get.to(() => PatchApiPage(
                               apiModel: data,
                               title: data.title!,
                               body: data.body!)),
                           onTapDelete: () => controller.deleteApi(data).then(
                                   (value) => ScaffoldMessenger.of(context)
                                   .showSnackBar(const SnackBar(
                                   backgroundColor: Colors.red,
                                   content: Text('Deleted')))));
                     });
               }
             } else {
               return const Center(
                 child: CircularProgressIndicator(),
               );
             }
            }));
  }
}
