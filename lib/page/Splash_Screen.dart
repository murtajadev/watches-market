import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:forked_slider_button/forked_slider_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:rive/rive.dart';
import 'package:whatches_store/modul/modul.dart';
import 'package:whatches_store/page/HomePage/botton_navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const BottonNavigationBar(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInCirc;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  late Box MyListFavoriteItems;

  Future<void> _openBoxHive() async {
    MyListFavoriteItems = await Hive.openBox("ListFavoriteItems");
    MyListFavoriteItems.put("favorites", favoriteItems);
  }

  @override
  void initState() {
    super.initState();
    _openBoxHive();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _openBoxHive(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return Scaffold(
              body: Stack(
                children: [
                  const RiveAnimation.asset(
                    'assets/splash.riv',
                    fit: BoxFit.fill,
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 17,
                        sigmaY: 17,
                      ),
                      child: const SizedBox(),
                    ),
                  ),
                  Positioned(
                    top: 300,
                    left: 6,
                    child: Text(
                      "Whatches Store",
                      style: GoogleFonts.lobster(
                        textStyle: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.99)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 380,
                    left: 6,
                    child: Text(
                      "Our store offers you the latest\n types of watches from well-known \ninternational brands at the most reasonable \nprices",
                      maxLines: 40,
                      style: GoogleFonts.oswald(
                        textStyle: TextStyle(
                            fontSize: 20, color: Colors.white.withOpacity(0.8)),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    left: 80,
                    child: SliderButton(
                      action: () {
                        Navigator.of(context).push(_createRoute());
                      },
                      dismissible: false,
                      radius: 35,
                      highlightedColor: colorOrange,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      buttonColor: colorOrange.withOpacity(0.6),
                      label: Text(
                        "Lets Shoping",
                        style: GoogleFonts.sriracha(
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8)),
                        ),
                      ),
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
