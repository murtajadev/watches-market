import 'package:boxicons/boxicons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:whatches_store/page/HomePage/home_page.dart';
import 'package:whatches_store/page/favoritePage/favorite_page.dart';
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

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectPage,
        animationCurve: Curves.ease,
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: Colors.orange,
        height: h / 15,
        buttonBackgroundColor: Colors.white,
        color: Colors.black,
        items: [
          Icon(
            Boxicons.bx_home,
            size: w / 19,
            color: Colors.orange,
          ),
          Icon(
            Boxicons.bx_basket,
            size: w / 20,
            color: Colors.orange,
          ),
          Icon(
            Boxicons.bxs_save,
            size: w / 20,
            color: Colors.orange,
          ),
        ],
        onTap: (value) {
          setState(() {
            _selectPage = value;
          });
        },
      ),
      body: Pages.elementAt(_selectPage),
    );
  }
}
