// ignore_for_file: avoid_single_cascade_in_expression_statements, prefer_const_constructors

import 'package:chat_app/bloc/friendRequest/friendreq_bloc.dart';
import 'package:chat_app/bloc/friendRequest/friendreq_event.dart';
import 'package:chat_app/bloc/friends/friends_bloc.dart';
import 'package:chat_app/bloc/friends/friends_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/bloc/search/search_bloc.dart';
import 'package:chat_app/bloc/search/search_event.dart';
import 'package:chat_app/bloc/search/search_state.dart';
import 'package:get/get.dart';

import '../bloc/pending/pending_bloc.dart';
import '../bloc/pending/pending_event.dart';
import '../repository/token_secure.dart';
import '../repository/url.dart';

class SearchFind extends StatefulWidget {
  const SearchFind({Key? key}) : super(key: key);

  @override
  State<SearchFind> createState() => _SearchFindState();
}

String token = tokensecure().readToken("id").toString();
var urls = url().uri;
String id = "";

class _SearchFindState extends State<SearchFind> {
  final _find = TextEditingController()..text;
  var url = "http://192.168.100.65:4000";
  String q = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token=id;
    print(id.toString());
    _find.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _find.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PendingBloc>()..add(PendingLoadDataEvent());
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [_search(), Expanded(child: _SearchResult())],
          ),
        ),
      ),
    );
  }

  Widget _search() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {
              _find.clear();
              q = "";
              BlocProvider.of<SearchBloc>(context)
                ..add(SearchLoadDataEvent(query: q));
              context.read<PendingBloc>()..add(PendingLoadDataEvent());
              context.read<FriendreqBloc>()..add(FriendreqLoadDataEvent());
              context.read<FriendsBloc>()..add(FriendsLoadDataEvent());
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
        Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              autofocus: true,
              controller: _find,
              onChanged: (value) {
                q = value;
                final data = BlocProvider.of<SearchBloc>(context)
                  ..add(SearchLoadDataEvent(query: q));

                print(data);
              },
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 17),
              cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "Search",
                prefixIcon: Icon(
                  Icons.search,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                suffixIcon: _find.text.isEmpty
                    ? Container(
                        width: 0,
                      )
                    : IconButton(
                        onPressed: () {
                          _find.clear();
                          q = "";
                          BlocProvider.of<SearchBloc>(context)
                            ..add(SearchLoadDataEvent(query: q));
                        },
                        icon: Icon(
                          Icons.close,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Get.isDarkMode ? Colors.black : Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Get.isDarkMode ? Colors.black : Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ))
      ],
    );
  }

  Widget _SearchResult() {
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state is SearchLoadingState) {
          BlocProvider.of<SearchBloc>(context)
            ..add(SearchLoadDataEvent(query: q));
        }
      },
      child: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
        if (state is SearchLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          );
        }
        if (state is SearchLoadDataState) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.user!.length,
              itemBuilder: (context, i) {
                var cos = state.user![i];
                return Card(
                  child: ListTile(
                      leading: CircleAvatar(
                        maxRadius: 20,
                        backgroundImage: cos.imgprofile == null
                            ? NetworkImage(
                                "https://media.istockphoto.com/vectors/user-icon-flat-isolated-on-white-background-user-symbol-vector-vector-id1300845620?b=1&k=20&m=1300845620&s=170667a&w=0&h=JbOeyFgAc6-3jmptv6mzXpGcAd_8xqkQa_oUK2viFr8=")
                            : NetworkImage(
                                "$urls/imgprofile/${cos.imgprofile}"),
                      ),
                      title: Text(cos.username),
                      trailing: id == cos.id
                          ? Text("YOU")
                          : cos.friendrequests.length == 1
                              ? ElevatedButton(
                                  onPressed: () {
                                    showDialogPending(
                                        cos.imgprofile, cos.username, cos.id);
                                  },
                                  child: Text('Pending'))
                              // Text("Pending")
                              : cos.pendings.length == 1
                                  ? Text("friendReq")
                                  : cos.friends.length == 1
                                      ? Text("Friend")
                                      : IconButton(
                                          icon: Icon(
                                              Icons.person_add_alt_1_rounded),
                                          onPressed: () async {
                                            CircularProgressIndicator(
                                              color: Get.isDarkMode
                                                  ? Colors.white
                                                  : Colors.black,
                                            );
                                            BlocProvider.of<FriendreqBloc>(
                                                    context)
                                                .add(
                                                    FriendAddEvent(id: cos.id));
                                            context.read<SearchBloc>()
                                              ..add(SearchLoadDataEvent(
                                                  query: q));
                                          },
                                        )),
                );
              });
        }
        if (state is SearchErrorState) {
          return Center(
            child: Text("Empty"),
          );
        }
        return Container();
      }),
    );
  }

  showDialogPending(String? img, String us, String id) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: img == null
                        ? AssetImage('assets/images/ava.jpg') as ImageProvider
                        : NetworkImage("$urls/imgprofile/$img"),
                  ),
                  Text(
                    us,
                    style: TextStyle(fontSize: 25),
                  ),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<PendingBloc>(context)
                            .add(PendingDeleteEvent(id: id));
                        context.read<SearchBloc>()
                          ..add(SearchLoadDataEvent(query: q));
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
            ),
          );
        });
  }
}
