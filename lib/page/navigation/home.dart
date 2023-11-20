import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/bloc/chat/chat_state.dart';
import 'package:chat_app/page/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../bloc/chat/chat_event.dart';
import '../../model/chat/chat_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var c;
  @override
  void initState() {
    // TODO: implement initState
    context.read<ChatBloc>()..add(ChatLoadDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Chat App"),
      ),
      body: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          // state is ChatLoadDataState;
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                if (state is ChatLoadDataState)
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        // reverse: true,
                        itemCount: state.data!.length,
                        itemBuilder: (context, index) {
                          c = state.data![index];
                          return Column(
                            children: [
                              if (c.friends.isEmpty)
                                Center(child: Text("Chat Empty"))
                              else
                                for (var dat in c.friends)
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ChatPage(
                                              dataid: c.id,
                                              datafid: dat.friendid,
                                              name: dat.friend.username,
                                            ),
                                          ));
                                    },
                                    child: ListTile(
                                      title: Text(
                                          "${dat.friend.username.toString()}"),
                                      subtitle: Text(
                                        "${dat.chats.last.massage}",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
