import 'dart:convert';
import 'dart:io';
import 'package:chat_app/model/friend_request/friendreq_model.dart';
import 'package:chat_app/model/friends/friends_model.dart';
import 'package:chat_app/model/pending/pending_data.dart';
import 'package:http/http.dart' as http;

import '../repository/token_secure.dart';
import '../repository/url.dart';

class friendApi {
  // var url = 'http://192.168.100.26:4000';
  // var url = 'http://192.168.100.240:4000';
  // var url = 'http://192.168.100.65:4000';
  var urls = url().uri;

  var token = tokensecure();
  // Future friendss(){
  //   return print("dsaa");
  // }

  Future<List<Pending>> pending() async {
    var tokens = await token.readToken("token");
    final res = await http.get(Uri.parse("$urls/pending"), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: 'Bearer $tokens'
    });
    if (res.statusCode == 200) {
      List<Pending> a = (json.decode(res.body) as List)
          .map((x) => Pending.fromJson(x))
          .toList();
      return a;
    } else {
      print(jsonDecode(res.body));
      throw Exception(res.reasonPhrase);
    }
  }

  Future pendingdelete(String id) async {
    var tokens = await token.readToken("token");
    final res =
        await http.delete(Uri.parse("$urls/pendingdelete/$id"), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: 'Bearer $tokens'
    });
    final json = jsonDecode(res.body);
    print(json);
    return json;
  }
 Future FriendDelete(String id) async {
    var tokens = await token.readToken("token");
    final res =
        await http.delete(Uri.parse("$urls/frienddelete/$id"), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: 'Bearer $tokens'
    });
    final json = jsonDecode(res.body);
    print(json);
    return json;
  }
  Future<List<Friendrequest>> friendreq() async {
    var tokens = await token.readToken("token");
    final res = await http.get(Uri.parse("$urls/friendreq"), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: 'Bearer $tokens'
    });
    if (res.statusCode == 200) {
      List<Friendrequest> a = (json.decode(res.body) as List)
          .map((x) => Friendrequest.fromJson(x))
          .toList();
      print(a);
      return a;
    } else {
      print(jsonDecode(res.body));
      throw Exception(res.reasonPhrase);
    }
  } 

  Future<List<Friend>> friends() async {
    var tokens = await token.readToken("token");
    final res = await http.get(Uri.parse("$urls/friend"), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: 'Bearer $tokens'
    });
    if (res.statusCode == 200) {
      List<Friend> a = (json.decode(res.body) as List)
          .map((x) => Friend.fromJson(x))
          .toList();
      print(a);
      return a;
    } else {
      print(jsonDecode(res.body)["msg"]);
      throw Exception(res.reasonPhrase);
    }
  }

  Future friendacc(String id) async {
    try {
      var tokens = await token.readToken("token");
      final res = await http.post(Uri.parse("$urls/friendreqacc/$id"), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $tokens'
      });
      // final json = jsonDecode(res.body);
      print(res.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future friendadd(String id) async {
    try {
      var tokens = await token.readToken("token");
      final res = await http.post(Uri.parse("$urls/friendadd/$id"), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $tokens'
      });
      // final json = jsonDecode(res.body);
      print(res.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Friend>> checkFriend(String id) async {
    var tokens = await token.readToken("token");
    final res = await http.get(Uri.parse("$url/checkfriend/$id"), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: 'Bearer $tokens'
    });
    if (res.statusCode == 200) {
      List<Friend> a = (json.decode(res.body) as List)
          .map((x) => Friend.fromJson(x))
          .toList();
      print(a);
      return a;
    } else {
      print(jsonDecode(res.body));
      throw Exception(res.reasonPhrase);
    }
  }
}
