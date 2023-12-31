import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_router.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedPageIndex;

  const BottomNavBar({
    Key? key,
    this.selectedPageIndex = 0,
  }) : super(key: key);


  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      height: 60,
      index: widget.selectedPageIndex,
      items: const <Widget>[
        Icon(Icons.home, size: 30, color: Colors.white),
        Icon(Icons.person, size: 30, color: Colors.white),
        Icon(Icons.settings, size: 30, color: Colors.white),
      ],
      buttonBackgroundColor: Colors.redAccent,
      backgroundColor: themeData.scaffoldBackgroundColor,
      color: Colors.redAccent,
      animationCurve: Curves.easeInOut,
      onTap: (index) {
        _timer = Timer(const Duration(milliseconds: 500), () {
          switch(index){
            case 0:
              GoRouter.of(context).go(RouteUri.dashboard);
              break;
            case 1:
              GoRouter.of(context).go(RouteUri.myProfile);
              break;
            case 2:
              GoRouter.of(context).go(RouteUri.settings);
              break;
            default:
              GoRouter.of(context).go(RouteUri.home);
              break;
          }
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
