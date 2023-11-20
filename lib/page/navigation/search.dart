// ignore_for_file: unnecessary_new, prefer_final_fields, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:chat_app/page/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/bloc/friendRequest/friendreq_bloc.dart';
import 'package:chat_app/bloc/friendRequest/friendreq_state.dart';
import 'package:chat_app/bloc/friends/friends_bloc.dart';
import 'package:chat_app/bloc/friends/friends_state.dart';
import 'package:chat_app/bloc/pending/pending_bloc.dart';
import 'package:chat_app/bloc/pending/pending_event.dart';
import 'package:chat_app/bloc/pending/pending_state.dart';
import 'package:chat_app/page/searchfind.dart';
import 'package:get/get.dart';

import '../../bloc/friendRequest/friendreq_event.dart';
import '../../bloc/friends/friends_event.dart';
import '../../repository/url.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var urls = url().uri;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: DefaultTabController(
        length: 4,
        child: NestedScrollView(
            headerSliverBuilder: (context, isScolled) {
              return [
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: Get.isDarkMode || Get.isPlatformDarkMode
                      ? Colors.black
                      : Colors.white,
                  collapsedHeight: MediaQuery.of(context).size.height * 0.08,
                  expandedHeight: 0.0,
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    tabs: [
                      Tab(child: Text("Friend")),
                      Tab(child: Text("Grup")),
                      Tab(child: Text("Friend Request")),
                      Tab(child: Text("Pending"))
                    ],
                    enableFeedback: false,
                    indicatorColor: Get.isDarkMode || Get.isPlatformDarkMode
                        ? Colors.white
                        : Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 1.5,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Get.isDarkMode || Get.isPlatformDarkMode
                        ? Colors.white
                        : Colors.black,
                  ),
                  flexibleSpace: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [_searchField()],
                        ),
                      ),
                    ],
                  ),
                )
              ];
            },
            body: TabBarView(
              children: [
                _friend(),
                _grup(),
                _friendRequest(),
                _pending(),
              ],
            )),
      )),
    );
  }

  Widget _friend() {
    return BlocListener<FriendsBloc, FriendsState>(listener: (context, state) {
      state is FriendsLoadingState;
    }, child: BlocBuilder<FriendsBloc, FriendsState>(builder: (context, state) {
      if (state is FriendsLoadingState) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        );
      }
      if (state is FriendsLoadDataState) {
        return ListView.builder(
            itemCount: state.data!.length,
            itemBuilder: (context, index) {
              var f = state.data![index];
              return Card(
                child: InkWell(
                  onTap: () {
                    print(f.friendid);
                    _frienddetailcard(f.friend.imgprofile, f.friend.username,
                        f.userid, f.friendid);
                  },
                  child: ListTile(
                    title: Text(f.friend.username),
                    leading: CircleAvatar(
                      backgroundImage: f.friend.imgprofile == null
                          ? NetworkImage(
                              "https://media.istockphoto.com/vectors/user-icon-flat-isolated-on-white-background-user-symbol-vector-vector-id1300845620?b=1&k=20&m=1300845620&s=170667a&w=0&h=JbOeyFgAc6-3jmptv6mzXpGcAd_8xqkQa_oUK2viFr8=")
                          : NetworkImage(
                              "$urls/imgprofile/${f.friend.imgprofile}"),
                    ),
                  ),
                ),
              );
            });
      }
      if (state is FriendsErorrState) {
        return Center(
          child: Text(
            'Friend Empty',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      );
    }));
  }

  Widget _grup() {
    return Center(
      child: Text("Grup"),
    );
  }

  Widget _friendRequest() {
    return BlocListener<FriendreqBloc, FriendreqState>(listener:
        (context, state) {
      if (state is FriendreqLoadingState) {
        BlocProvider.of<FriendreqBloc>(context).add(FriendreqLoadDataEvent());
      }
    }, child:
        BlocBuilder<FriendreqBloc, FriendreqState>(builder: (context, state) {
      if (state is FriendreqLoadingState) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        );
      }
      if (state is FriendreqLoadDataState) {
        return ListView.builder(
            itemCount: state.data!.length,
            itemBuilder: (context, index) {
              var cos = state.data![index];
              return Card(
                  child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: cos.friendreq.imgprofile == null
                      ? NetworkImage(
                          "https://media.istockphoto.com/vectors/user-icon-flat-isolated-on-white-background-user-symbol-vector-vector-id1300845620?b=1&k=20&m=1300845620&s=170667a&w=0&h=JbOeyFgAc6-3jmptv6mzXpGcAd_8xqkQa_oUK2viFr8=")
                      : NetworkImage(
                          "$urls/imgprofile/${cos.friendreq.imgprofile}"),
                ),
                title: Text(cos.friendreq.username),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<FriendreqBloc>(context)
                              .add(FriendaccEvent(id: cos.friendreq.id));
                          context
                              .read<FriendreqBloc>()
                              .add(FriendreqLoadDataEvent());
                          context.read<FriendsBloc>()
                            ..add(FriendsLoadDataEvent());
                        },
                        icon: Icon(Icons.check)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.close))
                  ],
                ),
                // Row(children: [
                //   IconButton(onPressed: (){}, icon: Icon(Icons.check)),
                //   IconButton(onPressed: (){}, icon: Icon(Icons.disabled_by_default_rounded))
                // ],),
              ));
            });
      }
      if (state is FriendreqErorrState) {
        return Center(
          child: Text(
            'Friend Request Empty',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
        // print("${state.msg}");
      }
      return Container();
    }));
  }

  Widget _pending() {
    return BlocListener<PendingBloc, PendingState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is PendingDeleteSuccesState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Pending Delete")));
        }
        if (state is PendingDeleteErorrState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("erorr")));
          // return Center(child: Text(state.msg),);
        }
        // if (state is PendingLoadingState) {
        //   BlocProvider.of<PendingBloc>(context)..add(PendingLoadDataEvent());
        // }
      },
      child: BlocBuilder<PendingBloc, PendingState>(builder: (context, state) {
        if (state is PendingLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          );
        }
        if (state is PendingLoadDataState) {
          return ListView.builder(
              itemCount: state.data!.length,
              itemBuilder: (context, index) {
                var cos = state.data![index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: cos.pendings.imgprofile == null
                          ? NetworkImage(
                              "https://media.istockphoto.com/vectors/user-icon-flat-isolated-on-white-background-user-symbol-vector-vector-id1300845620?b=1&k=20&m=1300845620&s=170667a&w=0&h=JbOeyFgAc6-3jmptv6mzXpGcAd_8xqkQa_oUK2viFr8=")
                          : NetworkImage(
                              "$urls/imgprofile/${cos.pendings.imgprofile}"),
                    ),
                    title: Text(cos.pendings.username),
                    trailing: IconButton(
                        onPressed: () {
                          BlocProvider.of<PendingBloc>(context)
                              .add(PendingDeleteEvent(id: cos.pendings.id));
                          context
                              .read<PendingBloc>()
                              .add(PendingLoadDataEvent());
                        },
                        icon: Icon(Icons.close)),
                  ),
                );
              });
        }
        if (state is PendingEmptyState) {
          return Center(
            child: Text("Data Empty"),
          );
        }
        if (state is PendingErorrState) {
          return Center(
            child: Text(
              'Pending Data Empty',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
          // print("${state.msg}");
        }
        return Container();
      }),
    );
  }

  Widget _searchField() {
    return InkWell(
      enableFeedback: false,
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchFind()));
      },
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.search,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Search'),
              )
            ],
          ),
        ),
      ),
    );
  }

  _frienddetailcard(String? img, String name, String id, String? fid) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
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
                    name,
                    style: TextStyle(fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            print(fid);
                            Navigator.pop(context);
                            Navigator.of(
                              context,
                            ).push(MaterialPageRoute(
                              builder: (context) => ChatPage(
                                dataid: id,
                                datafid: fid,
                                name: name,
                              ),
                            ));
                          },
                          icon: Icon(Icons.chat_bubble_outline_rounded)),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.info_outline_rounded)),
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<FriendsBloc>(context)
                              ..add(FriendsDeleteEvent(id));
                            context.read<FriendsBloc>()
                              ..add(FriendsLoadDataEvent());
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close)),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
