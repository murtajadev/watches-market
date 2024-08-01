import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:whatches_store/page/favoritePage/favoriteCard.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List listFavoriteItems = [];
  bool _itemsFavoriteIsNotfound = true;

  @override
  void initState() {
    _openBoxAndLoadData();

    super.initState();
  }

  Future<void> _openBoxAndLoadData() async {
    // ignore: unused_local_variable
    Box box = await Hive.openBox("ListFavoriteItems");
    final listFavoriteItemsHive = Hive.box("ListFavoriteItems");

    setState(() {
      listFavoriteItems = listFavoriteItemsHive.get("favorite");

      if (listFavoriteItems.isNotEmpty) {
        _itemsFavoriteIsNotfound = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
            "The Favorites",
            style: GoogleFonts.lobster(
              textStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.99),
              ),
            ),
          ),
          SizedBox(
            width: w / 3,
          )
        ],
      ),
      backgroundColor: const Color(0x42525050),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: _itemsFavoriteIsNotfound
            ? Center(
                child: Text(
                  "You don't have any items to display",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 30),
                ),
              )
            : SizedBox(
                child: AnimationLimiter(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: h / 70,
                    ),
                    itemCount: listFavoriteItems.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 800),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                              child: FavoriteCard(
                            itemInfo: listFavoriteItems[index],
                            tagPicture: index,
                          )),
                        ),
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
