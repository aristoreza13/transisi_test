import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:recruitment/app/data/app_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  runApp(
    GetMaterialApp(
        title: "Application",
        initialRoute: token == null ? Routes.LOGIN : Routes.HOME,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Styles.customSwatch)),
  );
}
