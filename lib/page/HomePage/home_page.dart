import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatches_store/page/DrawingMenu/drawing_menu_page.dart';
import 'package:whatches_store/page/HomePage/catalogsWidget/catalog_companys.dart';
import 'package:whatches_store/page/HomePage/suggestItems/suggestsCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  final _drawerController = AdvancedDrawerController();
  @override
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: const Color(0x42525050),
      controller: _drawerController,
      drawer: const DrawingMenuPage(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0x42525050),
            leading: IconButton(
              onPressed: () {
                _drawerController.showDrawer();
              },
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _drawerController,

                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(microseconds: 300),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.dehaze,
                      color: Colors.white,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
                // there are build the option of drawing menu
              ),
            ),
            centerTitle: true,
            title: Text(
              "Whatches Store",
              style: GoogleFonts.lobster(
                textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.99)),
              ),
            ),
          ),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "EXPLORE \nTOP BRAND WHATCHES",
                        style: GoogleFonts.oswald(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CatalogCompanys(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Our suggestion for you",
                        style: GoogleFonts.oswald(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SuggestItems()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
