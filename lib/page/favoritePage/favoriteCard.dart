import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatches_store/modul/modul.dart';
import 'package:whatches_store/page/PrudectsPage/itemCardDesign.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard(
      {super.key, required this.itemInfo, required this.tagPicture});
  final Map itemInfo;
  final int tagPicture;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  //String tag = "tagPicture";
  @override
  Widget build(BuildContext context) {
    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ItemCardDesign(
              itemInfo: widget.itemInfo, tag: widget.tagPicture.toString()),
        ));
      },
      child: Container(
        height: _h / 7,
        width: _w / 1.5,
        // margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 110, 109, 109),
                  blurRadius: 0.2,
                  blurStyle: BlurStyle.normal,
                  offset: Offset(0.1, 0.1))
            ],
            color: const Color.fromARGB(255, 39, 38, 38),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.itemInfo["name"],
                  style: GoogleFonts.oswald(
                      color: Colors.white, fontSize: _w / 18),
                ),
                Text(
                  "\$ ${widget.itemInfo["Price"]}",
                  style: GoogleFonts.oswald(
                      color: colorOrange, fontSize: _w / 18),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: _w / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 0.2,
                      blurStyle: BlurStyle.outer,
                      offset: Offset(1, 1))
                ],
              ),
              child: Center(
                child: Hero(
                    tag: widget.tagPicture.toString(),
                    //transitionOnUserGestures: true,
                    child: Image.asset(
                      widget.itemInfo["Picture"],
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
