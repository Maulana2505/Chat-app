// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';


import 'package:chat_app/model/search/search_model2.dart';
import 'package:chat_app/model/userSiggleModel/userSigglemodel.dart';

import 'package:chat_app/repository/token_secure.dart';
import 'package:http/http.dart' as http;


import '../repository/url.dart';

class userApi {
  
  var urls = url().uri;

  var token = tokensecure();
  Future Signup(var email, var username, var password) async {
    Uri uris = Uri.parse("$urls/crateUser");
    var res = await http.post(uris, body: {
      'email': email,
      'username': username,
      'password': password,
    });
    var data = json.decode(res.body);
    if (res.statusCode == 400) {
      return data;
    } else {
      return data;
    }
  }

  Future Signin(var username, var password) async {
    Uri uris = Uri.parse("$urls/login");
    var res = await http
        .post(uris, body: {'username': username, 'password': password});
    var data = json.decode(res.body);
    return data;
  }

  Future<userSigglemodel?> getuser() async {
    var tokens = await token.readToken("token");
    final res = await http.get(Uri.parse("$urls/getuser"), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: 'Bearer $tokens'
    });
    if (res.statusCode == 200) {
      var data = (jsonDecode(res.body) as Map<String, dynamic>);
      return userSigglemodel.fromJson(data);
    } else if (res.statusCode == 400) {
      print(res.body);
    } else {
      print(jsonDecode(res.body));
    }
    return null;
  }

  Future<userSigglemodel?> profileuser() async {
    var tokens = await token.readToken("token");
    final res = await http.get(Uri.parse("$urls/profile"), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: 'Bearer $tokens'
    });
    if (res.statusCode == 200) {
      var data = (jsonDecode(res.body) as Map<String, dynamic>);
      return userSigglemodel.fromJson(data);
    } else {
      print(jsonDecode(res.body));
    }
    return null;
  }

  Future<List<SearchM2>> finduser(String username) async {
    var tokens = await token.readToken("token");
    final res = await http.get(Uri.parse("$urls/finduser/$username"), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: 'Bearer $tokens'
    });
    // var data = jsonDecode(res.body);
    if (res.statusCode == 200) {
      List<SearchM2> a = (json.decode(res.body) as List)
          .map((x) => SearchM2.fromJson(x))
          .toList();
      print(a);
      return a;
    } else {
      return jsonDecode(res.body);
    }
  }

  updateuser(String username, File img) async {
    var tokens = await token.readToken("token");
    var req = http.MultipartRequest('PUT', Uri.parse("$urls/updateprofile"));
    req.files.add(await http.MultipartFile.fromPath("imgprofile", img.path));
    req.fields['username'] = username;
    req.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $tokens'
    });
    var data = await req.send();
    print(data);
    var responseData = await data.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    return responseString;
  }

  void dispose() {}
}
