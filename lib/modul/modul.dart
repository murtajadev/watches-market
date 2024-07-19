import 'dart:math';

List whatchesInformation = [
  {
    "Company": "Casio",
    "Prudects": [
      {
        "name": "Casio Ax12",
        "Price": 29.9,
        "Picture": "asset/images/casio1.png"
      },
      {
        "name": "Casio Dx64",
        "Price": 19.9,
        "Picture": "asset/images/casio2.png"
      },
      {
        "name": "Casio Dx48",
        "Price": 19.99,
        "Picture": "asset/images/casio3.png"
      },
      {
        "name": "Casio Ax29",
        "Price": 34.9,
        "Picture": "asset/images/casio4.png"
      },
      {
        "name": "Casio RT12",
        "Price": 54.9,
        "Picture": "asset/images/casio5.png"
      },
      {
        "name": "Casio Ax28",
        "Price": 54.9,
        "Picture": "asset/images/casio6.png"
      },
      {
        "name": "Casio Ax10",
        "Price": 44.9,
        "Picture": "asset/images/casio7.png"
      },
      {
        "name": "Casio Ax23",
        "Price": 29.9,
        "Picture": "asset/images/casio8.png"
      },
      {
        "name": "Casio Ax26",
        "Price": 24.9,
        "Picture": "asset/images/casio9.png"
      },
    ]
  },
  {
    "Company": "Rolex",
    "Prudects": [
      {
        "name": "Rolex cx26",
        "Price": 24.9,
        "Picture": "asset/images/rolex1.png"
      },
      {
        "name": "Rolex cx40",
        "Price": 29.9,
        "Picture": "asset/images/rolex2.png"
      },
      {
        "name": "Rolex FT50",
        "Price": 34.9,
        "Picture": "asset/images/rolex3.png"
      },
      {
        "name": "Rolex cx15",
        "Price": 14.9,
        "Picture": "asset/images/rolex4.png"
      },
      {
        "name": "Rolex FT26",
        "Price": 54.9,
        "Picture": "asset/images/rolex5.png"
      },
      {
        "name": "Rolex FT30",
        "Price": 44.9,
        "Picture": "asset/images/rolex6.png"
      },
      {
        "name": "Rolex AQ12",
        "Price": 19.9,
        "Picture": "asset/images/rolex7.png"
      },
      {
        "name": "Rolex cx13",
        "Price": 19.9,
        "Picture": "asset/images/rolex8.png"
      },
      {
        "name": "Rolex cx21",
        "Price": 24.9,
        "Picture": "asset/images/rolex9.png"
      },
    ]
  },
  {
    "Company": "Tisson",
    "Prudects": [
      {
        "name": "Tisson ML21",
        "Price": 54.4,
        "Picture": "asset/images/tisson1.png"
      },
      {
        "name": "Tisson JK12",
        "Price": 44.4,
        "Picture": "asset/images/tisson2.png"
      },
      {
        "name": "Tisson GU32",
        "Price": 22.9,
        "Picture": "asset/images/tisson3.png"
      },
      {
        "name": "Tisson ML21",
        "Price": 49.4,
        "Picture": "asset/images/tisson4.png"
      },
      {
        "name": "Tisson GU11",
        "Price": 19.4,
        "Picture": "asset/images/tisson5.png"
      },
      {
        "name": "Tisson GU35",
        "Price": 34.4,
        "Picture": "asset/images/tisson6.png"
      },
      {
        "name": "Tisson GU9",
        "Price": 19.4,
        "Picture": "asset/images/tisson7.png"
      },
    ]
  }
];

List infoItemsSuggest() {
  List info = [];
  for (var i = 0; i < 10; i++) {
    var random = Random();
    int indexOfCompany = random.nextInt(2) + 0;
    int indexOfItem = random.nextInt(8) + 0;
    info.add(whatchesInformation[indexOfCompany]["Prudects"][indexOfItem]);
  }
  return info;
}

List favoriteItems = [];
List basketItems = [];
