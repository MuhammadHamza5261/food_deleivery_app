import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_deleviery_app/screens/home_screen.dart';
import 'package:food_deleviery_app/screens/profile_screen.dart';
import 'package:food_deleviery_app/screens/wallet_screen.dart';
import '../screens/food_cart.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNavBar> {

  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late HomeScreen homepage;
  late ProfileScreen profile;
  late Order order;
  late Wallet wallet;


  @override
  void initState() {
    homepage = const HomeScreen();
    order = const Order();
    profile = const ProfileScreen();
    wallet = const Wallet();
    pages = [homepage, order, wallet, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: Colors.white,
          color: Colors.black,
          animationDuration: const Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: const [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.wallet_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outline,
              color: Colors.white,
            )
          ]),
      body: pages[currentTabIndex],
    );
  }
}