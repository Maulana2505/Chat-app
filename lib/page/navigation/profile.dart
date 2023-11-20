// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:chat_app/api/user.dart';
import 'package:chat_app/bloc/profileuser/profileuser_bloc.dart';
import 'package:chat_app/bloc/profileuser/profileuser_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  userApi userapi = userApi();
  
  @override
  Widget build(BuildContext context) {
    bool _light = Theme.of(context).brightness == Brightness.light;
    var _heignt = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    TabController tabcontroller = TabController(length: 3, vsync: this);
    @override
    void initState() {
      super.initState();
      tabcontroller;
      // tabcontroller = TabController(
      //   length: 3,
      //   vsync: this,
      // );
    }

    @override
    void dispose() {
      tabcontroller.dispose();
      userapi.dispose();
      Bloc;
      super.dispose();
    }

    return BlocBuilder<ProfileuserBloc, ProfileuserState>(
        builder: (context, state) {
      if (state is ProfileuserLoadingDataState) {
        return CircularProgressIndicator(
          color: Get.isDarkMode || Get.isPlatformDarkMode
              ? Colors.white
              : Colors.black,
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
            child: NestedScrollView(
                physics: const PageScrollPhysics(),
                headerSliverBuilder: (context, isScolled) {
                  var snapshot;
                  return [
                    SliverAppBar(
                      elevation: 0,
                      backgroundColor: Get.isDarkMode || Get.isPlatformDarkMode
                          ? Colors.black
                          : Colors.white,
                      collapsedHeight: Get.height * 0.35,
                      expandedHeight: Get.height * 0.1,
                      // bottom:
                      //  TabBar(

                      //   controller: tabcontroller,
                      //   tabs: [
                      //     Tab(icon: Icon(Icons.grid_on)),
                      //     Tab(icon: Icon(Icons.favorite_border_outlined)),
                      //     Tab(icon: Icon(Icons.bookmark_border)),
                      //   ],
                      //   indicatorColor: Get.isDarkMode || Get.isPlatformDarkMode
                      //     ? Colors.white
                      //     : Colors.black,
                      //   indicatorSize: TabBarIndicatorSize.tab,
                      //   indicatorWeight: 1.5,
                      //   unselectedLabelColor: Colors.grey,
                      //   labelColor: Get.isDarkMode || Get.isPlatformDarkMode
                      //     ? Colors.white
                      //     : Colors.black,
                      // ),
                      flexibleSpace: Column(
                        children: [
                          _menu(),
                           
                          _profilimg(state.user!.imgprofile),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          _username(state.user!.username, _light),
                          SizedBox(
                            height: Get.height * 0.05,
                          ),
                          // _all(
                          //     // state.user!.post.length,
                          //     // state.user!.follow.length,
                          //     // state.user!.following.length
                          //     )
                        ],
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: _SliverAppBarDelegate(TabBar(
                        controller: tabcontroller,
                        tabs: const [
                          Tab(icon: Icon(Icons.grid_on)),
                          Tab(icon: Icon(Icons.favorite_border_outlined)),
                          Tab(icon: Icon(Icons.bookmark_border)),
                        ],
                        indicatorColor: Get.isDarkMode || Get.isPlatformDarkMode
                            ? Colors.white
                            : Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 1.5,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Get.isDarkMode || Get.isPlatformDarkMode
                            ? Colors.white
                            : Colors.black,
                      )),
                      floating: true,
                      pinned: true,
                    )
                  ];
                },
                body: TabBarView(
                  controller: tabcontroller,
                  children: [
                    // _postview()
                    // Text("1")
                    
                    Container(),
                    Container()
                  ],
                )),
          ),
        );
      }
      return Container();
    });
  }

  Widget _profilimg(String? img) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: img == null
              ? const NetworkImage(
                  "https://media.istockphoto.com/vectors/user-icon-flat-isolated-on-white-background-user-symbol-vector-vector-id1300845620?b=1&k=20&m=1300845620&s=170667a&w=0&h=JbOeyFgAc6-3jmptv6mzXpGcAd_8xqkQa_oUK2viFr8=")
              : NetworkImage("http://192.168.100.26:4000/imgprofile/$img"),
          radius: 50,
        ),
      ],
    );
  }

  // Widget _postview() {
  //   var _heignt = MediaQuery.of(context).size.height;
  //   return FutureBuilder<usermodel?>(
  //       future: userapi.profileuser(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasError) {
  //           return Center(
  //             child: Text("Network Error"),
  //           );
  //         }
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return Center(
  //             child: CircularProgressIndicator(
  //               color: Get.isDarkMode || Get.isPlatformDarkMode
  //                   ? Colors.white
  //                   : Colors.black,
  //             ),
  //           );
  //         }
  //         if (snapshot.hasData) {
  //           return snapshot.data!.post.isEmpty
  //               ? Center(
  //                   child: Text(
  //                     "Post Empty",
  //                     style: TextStyle(
  //                       color: Get.isDarkMode || Get.isPlatformDarkMode
  //                           ? Colors.white
  //                           : Colors.black,
  //                       // Colors.amber
  //                     ),
  //                   ),
  //                 )
  //               : GridView.builder(
  //                   padding: EdgeInsets.only(left: 10, right: 5),
  //                   scrollDirection: Axis.vertical,
  //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                       crossAxisCount: 3, mainAxisSpacing: 20),
  //                   shrinkWrap: true,
  //                   itemCount: snapshot.data?.post.length,
  //                   itemBuilder: (context, index) {
  //                     return InkWell(
  //                       onTap: () {},
  //                       child: Column(
  //                         children: [
  //                           Image.network(
  //                             "http://192.168.100.26:4000/imgpost/${snapshot.data!.post[index].imgpost}",
  //                             fit: BoxFit.contain,
  //                             height: Get.height * 0.15,
  //                           ),
  //                           // CachedNetworkImage(imageUrl: "http://192.168.100.83:4000/imgpost/${snapshot.data!.post[index].imgpost}",
  //                           // fit: BoxFit.fill,
  //                           // height: Get.height,)
  //                         ],
  //                       ),
  //                     );
  //                   });
  //         }
  //         return Center(child: CircularProgressIndicator());
  //       });
  // }

  Widget _username(String text, bool light) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Get.isPlatformDarkMode ? Colors.white : Colors.black),
    );
  }

  Widget _menu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            enableFeedback: false,
            onTap: (){
              
            },
            child: const Icon(Icons.menu_rounded),
          ),
        )
      ],
    );
  }

  Widget _all(int state, int follow, int following) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "$state",
              // style: TextStyle(
              //     color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
            const Text("Photos")
          ],
        ),
        Column(
          children: [Text("$follow"), const Text("Follows")],
        ),
        Column(
          children: [Text("$following"), const Text("Followers")],
        )
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Get.isDarkMode || Get.isPlatformDarkMode
          ? Colors.black
          : Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
