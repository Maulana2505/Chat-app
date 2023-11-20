import 'package:flutter/material.dart';

class SliverPheader extends SliverPersistentHeaderDelegate{
  final TabBar tabbar;

  SliverPheader(this.tabbar);
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
       color: Colors.white,
      child: tabbar,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => tabbar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => tabbar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
  
}