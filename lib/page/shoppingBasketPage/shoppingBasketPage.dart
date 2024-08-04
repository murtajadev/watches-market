// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:whatches_store/modul/modul.dart';
import 'package:whatches_store/page/shoppingBasketPage/showitemBasket/basket_has_Items.dart';

class ShoppingBasketPage extends StatefulWidget {
  const ShoppingBasketPage({super.key});

  @override
  State<ShoppingBasketPage> createState() => _ShoppingBasketPageState();
}

class _ShoppingBasketPageState extends State<ShoppingBasketPage> {
  bool checkItemsBasketFound = false;

  void checkItemBasket() {
    if (basketItems.isNotEmpty) {
      checkItemsBasketFound = true;
    } else {
      checkItemsBasketFound = false;
    }
    
    setState(() { 
    });
  }

  @override
  void initState() {
    checkItemBasket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x42525050),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          Text(
            "Shopping Basket",
            style: GoogleFonts.oswald(
              textStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.99),
              ),
            ),
          ),
          SizedBox(
            width: w / 3.5,
          )
        ],
      ),
      backgroundColor: Colors.black26,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: checkItemsBasketFound
            ? BasketHasItems(
                checkBasketIsEmpty: checkItemBasket,
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "The Basket Is Empty",
                      style: TextStyle(color: Colors.white, fontSize: h / 25),
                    ),
                    LottieBuilder.asset(
                      "asset/basket_is_empty.json",
                      //animate: false,
                      height: h / 3.5,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
