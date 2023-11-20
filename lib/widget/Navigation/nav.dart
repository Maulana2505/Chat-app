// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_final_fields, avoid_unnecessary_containers, prefer_const_constructors, avoid_single_cascade_in_expression_statements

import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/bloc/chat/chat_event.dart';
import 'package:chat_app/bloc/friends/friends_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/api/user.dart';
import 'package:chat_app/bloc/profileuser/profileuser_bloc.dart';
import 'package:chat_app/bloc/profileuser/profileuser_event.dart';
import 'package:chat_app/bloc/profileuser/profileuser_state.dart';
import 'package:chat_app/api/socket.dart';
import 'package:chat_app/page/navigation/home.dart';
import 'package:chat_app/page/navigation/profile_two.dart';
import 'package:chat_app/page/navigation/search.dart';

import '../../bloc/friendRequest/friendreq_bloc.dart';
import '../../bloc/friendRequest/friendreq_event.dart';
import '../../bloc/friends/friends_bloc.dart';
import '../../bloc/pending/pending_bloc.dart';
import '../../bloc/pending/pending_event.dart';
import '../../repository/token_secure.dart';
import '../../repository/url.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  final userapi = userApi();
  var imggg;
  var token = tokensecure();
  
  List _pages = [HomeScreen(), Search(), ProfileTwo()];
  @override
  void initState() {
    super.initState();
    socket().connect();
    context.read<ChatBloc>()..add(ChatLoadDataEvent());
    context.read<PendingBloc>()..add(PendingLoadDataEvent());
    context.read<FriendreqBloc>()..add(FriendreqLoadDataEvent());
    context.read<FriendsBloc>()..add(FriendsLoadDataEvent());
    context.read<ProfileuserBloc>()..add(ProfileuserLoadDataEvent());
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // context.watch<ChatBloc>()..add(ChatLoadDataEvent());
    super.didChangeDependencies();
    
    widget.createState();
    print("didccc nav");
  }
  @override
  Widget build(BuildContext context) {
    bool light = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: _Navbarcolorgradient(light, context),
    ); 
  }

  Widget _Navbarcolorgradient(bool light, BuildContext context) {
    
    var urls = url().uri;

    return
        BlocBuilder<ProfileuserBloc, ProfileuserState>(
            builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 0.9],
                colors: light
                    ? [Colors.transparent, Color.fromARGB(97, 0, 0, 0)]
                    : [Colors.transparent, Color.fromARGB(87, 255, 255, 255)])),
        child: BottomNavigationBar(
            unselectedItemColor: Colors.grey[40],
            elevation: 0,
            selectedItemColor: light ? Colors.black : Color(0xffC4C4C4),
            backgroundColor: Colors.transparent,
            currentIndex: _selectedIndex,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.chat_bubble_outline),
                  activeIcon: Icon(Icons.chat_bubble)),
              BottomNavigationBarItem(
                  label: 'Search',
                  icon: Icon(Icons.people_alt_outlined),
                  activeIcon: Icon(Icons.people)),
              BottomNavigationBarItem(
                  label: 'person',
                  icon: CircleAvatar(
                    // var url = "http://192.168.241.113";
                    backgroundImage: state is ProfileuserLoadDataState
                        ? state.user!.imgprofile == null
                            ? NetworkImage(
                                "https://media.istockphoto.com/vectors/user-icon-flat-isolated-on-white-background-user-symbol-vector-vector-id1300845620?b=1&k=20&m=1300845620&s=170667a&w=0&h=JbOeyFgAc6-3jmptv6mzXpGcAd_8xqkQa_oUK2viFr8=")
                            : NetworkImage(
                                "$urls/imgprofile/${state.user!.imgprofile}")
                        // p(state.user!.imgprofile)
                        : NetworkImage(
                            "https://media.istockphoto.com/vectors/user-icon-flat-isolated-on-white-background-user-symbol-vector-vector-id1300845620?b=1&k=20&m=1300845620&s=170667a&w=0&h=JbOeyFgAc6-3jmptv6mzXpGcAd_8xqkQa_oUK2viFr8="),
                    backgroundColor: Color(0xffC4C4C4),
                    radius: 13,
                  ))
            ]),
      );
    });
  }

  
}
