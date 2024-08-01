import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatches_store/modul/modul.dart';
import 'package:whatches_store/page/PrudectsPage/prudectsCompany.dart';

class CatalogCard extends StatefulWidget {
  const CatalogCard(
      {super.key, required this.nameCompany, required this.whatchesInfo});
  final String nameCompany;
  final List whatchesInfo;
  @override
  State<CatalogCard> createState() => _CatalogCardState();
}

class _CatalogCardState extends State<CatalogCard> {
  bool changeColor = false;
  Color colorBackGroung = const Color(0x42525050);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          changeColor = !changeColor;
        });

        Future.delayed(const Duration(milliseconds: 200), () {
          setState(() {
            changeColor = !changeColor;
          });
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PrudectsCompany(
                  nameCompany: widget.nameCompany,
                  whatchesInfo: widget.whatchesInfo),
            ),
          );
        });
      },
      child: AnimatedContainer(
        height: 50,
        width: 100,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: changeColor
              ? colorBackGroung
              : colorOrange.withOpacity(0.6),
        ),
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            widget.nameCompany,
            style: GoogleFonts.oswald(
              textStyle: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
