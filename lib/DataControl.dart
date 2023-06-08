import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DataControl{
  static List<Map<String, dynamic>> projects = [
  ];

  static List<Map<String, dynamic>> zakazchiki = [
  ];

  static List<Map<String, dynamic>> members = [
    {'uid': 0, 'name': 'Alex', 'password': 'qwerty'},
    {'uid': 1, 'name': 'Bob', 'password': '1234'},
  ];
  static int uidAuth = -9999;
  static bool authenticateUser(String name, String password) {
    for (var member in members) {
      if (member['name'] == name && member['password'] == password) {
        DataControl.uidAuth = member['uid'] as int;
        print(DataControl.uidAuth);
        return true;
      }
    }
    return false;
  }

  static int generateUid() {
    int maxUid = 0;
    for (var member in members) {
      int uid = member['uid'] as int;
      if (uid > maxUid) {
        maxUid = uid;
      }
    }
    return maxUid + 1;
  }

  static void registerUser(int uid, String name, String password) {
    members.add({'uid': uid, 'name': name, 'password': password});
  }


}