// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatches_store/modul/modul.dart';
import 'package:whatches_store/page/shoppingBasketPage/cardItem.dart';
import 'package:whatches_store/page/shoppingBasketPage/formReceivingTheOrder.dart';

class ShoppingBasketPage extends StatefulWidget {
  const ShoppingBasketPage({super.key});

  @override
  State<ShoppingBasketPage> createState() => _ShoppingBasketPageState();
}

class _ShoppingBasketPageState extends State<ShoppingBasketPage> {
  double totalPrice = 0.0;
  bool checkItemsBasketFound = false;
  bool convertContainerToPage = false;
  void checkItemBasket() {
    if (basketItems.isNotEmpty) {
      checkItemsBasketFound = true;
    } else {
      checkItemsBasketFound = false;
    }
  }

  void CalculatorTotalPrice() {
    setState(() {
      totalPrice = 0;
      for (int i = 0; i < basketItems.length; i++) {
        totalPrice +=
            (basketItems[i]["number"] * basketItems[i]["item"]["Price"]);
      }
    });
  }

  @override
  void initState() {
    CalculatorTotalPrice();
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
            ? Stack(
                alignment: Alignment.bottomRight,
                children: [
                  SizedBox(
                    height: h / 1.1,
                    child: AnimationLimiter(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: h / 70,
                        ),
                        itemCount: basketItems.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 600),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                  child: Slidable(
                                endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        icon: Icons.delete,
                                        label: "Delete",
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                        onPressed: (context) {
                                          setState(() {
                                            basketItems.removeAt(index);
                                            CalculatorTotalPrice();
                                          });
                                        },
                                      ),
                                    ]),
                                startActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        icon: Icons.delete,
                                        label: "Delete",
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                        onPressed: (context) {
                                          setState(() {
                                            basketItems.removeAt(index);
                                            CalculatorTotalPrice();
                                          });
                                        },
                                      ),
                                    ]),
                                child: CardItem(
                                  infoItem: basketItems[index],
                                  index: index,
                                  onPressCalculaterTotalPrice:
                                      CalculatorTotalPrice,
                                ),
                              )),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price : ",
                            style: TextStyle(
                                color: Colors.white, fontSize: w / 22),
                          ),
                          Text(
                            "\$${totalPrice.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: Colors.white, fontSize: w / 22),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        convertContainerToPage = true;
                      });
                    },
                    child: AnimatedContainer(
                      height: convertContainerToPage
                          ? MediaQuery.of(context).size.height + 2
                          : h / 16,
                      width: convertContainerToPage
                          ? MediaQuery.of(context).size.width + 2
                          : w / 2.2,
                      alignment: convertContainerToPage
                          ? Alignment.center
                          : Alignment.topRight,
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: convertContainerToPage
                              ? const Color(0xFF141414)
                              : Colors.black12,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                offset: const Offset(1, 1),
                                blurRadius: 2,
                                blurStyle: BlurStyle.normal)
                          ]),
                      child: convertContainerToPage
                          ? const FormReceivingTheOrder()
                          : Center(
                              child: Text(
                                "Order Now",
                                style: GoogleFonts.oswald(
                                    color: colorOrange, fontSize: w / 20),
                              ),
                            ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Text(
                  "The Basket Is Empty",
                  style: TextStyle(color: Colors.white, fontSize: h / 20),
                ),
              ),
      ),
    );
  }
}
