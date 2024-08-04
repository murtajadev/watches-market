import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatches_store/page/DrawingMenu/onPressCard.dart';
import 'package:whatches_store/page/DrawingMenu/rating_page.dart';

class DrawingMenuPage extends StatefulWidget {
  const DrawingMenuPage({super.key});

  @override
  State<DrawingMenuPage> createState() => _DrawingMenuPageState();
}

class _DrawingMenuPageState extends State<DrawingMenuPage> {
  final Color _colorCard = const Color(0x13FFFFFF);
  @override
  Widget build(BuildContext context) {
    final _h = MediaQuery.of(context).size.height;
    //final _w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black26,
        ),
        // padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: _h * 0.2,
              width: _h * 0.2,
              margin: EdgeInsets.only(top: _h / 20),
              decoration: BoxDecoration(
                color: _colorCard,
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage("asset/images/logo_watch.png"),
                ),
              ),
            ),
            SizedBox(
              height: _h / 10,
            ),
            const OnPressCard(
                nameCard: "Rating the Application",
                iconCard: Icons.star,
                onPress: RatingPage()),
            OnPressCard(
              nameCard: "Connect with us",
              iconCard: Icons.support_agent_outlined,
              onPress: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "connect with us",
                    style: GoogleFonts.oswald(
                        fontSize: _h / 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: _h / 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Email : ",
                        style: GoogleFonts.lato(
                            fontSize: _h / 50, color: Colors.white),
                      ),
                      SelectableText(
                        "Murtajadhaidan@gmail.com",
                        style: GoogleFonts.lato(
                            fontSize: _h / 50, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _h / 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Phone Number :  ",
                        style: GoogleFonts.lato(
                            fontSize: _h / 50, color: Colors.white),
                      ),
                      SelectableText(
                        "07871421722",
                        style: GoogleFonts.lato(
                            fontSize: _h / 50, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _h / 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Boxicons.bxl_instagram,
                        color: Colors.white,
                      ),
                      Text(
                        " Inatagram :  ",
                        style: GoogleFonts.lato(
                            fontSize: _h / 50, color: Colors.white),
                      ),
                      SelectableText(
                        "z_1b",
                        style: GoogleFonts.lato(
                            fontSize: _h / 50, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
            OnPressCard(
              nameCard: "About the Application",
              iconCard: Icons.lightbulb_outline_rounded,
              onPress: Center(
                child: Text(
                  "Developed by Murtaja.Dev",
                  style:
                      GoogleFonts.lato(fontSize: _h / 50, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
