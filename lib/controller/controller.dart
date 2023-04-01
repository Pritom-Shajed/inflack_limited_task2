import 'package:inflack_limited_task2/model/api_model.dart';
import 'package:inflack_limited_task2/repository/repositroy.dart';

class Controller {
  final Respository _repository;

  Controller(this._repository);

  Future<List<ApiModel>> fetchApi(){
    return _repository.fetchApi();
  }

  Future<String> postApi(String title, String body){
    return _repository.postApi(title, body);
  }

  Future<String> deleteApi(ApiModel apiModel){
    return _repository.deleteApi(apiModel);
  }


  Future<String> putApi(ApiModel apiModel, String title, String body){
    return _repository.putApi(apiModel, title, body);
  }
}