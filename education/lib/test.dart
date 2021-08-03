import 'package:education/authentification/authentification.dart';
import 'package:education/switchWidget/switchWidget.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "package:firebase_auth/firebase_auth.dart";

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamProvider<User?>.value(
        initialData: null,
        value: AuthentificationService().user,
        child: SwitchWidget(),
      ),
    );
  }
}
