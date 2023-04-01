import 'dart:convert';
import 'package:inflack_limited_task2/Utils/api_urls.dart';
import 'package:inflack_limited_task2/model/api_model.dart';
import 'package:inflack_limited_task2/repository/repositroy.dart';
import 'package:http/http.dart' as http;

class ApiRepository implements Respository {

  //get
  @override
  Future<List<ApiModel>> fetchApi() async {
    List<ApiModel> apiList = [];
    final uri = Uri.parse(ApiUrl.getUrl);

    http.Response response = await http.get(uri);

    try {
      switch (response.statusCode) {
        case 200:
          var body = jsonDecode(response.body);
          for (var i = 0; i < body.length; i++) {
            apiList.add(ApiModel.fromJson(body[i]));
          }
          return apiList;
        case 400:
          throw Exception('Error Occurred');
        default:
          throw Exception('Error Occurred');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //post
  @override
  Future<String> postApi(title, body) async {
    final uri = Uri.parse(ApiUrl.postUrl);

    ApiModel data = ApiModel(
      userId: 1,
      title: title,
      body: body,
    );

    http.Response response = await http.post(uri,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
    print(response.body);

    try {
      switch (response.statusCode) {
        case 200:
          print('Successful');
          return 'Successful';
        case 201:
          print('Successful');
          return 'Successful';
        default:
          print('Error');
          return 'error';
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //delete
  @override
  Future<String> deleteApi(ApiModel apiModel) async {
    final uri = Uri.parse(ApiUrl.deleteUrl + apiModel.id.toString());

    http.Response response = await http.delete(uri);

    try {
      switch (response.statusCode) {
        case 200:
          print('deleted');
          return 'Deleted';
        default:
          throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //patch
  @override
  Future<String> patchApi(ApiModel apiModel, String title, String body) async {
    final uri = Uri.parse(ApiUrl.pathUrl + apiModel.id.toString());

    var data = {
      'title': title,
      'body': body,
    };

    http.Response response = await http.patch(uri,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json; charset=UTF-8'});

    print(response.body);

    try {
      switch (response.statusCode) {
        case 200:
          print('Successful');
          return 'success';
        default:
          print('Error');
          return 'error';
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //put
  @override
  Future<String> putApi(ApiModel apiModel, String title, String body) async {
    final uri = Uri.parse(ApiUrl.pathUrl + apiModel.id.toString());

    var data = {
      'title': title,
      'body': body,
    };

    http.Response response = await http.put(uri,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json; charset=UTF-8'});

    print(response.body);

    try {
      switch (response.statusCode) {
        case 200:
          print('Successful');
          return 'success';
        default:
          print('Error');
          return 'error';
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
