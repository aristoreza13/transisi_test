import 'dart:convert';
import 'package:http/http.dart' as http;

class UserData {
  int? id;
  String? fullname;
  String? email;
  String? avatar;

  UserData({
    required this.avatar,
    required this.email,
    required this.fullname,
    required this.id,
  });
  // Fetch single data
  static Future<UserData> detail(String id) async {
    var result = await http.get(Uri.parse("https://reqres.in/api/users/$id"));

    var data = (json.decode(result.body) as Map<String, dynamic>)['data'];
    print(data);
    return UserData(
        avatar: data['avatar'],
        email: data['email'],
        fullname: data['fullname'],
        id: data['id']);
  }
}
