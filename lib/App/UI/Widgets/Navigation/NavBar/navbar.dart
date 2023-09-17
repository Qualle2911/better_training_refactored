

import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';


class Navbar extends StatefulWidget {
  Navbar({Key? key}) : super(key: key);
  static int currentIndex = 0;

  //Todo controller for the bottom navigation bar

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Workout",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.mobile_friendly),
      label: "Dashboard",
    ),


    const BottomNavigationBarItem(
      icon: Icon(Icons.social_distance),
      label: "Progress",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_2_outlined),
      label: "Profile",
    ),
  ];

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  void onTap(int i) {
    setState(() {
      Navbar.currentIndex = i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: widget.items,
        currentIndex: Navbar.currentIndex,
        onTap: (i){
          onTap(i);
          switch(Navbar.currentIndex){
            case 0:
              Routemaster.of(context).push("/");
              break;
            case 1:
              Routemaster.of(context).push("/dashboard");
              break;
            case 2:
              //Routemaster.of(context).push("/2");
              break;
            case 3:
              //Routemaster.of(context).push("/3");
              break;
          }
        },



    );
  }
}




