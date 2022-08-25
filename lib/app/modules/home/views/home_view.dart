import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:recruitment/app/controllers/controller.dart';
import 'package:recruitment/app/data/app_style.dart';
import 'package:recruitment/app/data/user_model.dart';
import 'package:recruitment/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Contact'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: c.logout,
              icon: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: c.fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black26,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        snapshot.data[index]['avatar'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(snapshot.data[index]['first_name'] +
                      " " +
                      snapshot.data[index]['last_name']),
                  subtitle: Text("9090909090909"),
                  trailing: Icon(Icons.star_border),
                  onTap: () {
                    String id = snapshot.data[index]['id'].toString();
                    UserData.detail(id);
                    Get.toNamed(
                      Routes.PROFILE,
                      arguments: UserData(
                          avatar: snapshot.data[index]['avatar'],
                          email: snapshot.data[index]['email'],
                          fullname: snapshot.data[index]['first_name'] +
                              ' ' +
                              snapshot.data[index]['last_name'],
                          id: snapshot.data[index]['id']),
                    );
                  },
                );
              },
            );
          } else {}

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_KARYAWAN),
        backgroundColor: Styles.primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
