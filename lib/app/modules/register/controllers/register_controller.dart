import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recruitment/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void register(String email, pass) async {
    Map data = {
      'email': email,
      'password': pass,
    };
    print(data);

    String body = json.encode(data);
    var url = 'https://reqres.in/api/register';
    var response = await http.post(
      Uri.parse(url),
      body: data,
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('success');
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar("Error", "Only defined users succeed registration");
    }
  }
}
