// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_single_cascade_in_expression_statements

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/bloc/auth/auth_bloc.dart';
import 'package:chat_app/bloc/profileuser/profileuser_bloc.dart';
import 'package:chat_app/bloc/profileuser/profileuser_state.dart';
import 'package:chat_app/page/detailprofile.dart';
import 'package:chat_app/page/welcomepage.dart';
import 'package:chat_app/repository/fileupload.dart';
import 'package:get/get.dart';
// import '../../api/user.dart';
import '../../bloc/auth/auth_event.dart';
import '../../repository/url.dart';

class ProfileTwo extends StatefulWidget {
  const ProfileTwo({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileTwo> createState() => _ProfileTwoState();
}

class _ProfileTwoState extends State<ProfileTwo> {
  final picked = fileuploud();
  // var url = "http://192.168.100.65:4000";
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<ProfileuserBloc>(context)..add(ProfileuserLoadDataEvent());
  }

  @override
  void dispose() {
    print("disspose");
    super.dispose();
  }

  var urls = url().uri;

  @override
  Widget build(BuildContext context) {
    // final user = userApi();
    // final userdata = user.profileuser();
    return BlocListener<ProfileuserBloc, ProfileuserState>(
      listener: (context, state) {
        state is ProfileuserLoadingDataState;
      },
      child: BlocBuilder<ProfileuserBloc, ProfileuserState>(
        builder: (context, state) {
          if (state is ProfileuserLoadingDataState) {
            return Center(
              child: CircularProgressIndicator(
                color: Get.isDarkMode || Get.isPlatformDarkMode
                    ? Colors.white
                    : Colors.black,
              ),
            );
          }
          if (state is ProfileuserErrorState) {
            return Center(
              child: Text(state.msg),
            );
          }
          if (state is ProfileuserLoadDataState) {
            return Scaffold(
              body: SafeArea(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailProfile(statedetail: state)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        p(state.user?.imgprofile),
                        username(state.user!.username)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Divider(
                    thickness: 2,
                    height: MediaQuery.of(context).size.height * 0.03,
                    indent: MediaQuery.of(context).size.height * 0.04,
                    endIndent: MediaQuery.of(context).size.width * 0.04,
                  ),
                  listtile(context)
                ],
              )),
            );
          }
          return Container();
        },
      ),
    );
    // );
  }

  Widget mode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {},
            icon: Get.isPlatformDarkMode || Get.isDarkMode
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.nightlight))
      ],
    );
  }

  Widget p(String? img) {
    return CircleAvatar(
      backgroundImage: img != null
          ? NetworkImage("$urls/imgprofile/$img")
          : const NetworkImage(
              "https://media.istockphoto.com/vectors/user-icon-flat-isolated-on-white-background-user-symbol-vector-vector-id1300845620?b=1&k=20&m=1300845620&s=170667a&w=0&h=JbOeyFgAc6-3jmptv6mzXpGcAd_8xqkQa_oUK2viFr8="),
      radius: 50,
    );
  }

  Widget username(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget listtile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.dark_mode_sharp),
            title: const Text("Themes"),
            trailing: const Icon(Icons.arrow_right_outlined),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text("Setting"),
            trailing: const Icon(Icons.arrow_right_outlined),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Log Out"),
            trailing: const Icon(Icons.arrow_right_outlined),
            onTap: () async {
              BlocProvider.of<AuthenticationBloc>(context)..add(LoggedOut());
              // print(s);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Welcomepage()),
                  (Route<dynamic> route) => false);
              // Get.to(Welcomepage());
            },
          )
        ],
      ),
    );
  }
}
