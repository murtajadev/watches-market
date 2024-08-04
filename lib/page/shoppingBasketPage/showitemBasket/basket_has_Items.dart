import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatches_store/modul/modul.dart';
import 'package:whatches_store/page/shoppingBasketPage/cardItem.dart';
import 'package:whatches_store/page/shoppingBasketPage/formReceivingTheOrder.dart';

class BasketHasItems extends StatefulWidget {
  const BasketHasItems({super.key, required this.checkBasketIsEmpty});
  final void Function() checkBasketIsEmpty;

  @override
  State<BasketHasItems> createState() => _BasketHasItemsState();
}

class _BasketHasItemsState extends State<BasketHasItems> {
  double totalPrice = 0.0;

  bool checkItemsBasketFound = false;

  bool convertContainerToPage = false;

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Stack(
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
                      endActionPane:
                          ActionPane(motion: const ScrollMotion(), children: [
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
                            widget.checkBasketIsEmpty;
                          },
                        ),
                      ]),
                      startActionPane:
                          ActionPane(motion: const ScrollMotion(), children: [
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
                            widget.checkBasketIsEmpty;
                          },
                        ),
                      ]),
                      child: CardItem(
                        infoItem: basketItems[index],
                        index: index,
                        onPressCalculaterTotalPrice: CalculatorTotalPrice,
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
                  style: TextStyle(color: Colors.white, fontSize: w / 22),
                ),
                Text(
                  "\$${totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(color: Colors.white, fontSize: w / 22),
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
            alignment:
                convertContainerToPage ? Alignment.center : Alignment.topRight,
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
    );
  }
}
