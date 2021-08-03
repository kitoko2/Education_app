import 'package:education/home/home.dart';
import 'package:education/login/conn_inscr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class SwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final result = Provider.of<User?>(context);

    return result != null
        ? Home(
            user: result,
          )
        : SignInORUp();
  }
}
