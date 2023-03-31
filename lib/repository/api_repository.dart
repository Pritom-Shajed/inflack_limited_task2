import 'package:http/http.dart' as http;
import 'package:inflack_limited_task2/Utils/api_urls.dart';

class ApiRepository {
  Future<http.Response> postApiCall({required Object body}) async {
    final uri = Uri.parse(ApiUrl.postUrl);
    http.Response response = await http
        .post(uri, body: body, headers: {'Content-Type': 'application/json'});

    return response;
  }
}
