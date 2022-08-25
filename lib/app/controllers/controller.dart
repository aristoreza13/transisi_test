import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recruitment/app/data/user_model.dart';
import 'package:recruitment/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  // Fetch all data to contact
  Future<List<dynamic>> fetchData() async {
    var result = await http.get(Uri.parse("https://reqres.in/api/users"));
    return json.decode(result.body)['data'];
  }

  // Create new user
  Future<void> createUser(String name, job) async {
    Map data = {
      'name': name,
      'job': job,
    };
    print(data);

    var url = "https://reqres.in/api/users";
    var response = await http.post(
      Uri.parse(url),
      body: data,
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 201) {
      Get.snackbar("Success", "User created");
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar("Error", "Fill the required data");
    }
  }

  // Login | Save session
  Future<void> login(String email, pass) async {
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
      var data = jsonDecode(response.body.toString());
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('token', data["token"]);
      Get.snackbar("Success", "Logged in");
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar("Error", "Fill the required data");
    }
  }

  // Logout | Exit session
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(Routes.LOGIN);
  }

  // Register
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
