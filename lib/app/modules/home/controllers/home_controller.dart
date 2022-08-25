import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recruitment/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final String url = "https://reqres.in/api/users?page=2";
  Future<List<dynamic>> fetchData() async {
    var result = await http.get(Uri.parse(url));
    return json.decode(result.body)['data'];
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(Routes.LOGIN);
  }
}
