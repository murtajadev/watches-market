import 'package:boxicons/boxicons.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

import 'package:flutter/material.dart';
import 'package:whatches_store/modul/modul.dart';
import 'package:whatches_store/page/HomePage/homePage.dart';
import 'package:whatches_store/page/favoritePage/favoritePage.dart';
import 'package:whatches_store/page/shoppingBasketPage/shoppingBasketPage.dart';

class BottonNavigationBar extends StatefulWidget {
  const BottonNavigationBar({super.key});

  @override
  State<BottonNavigationBar> createState() => _BottonNavigationBarState();
}

class _BottonNavigationBarState extends State<BottonNavigationBar> {
  List<Widget> Pages = [
    const HomePage(),
    const ShoppingBasketPage(),
    const FavoritePage(),
  ];
  int _selectPage = 0;
  final PageController controller = PageController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linearToEaseOut,
        showElevation: false,
        animationDuration: const Duration(milliseconds: 600),
        selectedIndex: _selectPage,
        backgroundColor: colorOrange,
        height: 55,
        items: [
          FlashyTabBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              activeColor: Colors.white,
              inactiveColor: Colors.black),
          FlashyTabBarItem(
              icon: const Icon(Boxicons.bx_basket),
              title: const Text('Basket'),
              activeColor: Colors.white,
              inactiveColor: Colors.black),
          FlashyTabBarItem(
              icon: const Icon(Boxicons.bx_save),
              title: const Text('Favorite'),
              activeColor: Colors.white,
              inactiveColor: Colors.black),
        ],
        onItemSelected: (index) {
          setState(() {
            _selectPage = index;
          });
        },
        iconSize: 30,
      ),
      body: Pages.elementAt(_selectPage),
    );
  }
}
