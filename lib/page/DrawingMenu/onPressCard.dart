import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnPressCard extends StatefulWidget {
  const OnPressCard(
      {super.key,
      required this.nameCard,
      required this.iconCard,
      this.onPress});
  final String nameCard;
  final IconData iconCard;
  final onPress;

  @override
  State<OnPressCard> createState() => _OnPressCardState();
}

class _OnPressCardState extends State<OnPressCard> {
  final Color _colorCard = const Color(0xFF141414);
  @override
  Widget build(BuildContext context) {
    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: _colorCard,
          elevation: 1,
          builder: (context) {
            return Container(
                height: _h / 1.2,
                width: _w,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: widget.onPress);
          },
        );
      },
      child: Container(
        height: _h / 15,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: _colorCard, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              widget.iconCard,
              color: Colors.white,
            ),
            SizedBox(
              width: _w / 30,
            ),
            Text(
              widget.nameCard,
              style: GoogleFonts.oswald(color: Colors.white, fontSize: _w / 20),
            )
          ],
        ),
      ),
    );
  }
}
