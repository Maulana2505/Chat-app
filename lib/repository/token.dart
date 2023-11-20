
import 'package:shared_preferences/shared_preferences.dart';

class TokenApi {
  Future writetoken(var token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
    // await storage.write(key: 'token', value: token);
  }

  Future hasToken() async {
    final prefs = await SharedPreferences.getInstance();
    var value = prefs.getString("token");
    if (value != null) {
      print(value);
      return true;
    } else {
      return false;
    }
  }

   void getToken() async {
    //  await storage.read(key: 'token');
    final prefs = await SharedPreferences.getInstance();
    prefs.getString("token");
  }

  Future getid() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.getString("id");
  }
  Future deleteToken() async {
    // var value = await storage.read(key: 'token');
    final prefs = await SharedPreferences.getInstance();
    var remove = await prefs.remove("token");
    return remove;
  }
}
