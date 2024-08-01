import 'package:flutter/material.dart';
import 'package:whatches_store/modul/modul.dart';
import 'package:whatches_store/page/PrudectsPage/item_card_design.dart';

class CardItem extends StatefulWidget {
  const CardItem(
      {super.key,
      required this.infoItem,
      required this.index,
      required this.onPressCalculaterTotalPrice});
  final Map infoItem;
  final int index;
  final Function onPressCalculaterTotalPrice;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  double? totalPrice;
  void CalculateTotalPrice() {
    setState(() {
      totalPrice =
          (widget.infoItem["number"] * widget.infoItem["item"]["Price"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    totalPrice = widget.infoItem["item"]["Price"] * widget.infoItem["number"];

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ItemCardDesign(
            itemInfo: widget.infoItem["item"],
            tag: "tag${widget.index}",
          ),
        ));
      },
      child: Container(
        height: h / 6,
        //margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 41, 40, 40),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.infoItem["item"]["name"],
                      style: TextStyle(color: colorOrange, fontSize: w / 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: h / 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Items Price : ",
                      style: TextStyle(color: colorOrange, fontSize: w / 20),
                    ),
                    Text(
                      "${totalPrice?.toStringAsFixed(2)}",
                      style: TextStyle(color: colorOrange, fontSize: w / 20),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (widget.infoItem["number"] > 1) {
                            setState(() {
                              basketItems[widget.index]["number"] =
                                  basketItems[widget.index]["number"] - 1;
                              // to calculate the total price in Basket Page
                              widget.onPressCalculaterTotalPrice();
                              //to calculate the total price inside Card
                              CalculateTotalPrice();
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: h / 20,
                        width: w / 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0x42525050),
                        ),
                        child: Center(
                          child: Text(
                            widget.infoItem["number"].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              basketItems[widget.index]["number"] =
                                  basketItems[widget.index]["number"] + 1;

                              widget.onPressCalculaterTotalPrice();
                              CalculateTotalPrice();
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Hero(
                tag: "tag${widget.index}",
                child:
                    Image.asset(widget.infoItem["item"]["Picture"].toString()))
          ],
        ),
      ),
    );
  }
}
