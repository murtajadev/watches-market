import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:whatches_store/page/HomePage/suggestItems/card_ItemSuggestsDesign.dart';
import 'package:whatches_store/modul/modul.dart';

class SuggestItems extends StatefulWidget {
  const SuggestItems({
    super.key,
  });

  @override
  State<SuggestItems> createState() => _SuggestsItemsState();
}

class _SuggestsItemsState extends State<SuggestItems> {
  List itemSuggest = [];
  @override
  void initState() {
    itemSuggest = infoItemsSuggest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      width: 500,
      child: AnimationLimiter(
        child: ListView.builder(
          itemCount: itemSuggest.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                    child: CardItemSuggestsDesign(
                  whatchesInfo: itemSuggest[index],
                  index: index,
                  
                )),
              ),
            );
          },
        ),
      ),
    );
  }
}
