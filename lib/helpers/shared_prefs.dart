import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs extends ChangeNotifier {
  Prefs._();
  static final Prefs prefs = Prefs._();

  String devName;
  bool firstOpen;
  ftOpen() async {
    devName = "notRegistered @${DateTime.now().toString()}";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    firstOpen = prefs.getBool('fOpen') ?? true;
    prefs.setBool('fOpen', false);
    prefs.setInt('abv18', 1);
  }
}
