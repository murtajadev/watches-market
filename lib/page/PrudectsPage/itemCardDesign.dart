// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:whatches_store/modul/modul.dart';

class ItemCardDesign extends StatefulWidget {
  const ItemCardDesign({
    super.key,
    required this.itemInfo,
    required this.tag,
  });

  final Map itemInfo;
  final String tag;

  @override
  State<ItemCardDesign> createState() => _ItemCardDesignState();
}

class _ItemCardDesignState extends State<ItemCardDesign> {
  Color colorBackgroung = const Color(0x42525050);
  bool _isFavoriteItem = false;
  late Box ListFavoriteItemsHive;
  late Box BasketItemsHive;
  int numberofItem = 1;
  void _onPressAddFavoriteOrRemove() {
    setState(() {
      _isFavoriteItem = !_isFavoriteItem;
    });
    if (_isFavoriteItem) {
      setState(() {
        favoriteItems.add(widget.itemInfo);
        ListFavoriteItemsHive.put("favorite", favoriteItems);
      });
    }
    if (_isFavoriteItem == false) {
      setState(
        () {
          favoriteItems.removeAt(
            favoriteItems.indexWhere(
                (element) => element["name"] == widget.itemInfo["name"]),
          );
          ListFavoriteItemsHive.put("favorite", favoriteItems);
        },
      );
    }
  }

  @override
  void initState() {
    _openBoxAndCheckISFavorite();
    _openBoxBasket();
    super.initState();
  }

  Future<void> _openBoxAndCheckISFavorite() async {
    // ignore: unused_local_variable
    var box = await Hive.openBox("ListFavoriteItems");
    ListFavoriteItemsHive = Hive.box("ListFavoriteItems");
    setState(() {
      _isFavoriteItem = ListFavoriteItemsHive.get("favorite").any((element) {
        return widget.itemInfo["name"] == element["name"];
      });
    });
  }

  Future<void> _openBoxBasket() async {
    // ignore: unused_local_variable
    var box2 = await Hive.openBox("TheBasketShop");
    BasketItemsHive = Hive.box("TheBasketShop");
  }

  void onPressAddItemToBasket() {
    setState(() {
      basketItems.add({
        "item": widget.itemInfo,
        "number": numberofItem,
      });
    });
    BasketItemsHive.put("basket", basketItems);
  }

  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorBackgroung,
        elevation: 0.1,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              ;
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            )),
        actions: [
          Text(
            widget.itemInfo["name"],
            style: GoogleFonts.oswald(
              textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 150,
          )
        ],
      ),
      backgroundColor: colorBackgroung,
      body: Container(
        margin: const EdgeInsets.all(5),
        //  padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: _onPressAddFavoriteOrRemove,
                  icon: Icon(
                    _isFavoriteItem ? Icons.bookmark : Icons.bookmark_border,
                    size: 35,
                    color: _isFavoriteItem ? Colors.orange : Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              height: h / 3,
              width: w / 2,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Hero(
                  tag: widget.tag,
                  child: Image.asset(
                    widget.itemInfo["Picture"],
                    //fit: BoxFit.cover,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Price : ",
                  style: GoogleFonts.oswald(
                      color: Colors.orange, fontSize: w / 17),
                ),
                Text(
                  "\$${widget.itemInfo["Price"]}  ",
                  style: GoogleFonts.oswald(
                      color: Colors.orange, fontSize: w / 17),
                ),
              ],
            ),
            SizedBox(
              height: h / 7,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    " The Number of Item : ",
                    style: GoogleFonts.oswald(
                        color: Colors.orange, fontSize: w / 17),
                  ),
                  IconButton(
                      onPressed: () {
                        if (numberofItem > 1) {
                          setState(() {
                            numberofItem -= 1;
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      )),
                  Container(
                    height: h / 15,
                    width: w / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorBackgroung,
                    ),
                    child: Center(
                      child: Text(
                        numberofItem.toString(),
                        style: TextStyle(color: Colors.white, fontSize: h / 30),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          numberofItem += 1;
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                onPressAddItemToBasket();
                Future.delayed(const Duration(milliseconds: 200), () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Text("The item was added to the cart successfully")));
                });
              },
              child: Container(
                height: h / 13,
                width: w / 1.2,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black26,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          offset: const Offset(1, 1),
                          blurRadius: 2,
                          blurStyle: BlurStyle.normal)
                    ]),
                child: Center(
                  child: Text(
                    "Add to Basket",
                    style:
                        GoogleFonts.oswald(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
