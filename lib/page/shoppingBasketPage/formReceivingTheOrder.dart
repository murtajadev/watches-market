import 'dart:async';

import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:whatches_store/modul/modul.dart';
import 'package:whatches_store/page/HomePage/botton_navigation_bar.dart';
import 'package:whatches_store/page/shoppingBasketPage/complete_order/text_field.dart';

class FormReceivingTheOrder extends StatefulWidget {
  const FormReceivingTheOrder({super.key});

  @override
  State<FormReceivingTheOrder> createState() => _FormReceivingTheOrderState();
}

class _FormReceivingTheOrderState extends State<FormReceivingTheOrder> {
  GlobalKey<FormState> keyFrom = GlobalKey();
  TextEditingController nameContorol = TextEditingController();
  TextEditingController emailContorol = TextEditingController();
  TextEditingController numberPhoneContorol = TextEditingController();
  TextEditingController locationControl = TextEditingController();
  TextEditingController anyNoteController = TextEditingController();
  bool orderIsDone = false;
  bool done = false;
  @override
  void dispose() {
    nameContorol.dispose();
    emailContorol.dispose();
    numberPhoneContorol.dispose();
    locationControl.dispose();
    anyNoteController.dispose();
    super.dispose();
  }

  void GoToHomePage() {
    if (orderIsDone) {
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          done = true;
        });
      });
      Future.delayed(
        const Duration(seconds: 4),
        () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const BottonNavigationBar(),
        )),
      );
      basketItems = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Form(
      key: keyFrom,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFieldWidget(
                name: "Your Name",
                controller: nameContorol,
                checkvalidator: true,
                validatorLabel: "Please Enter Your Name",
                icon: Icons.person,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFieldWidget(
                name: "Email",
                controller: emailContorol,
                icon: Icons.email,
               
              ),
              const SizedBox(
                height: 30,
              ),
             TextFieldWidget(
                name: "Phone Number",
                controller: numberPhoneContorol,
                checkvalidator: true,
                validatorLabel: "Please Enter Your Phone Number",
                icon: Boxicons.bx_phone,
              ),
              const SizedBox(
                height: 30,
              ),
               TextFieldWidget(
                name: "Location",
                controller: locationControl,
                checkvalidator: true,
                validatorLabel: "Please Enter Your Location",
                icon: Icons.location_on_outlined,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFieldWidget(
                name: "Any Note ?",
                controller: anyNoteController,
                
                icon: Boxicons.bx_notepad,
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  if (keyFrom.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor:
                              const Color.fromARGB(255, 52, 52, 52),
                          title: Text(
                            "Are you sure about your order information?",
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      orderIsDone = true;
                                    });
                                    GoToHomePage();
                                  },
                                  child: Text(
                                    "Done",
                                    style: GoogleFonts.cairo(
                                      textStyle: TextStyle(
                                        color: Colors.amber,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                70,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Back",
                                    style: GoogleFonts.cairo(
                                      textStyle: TextStyle(
                                          color: Colors.amber,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  height: h / 13,
                  width: w / 1.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber),
                  child: Center(
                    child: done
                        ? Lottie.asset("asset/done.json", fit: BoxFit.cover)
                        : orderIsDone
                            ? Lottie.asset("asset/orderIsDone.json")
                            : Text(
                                "Order",
                                style: GoogleFonts.oswald(
                                    color: Colors.white, fontSize: w / 14),
                              ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
