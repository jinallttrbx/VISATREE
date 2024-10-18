import 'package:shared_preferences/shared_preferences.dart';

class SessionManagement {
  static const _token = "_token";
  static const _userid = "_userid";
  static const _firstname = "_firstname";
  static const _lastname = "_lastname";
  static const _phone = "_phone";
  static const _email = "_email";
  static const _age = "_age";
  static const _gender = "_gender";
  static const _image = "_image";
  static const _isinChat = "_isinChat";

  getAllPrefsClear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("_token");
    prefs.remove("_userid");
    prefs.remove("_firstname");
    prefs.remove("_lastname");

    await prefs.clear();
  }

  Future<String> istoken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token) ?? '0';
  }

  Future<bool> settoken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_token, value);
  }

  Future<String> isuserid() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userid) ?? '0';
  }

  Future<bool> isinChat() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isinChat) ?? false;
  }

  Future<bool> setuserid(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_userid, value);
  }

  Future<String> isfirstname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_firstname) ?? '0';
  }

  Future<bool> setfirstname(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_firstname, value);
  }

  Future<String> islastname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_lastname) ?? '0';
  }

  Future<bool> setlastname(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_lastname, value);
  }

  Future<String> isphone() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_phone) ?? '0';
  }

  Future<bool> setphone(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_phone, value);
  }

  Future<bool> setIsInChat(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_isinChat, value);
  }

  Future<String> isemail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_email) ?? '0';
  }

  Future<bool> setemail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_email, value);
  }

  Future<String> isage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_age) ?? '0';
  }

  Future<bool> setage(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_age, value);
  }

  Future<String> isgender() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_gender) ?? '0';
  }

  Future<bool> setgender(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_gender, value);
  }

  Future<String> isimage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_image) ?? '0';
  }

  Future<bool> setimage(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_image, value);
  }
}
