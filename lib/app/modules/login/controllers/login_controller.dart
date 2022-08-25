import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recruitment/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void login(String email, pass) async {
    Map data = {
      'email': email,
      'password': pass,
    };
    print(data);

    var url = 'https://reqres.in/api/login';
    var response = await http.post(
      Uri.parse(url),
      body: data,
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('success login');
      var data = jsonDecode(response.body.toString());
      print(data['token']);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('token', data["token"]);

      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar("Error", "Fill the required data");
    }
  }

  Future<void> saveUser(int id, String access_token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('id', id);
    await preferences.setString('access_token', access_token);
  }
}
