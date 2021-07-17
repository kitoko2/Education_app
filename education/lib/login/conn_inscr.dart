import 'dart:ui';
import 'package:education/animation/animation.dart';
import 'package:education/authentification/authentification.dart';
import 'package:education/switchWidget/switchWidget.dart';
import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class SignInORUp extends StatefulWidget {
  const SignInORUp({Key? key}) : super(key: key);

  @override
  _SignInORUpState createState() => _SignInORUpState();
}

class _SignInORUpState extends State<SignInORUp> {
  bool first = true; //c'est a dire inscription
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retapePasswordController = TextEditingController();
  String? email;
  String? password;
  String? retapePassword;
  String error = "";
  final mykey = GlobalKey<FormState>();
  bool loading = false;
  AuthentificationService auth = AuthentificationService();
  AuthentificationService lastauth = AuthentificationService();
  bool obscurePassword = true;
  bool obscureretapePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(),
      // resizeToAvoidBottomInset: false,
      body: loading
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blueGrey,
                    Colors.blueGrey.shade400,
                    Colors.blueGrey.shade200,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LogiTech",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SpinKitFadingCircle(
                      size: 30,
                      color: Color(0xFF6C63FF),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.only(top: 25),
              child: Stack(
                children: [
                  Container(),
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: PoyAnime(
                      child: Image.asset(
                        first ? "asset/signIn (2).png" : "asset/signIn (1).png",
                      ),
                      second: 2,
                      depart: "left",
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    right: 15,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff5E58C5),
                      ),
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                    ),
                  ),
                  PoyAnime(
                    second: 1,
                    depart: "left",
                    child: Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 10,
                        color: Colors.blueGrey,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 50,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  first ? "Inscription" : "Connexion",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Form(
                                  key: mykey,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                        ),
                                        child: TextFormField(
                                          controller: emailController,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.mail,
                                              size: 15,
                                            ),
                                            border: InputBorder.none,
                                            hintText: "email",
                                          ),
                                          validator: (entry) {
                                            if (entry!.isEmpty) {
                                              return "email vide!";
                                            }
                                          },
                                          onChanged: (entry) {
                                            setState(() {
                                              email = entry;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                        ),
                                        child: TextFormField(
                                          controller: passwordController,
                                          obscureText: obscurePassword,
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              splashRadius: 25,
                                              icon: Icon(
                                                obscurePassword
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                size: 15,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  obscurePassword =
                                                      !obscurePassword;
                                                });
                                              },
                                            ),
                                            border: InputBorder.none,
                                            hintText: "mot de passe",
                                          ),
                                          validator: (entry) {
                                            if (entry!.isEmpty) {
                                              return "mot de passe vide!";
                                            }
                                            if (entry.length < 6) {
                                              return "mot de passe trop court";
                                            }
                                          },
                                          onChanged: (entry) {
                                            setState(() {
                                              password = entry;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      if (first)
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
                                          ),
                                          child: TextFormField(
                                            obscureText: obscureretapePassword,
                                            controller:
                                                retapePasswordController,
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                splashRadius: 25,
                                                icon: Icon(
                                                  obscureretapePassword
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  size: 15,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    obscureretapePassword =
                                                        !obscureretapePassword;
                                                  });
                                                },
                                              ),
                                              border: InputBorder.none,
                                              hintText:
                                                  "retapez le mot de passe",
                                            ),
                                            onChanged: (entry) {
                                              setState(() {
                                                retapePassword = entry;
                                              });
                                            },
                                            validator: (entry) {
                                              if (retapePassword != password) {
                                                return "les mots de passes sont différents!";
                                              }
                                            },
                                          ),
                                        ),
                                      if (first) SizedBox(height: 10),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(vertical: 13),
                                          ),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        onPressed: () async {
                                          if (mykey.currentState!.validate()) {
                                            setState(() {
                                              loading = true;
                                            });

                                            final result = first
                                                ? await lastauth
                                                    .registerWithEmailAndPassword(
                                                        email!, password!)
                                                : await auth
                                                    .signInWithEmailAndPassword(
                                                        email!, password!);
                                            SwitchWidget();
                                            if (result == null) {
                                              setState(() {
                                                loading = false;
                                                error =
                                                    "une erreur est survenue";
                                              });
                                            }
                                          }
                                        },
                                        child: Text(first
                                            ? "Inscription"
                                            : "Connexion"),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            first
                                                ? "vous avez déja un compte?"
                                                : "vous n'avez pas de compte?",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                emailController.clear();
                                                passwordController.clear();
                                                retapePasswordController
                                                    .clear();
                                                email = "";
                                                password = "";
                                                retapePassword = "";
                                                first = !first;
                                                error = "";
                                              });
                                            },
                                            child: Text(
                                              first
                                                  ? "connectez-vous"
                                                  : "inscrivez-vous",
                                              style: TextStyle(
                                                color: Colors.white,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Divider(
                                        thickness: 1,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      SizedBox(height: 5),
                                      OutlinedButton.icon(
                                        style: ButtonStyle(
                                          side: MaterialStateProperty.all(
                                            BorderSide(
                                              color: Colors.white,
                                              width: 1.6,
                                            ),
                                          ),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(vertical: 8),
                                          ),
                                        ),
                                        icon: Container(
                                          width: 30,
                                          height: 30,
                                          child:
                                              Image.asset("asset/google.png"),
                                        ),
                                        label: Text(
                                          "S'identifier avec google",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            loading = true;
                                          });
                                          //google connexion
                                          final result =
                                              await auth.signInWithGoole();

                                          if (result == null) {
                                            setState(() {
                                              error = "une erreur est survenue";
                                              loading = false;
                                            });
                                          }
                                        },
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "$error",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
