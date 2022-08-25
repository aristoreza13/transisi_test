import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:recruitment/app/controllers/controller.dart';
import 'package:recruitment/app/data/app_style.dart';

import '../controllers/add_karyawan_controller.dart';

class AddKaryawanView extends GetView<AddKaryawanController> {
  AddKaryawanView({Key? key}) : super(key: key);
  Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new contact'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: GestureDetector(
              onTap: () {
                print("Saved");
                c.createUser(c.nameC.text, c.jobC.text);
              },
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Gap(20),
          CircleAvatar(
            radius: 70,
            backgroundColor: Styles.primaryColor,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          // const Gap(10),
          TextField(
            autocorrect: false,
            controller: c.nameC,
            decoration: const InputDecoration(
              labelText: "Name",
              icon: Icon(Icons.person),
            ),
          ),
          TextField(
            autocorrect: false,
            // controller: c.nameC,
            decoration: const InputDecoration(
              labelText: "Surname",
              icon: Icon(Icons.person),
            ),
          ),
          TextField(
            autocorrect: false,
            controller: c.jobC,
            decoration: const InputDecoration(
              labelText: "Job",
              icon: Icon(Icons.cases_rounded),
            ),
          ),
          const TextField(
            autocorrect: false,
            // controller: controller.nameC,
            maxLength: 16,
            decoration: InputDecoration(
              labelText: "Telephone",
              icon: Icon(Icons.call),
            ),
          ),
          const TextField(
            autocorrect: false,
            // controller: controller.nameC,
            decoration: InputDecoration(
              labelText: "E-Mail",
              icon: Icon(Icons.mail),
            ),
          ),
          const TextField(
            autocorrect: false,
            // controller: controller.nameC,
            decoration: InputDecoration(
              labelText: "Website",
              icon: Icon(Icons.web),
            ),
          ),
        ],
      ),
    );
  }
}
