import 'dart:ui';

import 'package:education/animation/animation.dart';
import 'package:education/home/home.dart';
import "package:flutter/material.dart";
import "package:carousel_slider/carousel_slider.dart";
import "package:shared_preferences/shared_preferences.dart";

class Description extends StatefulWidget {
  const Description({Key? key}) : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var selected = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/route1");
        },
        child: Icon(Icons.arrow_forward),
      ),
      body: Stack(
        children: [
          CarouselSlider(
            items: [
              Container(
                padding: EdgeInsets.only(top: 40, right: 15, left: 15),
                width: double.infinity,
                color: Color(0xFFD8D02E).withOpacity(0.3),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    PoyAnime(
                      second: 3,
                      depart: "top",
                      child: Text(
                        "Votre application pour vous accompagner dans l'apprentissage",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PoyAnime(
                      depart: "bas",
                      second: 1,
                      child: Container(
                        width: 260,
                        height: 260,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("asset/descriotion (1).png"),
                          ),
                        ),
                      ),
                    ),
                    PoyAnime(
                      second: 2,
                      depart: "bas",
                      child: Text(
                        "Avec une simplicité pour toute les tranches d'âge",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PoyAnime(
                      second: 4,
                      depart: "bas",
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("asset/descriotion (2).png"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xFFB1DE6C).withOpacity(0.5),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: (MediaQuery.of(context).size.height / 2) - 20,
                    ),
                    Text(
                      'Appuiyer sur "➔" pour continuer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                width: double.infinity,
              )
            ],
            options: CarouselOptions(
                viewportFraction: 1,
                height: MediaQuery.of(context).size.height,
                onPageChanged: (index, a) {
                  setState(() {
                    selected = index;
                  });
                }),
          ),
          Positioned(
            bottom: 10,
            left: (MediaQuery.of(context).size.width / 2) - 10,
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: selected == 0 ? Color(0xFF6C63FF) : Colors.black26,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: selected == 1 ? Color(0xFF6C63FF) : Colors.black26,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
