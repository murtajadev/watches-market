import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatches_store/page/PrudectsPage/itemCardDesign.dart';

class ItemsCard extends StatefulWidget {
  const ItemsCard({super.key, required this.whatchesInfo});
  final List whatchesInfo;

  @override
  State<ItemsCard> createState() => _ItemsCardState();
}

class _ItemsCardState extends State<ItemsCard> {
  String tag = "TagOfPicture";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimationLimiter(
        child: GridView.builder(
          itemCount: widget.whatchesInfo.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 500),
              columnCount: 2,
              child: SlideAnimation(
                curve: Curves.easeInOutSine,
                verticalOffset: 130.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ItemCardDesign(
                            itemInfo: widget.whatchesInfo[index],
                            tag: tag + index.toString()),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(15)),
                    child: FadeInAnimation(
                      // curve: Curves.linear,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 95,
                            width: 95,
                            margin: const EdgeInsets.all(10),
                            child: Hero(
                              tag: tag + index.toString(),
                              child: Image.asset(
                                  widget.whatchesInfo[index]["Picture"]),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.whatchesInfo[index]["name"]}",
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 22)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "\$${widget.whatchesInfo[index]["Price"]}",
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        color: Colors.orangeAccent,
                                        fontSize: 21)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
