import 'dart:convert';
import 'dart:io';

import 'package:chat_app/model/chat/chat_model.dart';

import 'package:http/http.dart' as http;

import '../repository/token_secure.dart';
import '../repository/url.dart';

class ChatApi {
  var token = tokensecure();
  var urls = url().uri;
  Future<List<Chat>> getchat() async {
    var tokens = await token.readToken("token");
    final res = await http.get(Uri.parse("$urls/chat"), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: 'Bearer $tokens'
    });
    if (res.statusCode == 200) {
      List<Chat> a =
          (json.decode(res.body) as List).map((e) => Chat.fromJson(e)).toList();
      return a;
    } else {
      print(jsonDecode(res.body));
      throw Exception(res.reasonPhrase);
    }
  }

  Future sendmassage(String ids, String msg) async {
    var idss = await token.readToken("id");
    var tokens = await token.readToken("token");

    final res = await http.post(Uri.parse("$urls/sendmassage/$ids"), headers: {
      // HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: 'Bearer $tokens'
    }, body: {
      'senderid': idss,
      'receiverid': ids,
      'massage': msg
    });
    var data = json.decode(res.body);
    return data;
  }
}
