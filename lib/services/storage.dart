import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageServices{
  static String sharedPreferenceUserInfoKey="USERDATA";
  static String sharedPreferenceUserID="USERIDKEY";
  static String sharedPreferncePostKey="USERPOST";

  //clearing data
  static Future<void> clearData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
  //SAVING DATA TO SHARED PREFERENCE

  static Future<bool> saveUserInfo(Map<String,dynamic> userMap) async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString(sharedPreferncePostKey, userMap["post"]);
    return await prefs.setString(sharedPreferenceUserInfoKey, json.encode(userMap));
  }

  static Future<bool> saveUserID(String id) async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserID, id);
  }

  //GETTING DATA
  static Future<String> getUserPost() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferncePostKey);
  }

  static Future<Map<String,dynamic>> getUserInfo() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String user=await prefs.getString(sharedPreferenceUserInfoKey);
    Map<String,dynamic> userinfo=json.decode(user);
    return userinfo;
  }

}