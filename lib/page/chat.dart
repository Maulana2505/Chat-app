
import 'package:chat_app/api/socket.dart';
import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/bloc/chat/chat_event.dart';
import 'package:chat_app/bloc/chat/chat_state.dart';
import 'package:chat_app/model/chat/chat_model.dart';

import 'package:chat_app/widget/costumCardChat.dart';
import 'package:chat_app/widget/costumCardChatFriend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, this.data, this.dataid, this.datafid, this.name});
  final FriendElement? data;
  final String? dataid;
  final String? datafid;
  final String? name;
  // final String? dataid;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _massage = TextEditingController();
  ScrollController _scrollController = ScrollController();
  io.Socket? sockets;
  bool pos = false;

  @override
  void initState() {
    socket().connect();
    // context.read<ChatBloc>().add(ChatLoadDataEvent());

    super.initState();
  }

  void _Scroll() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // context.read<ChatBloc>().add(ChatLoadDataEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _massage.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<ChatBloc>().add(ChatLoadDataEvent());
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: widget.dataid != null
              ? Text("${widget.name}")
              : widget.data?.userid.toString() != null
                  ? Text("${widget.data?.friend.username}")
                  : Text(""),
        ),
        body: SafeArea(
          child: BlocListener<ChatBloc, ChatState>(
            listener: (context, state) {
              // ChatApi().getchat();
                context.read<ChatBloc>().add(ChatLoadDataEvent());
            },
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: state is ChatLoadDataState
                          ? ListView.builder(
                              shrinkWrap: true,
                              reverse: true,
                              controller: _scrollController,
                              itemCount: state.data!.length,
                              itemBuilder: (context, index) {
                                var t = state.data![index];
                                return Column(
                                  children: [
                                    for (var b in t.friends)
                                      for (var y in b.chats)
                                        if(widget.dataid!.contains("${y.senderid.toString()}"))CostumcardChatMe(msg: y.massage.toString())
                                        else CostumcardChatyou(msg: y.massage.toString())
                                  ],
                                );
                              },
                            )
                          : Container(),
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            // height: MediaQuery.of(context).size.height*0.7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: TextField(
                                          controller: _massage,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(10),
                                            hintText: "Type",
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Get.isDarkMode
                                                        ? Colors.black
                                                        : Colors.grey),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(40))),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Get.isDarkMode
                                                        ? Colors.black
                                                        : Colors.grey),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(40))),
                                          ),
                                        ),
                                      ),
                                    ),
                                    CircleAvatar(
                                        backgroundColor: Colors.black,
                                        child: IconButton(
                                          icon: Icon(Icons.send),
                                          color: Colors.white,
                                          onPressed: () {
                                              var a = socket().sendmassage(
                                                  "${widget.datafid.toString()}",
                                                  _massage.text,
                                                  context);
                                              print(a.toString());
                                              _massage.clear();
                                              // _Scroll();
                                            // }
                                            
                                          },
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
