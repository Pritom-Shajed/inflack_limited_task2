import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:inflack_limited_task2/model/api_model.dart';
import 'package:inflack_limited_task2/repository/api_repository.dart';

class ApiController {
  final apiRepository = ApiRepository();

  postApi({
    required String title,
    required String body,
  }) async {
    try {
      ApiModel data = ApiModel(
        userId: 1,
        title: title,
        body: body,
      );
      http.Response response =
          await apiRepository.postApiCall(body: jsonEncode(data.toJson()));

      print(response.body);

      if (response.statusCode == 201) {
        return Fluttertoast.showToast(
            msg: 'Successful');
      } else {
        return Fluttertoast.showToast(msg: 'Successful', backgroundColor: Colors.red);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
