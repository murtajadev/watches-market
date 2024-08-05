import 'package:flutter/material.dart';
import 'package:whatches_store/modul/modul.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key,
      required this.name,
      required this.controller,
      this.validatorLabel = "",
      this.checkvalidator = false, required this.icon});
  final String name;
  final TextEditingController controller;
  final IconData icon;
  bool checkvalidator;
  String validatorLabel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (checkvalidator) {
          if (value!.isEmpty) {
            return validatorLabel;
          }
        }
        return null;
      },
      decoration: InputDecoration(
        enabled: true,
        hintText: name,
        suffixIcon:  Icon(icon),
        suffixIconColor: Colors.amber,
        hintStyle: const TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorOrange),
            borderRadius: BorderRadius.circular(18)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
