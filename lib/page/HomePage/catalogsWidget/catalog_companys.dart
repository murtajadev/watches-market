import 'package:flutter/material.dart';
import 'package:whatches_store/page/HomePage/catalogsWidget/catalog_card.dart';
import 'package:whatches_store/modul/modul.dart';

class CatalogCompanys extends StatefulWidget {
  const CatalogCompanys({super.key});

  @override
  State<CatalogCompanys> createState() => _CatalogCompanysState();
}

class _CatalogCompanysState extends State<CatalogCompanys> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 400,
      child: ListView.builder(
        itemCount: whatchesInformation.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CatalogCard(
          nameCompany: whatchesInformation[index]["Company"],
          whatchesInfo: whatchesInformation[index]["Prudects"],
        ),
      ),
    );
  }
}

