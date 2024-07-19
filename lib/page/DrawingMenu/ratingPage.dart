import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double? valueRating;
  TextEditingController commentUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _h = MediaQuery.of(context).size.height;
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                valueRating = rating;
              });
            },
          ),
          SizedBox(
            height: _h / 40,
          ),
          SizedBox(
            height: _h / 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("If you have any comment , please write it ...",
                  style: GoogleFonts.lato(color: Colors.white)),
            ],
          ),
          SizedBox(
            height: _h / 40,
          ),
          TextFormField(
            controller: commentUser,
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Write your Comment",
                hintStyle: TextStyle(color: Colors.white, fontSize: _h / 55)),
          ),
          SizedBox(
            height: _h / 10,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40)),
              child: Center(
                child: Text(
                  "Send the Rating",
                  style:
                      GoogleFonts.lato(color: Colors.white, fontSize: _h / 40),
                ),
              ))
        ],
      ),
    );
  }
}
