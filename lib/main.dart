import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/root_app.dart';
import 'theme/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "USFP",
            color: Color.fromRGBO(0, 99, 174, 1),
            theme: ThemeData(
              primaryColor: primary,
              accentColor: secondary,
              backgroundColor: grey,
            ),
            home: RootApp(),
          )));
}
