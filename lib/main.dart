import 'package:flutter/material.dart';

import 'pages/root_app.dart';
import 'theme/colors.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "USFP",
    color: Color.fromRGBO(0, 99, 174, 1),
    theme: ThemeData(
      primaryColor: primary,
      accentColor: secondary,
      backgroundColor: grey,
    ),
    home: RootApp(),
  ));
}
