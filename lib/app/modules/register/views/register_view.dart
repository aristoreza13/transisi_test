import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:recruitment/app/controllers/controller.dart';
import 'package:recruitment/app/data/app_style.dart';
import 'package:recruitment/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);

  Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGISTER'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            autocorrect: false,
            controller: c.email,
            decoration: const InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          const Gap(20),
          TextField(
            autocorrect: false,
            controller: c.password,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
          ),
          const Gap(20),
          ElevatedButton(
              onPressed: () {
                c.register(c.email.text, c.password.text);
              },
              child: const Text("REGISTER")),
        ],
      ),
    );
  }
}
