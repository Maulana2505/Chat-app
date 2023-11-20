// ignore_for_file: non_constant_identifier_names, library_prefixes

import 'package:chat_app/repository/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../bloc/chat/chat_bloc.dart';
import '../bloc/chat/chat_event.dart';
import '../repository/token_secure.dart';

class socket {
  var urls = url().uri;
  // IO.Socket? Socket;
  var token = tokensecure();
  var sockets = IO.io(
      "http://192.168.100.129:4000",
      // "http://192.168.43.64:4000",
      IO.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .build());
  connect() async {
    var tokens = await token.readToken("id");
    print("connet from socket $tokens");

    print("Socket conecct: ${sockets.connected}");
    sockets.emit("setup", tokens);
    // sockets.emit("online", tokens);
    sockets.connect();
    sockets.onConnect((_) => print("Connected"));
    sockets.onConnectError((err) => print(err));
    sockets.onError((err) => print(err));

    // print(Socket.connected);
  }

  Future sendmassage(
      String recieverID, String massage, BuildContext context) async {
    // late IO.Socket Socket;
    print("Socket sendmassage : ${sockets.connected}");
    var tokens = await token.readToken("id");
    BlocProvider.of<ChatBloc>(context)
      ..add(ChatSendEvent(ids: recieverID, msg: massage));
    sockets.emit("messages",
        {"id": tokens, "recieverid": recieverID, "massage": massage});
  }

  void StatusUsers() async {
    var tokens = await token.readToken("id");
    sockets.emit("online", tokens);
  }
}
