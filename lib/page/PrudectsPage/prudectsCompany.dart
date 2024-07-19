import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatches_store/page/PrudectsPage/ItemsCard.dart';

class PrudectsCompany extends StatefulWidget {
  const PrudectsCompany(
      {super.key, required this.nameCompany, required this.whatchesInfo});
  final String nameCompany;
  final List whatchesInfo;

  @override
  State<PrudectsCompany> createState() => _PrudectsCompanyState();
}

class _PrudectsCompanyState extends State<PrudectsCompany> {
  Color colorBackgroung = const Color(0x42525050);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackgroung,
      appBar: AppBar(
        backgroundColor: colorBackgroung,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            )),
        actions: [
          Text(
            widget.nameCompany,
            style: GoogleFonts.oswald(
              textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 175,
          )
        ],
      ),
      body: ItemsCard(
        whatchesInfo: widget.whatchesInfo,
      ),
    );
  }
}
