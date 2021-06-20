import 'dart:ui' show Color;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Image appLogo = new Image(
    image: new AssetImage("assets/title.jpg"),
    fit: BoxFit.contain,
    );

// Background
Color background = Color(0xff444444);
Color cardBack = Color(0xff606060);
Color cardDropDown = Color(0xff7a7a7a);
Color drawerBackground = Color(0xffaaaaaa);
Color dayBackSelected = Color(0xff606060);
Color dayBackNotSelected = Color(0xffaaaaaa);
Color featureColor = Color(0xfff4eb49);

// Text
Color drawerText = Color(0xff232323);
Color cardDropText = Color(0xffd6d6d6);
Color cardText = Color(0xffc0c0c0);
Color dayTextNotSelected = Color(0xff444444);
Color dayTextSelected = Color(0xfff4eb49);
Color cardFeatureText = Color(0xfff4eb49);

// Icons
Color cardIcon = Color(0xffc0c0c0);
Color cardAddIcon = Color(0xfff4eb49);


Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
}

const MaterialColor MyYellow = MaterialColor(
    _yellowPrimaryValue,
    <int, Color>{
        50: Color(0xFFFFFDE7),
        100: Color(0xFFFFF9C4),
        200: Color(0xFFFFF59D),
        300: Color(0xFFFFF176),
        400: Color(0xFFFFEE58),
        500: Color(_yellowPrimaryValue),
        600: Color(0xFFFDD835),
        700: Color(0xFFFBC02D),
        800: Color(0xFFF9A825),
        900: Color(0xFFF57F17),
    },
);
const int _yellowPrimaryValue = 0xFFf4eb49;