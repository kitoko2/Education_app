import 'package:education/getting_start.dart';
import 'package:education/test.dart';
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class FirstOrNot extends StatefulWidget {
  const FirstOrNot({Key? key}) : super(key: key);

  @override
  _FirstOrNotState createState() => _FirstOrNotState();
}

class _FirstOrNotState extends State<FirstOrNot> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool>? isFirst;
  bool premier = true;
  @override
  void initState() {
    super.initState();
    isFirst = _prefs.then((SharedPreferences prefs) {
      setState(() {
        premier = prefs.getBool("isFirst") ?? true;
      });
      return prefs.getBool("isFirst") ?? true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return premier ? GettingStart() : Test();
  }
}
