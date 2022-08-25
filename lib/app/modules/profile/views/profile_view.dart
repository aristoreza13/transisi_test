import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:recruitment/app/controllers/controller.dart';
import 'package:recruitment/app/data/app_style.dart';
import 'package:recruitment/app/data/user_model.dart';
import 'package:recruitment/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  UserData userData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: Get.height / 2,
            color: Styles.primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.CHANGE_PROFILE),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const Gap(20),
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        userData.avatar!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    userData.fullname!,
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.call,
                      color: Styles.primaryColor,
                    ),
                    title: const Text("90909090909"),
                    subtitle: const Text("Telephone"),
                    trailing: const Icon(Icons.chat),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.mail,
                      color: Styles.primaryColor,
                    ),
                    title: Text(userData.email!),
                    subtitle: const Text("E-mail"),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.share,
                      color: Styles.primaryColor,
                    ),
                    title: const Text("Send Contact"),
                    subtitle: const Text("Share"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
