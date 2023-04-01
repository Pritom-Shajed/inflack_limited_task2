import 'package:inflack_limited_task2/model/api_model.dart';

abstract class Respository {
  Future<List<ApiModel>> fetchApi();
  Future<String> postApi(String title, String body);
  Future<String> deleteApi(ApiModel apiModel);
  Future<String> putApi(ApiModel apiModel, String title, String body);
}