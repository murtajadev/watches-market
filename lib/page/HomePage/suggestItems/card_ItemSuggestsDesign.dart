import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatches_store/page/PrudectsPage/item_card_design.dart';
import 'package:whatches_store/modul/modul.dart';

// ignore: must_be_immutable
class CardItemSuggestsDesign extends StatefulWidget {
  CardItemSuggestsDesign(
      {super.key, required this.whatchesInfo, required this.index});
  final Map whatchesInfo;
  final int index;

  @override
  State<CardItemSuggestsDesign> createState() => _CardItemSuggestsDesignState();
}

class _CardItemSuggestsDesignState extends State<CardItemSuggestsDesign> {
  String tag = "Tag of Picture";
  void addFavotateItems(Map value) {
    setState(() {
      favoriteItems.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ItemCardDesign(
            itemInfo: widget.whatchesInfo,
            tag: tag + widget.index.toString(),
            
          ),
        ));
      },
      child: Container(
        height: 300,
        width: 250,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 210,
                  width: 210,
                  margin: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 0),
                  child: Hero(
                    tag: tag + widget.index.toString(),
                    transitionOnUserGestures: true,
                    child: Image.asset(
                      "${widget.whatchesInfo["Picture"]}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
               
              ],
            ),
            Text(
              "${widget.whatchesInfo["name"]}",
              style: GoogleFonts.oswald(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "\$ ${widget.whatchesInfo["Price"]}",
              style: GoogleFonts.oswald(
                textStyle: const TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
