import 'dart:ui';
import 'package:education/animation/animation.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ), // juste la pour appliquer une brighness.dark pour les icones haut du telephone
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _prefs.then((SharedPreferences prefs) {
              prefs.setBool("isFirst", false);
            });
          });

          Navigator.pushReplacementNamed(context, "/test");
          //inscription ou home(test est donc le stremProvider)
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
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    PoyAnime(
                      second: 3,
                      depart: "top",
                      child: Container(
                        width: double.infinity,
                        height: size.height / 2.8,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("asset/group2.png"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    PoyAnime(
                      depart: "left",
                      second: 1,
                      child: Text(
                        "Votre application pour vous accompagner dans l'apprentissage",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    PoyAnime(
                      second: 2,
                      depart: "bas",
                      child: Text(
                        "Avec une simplicité pour tous les niveaux",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    PoyAnime(
                      second: 1,
                      depart: "left",
                      child: Container(
                        width: double.infinity,
                        height: size.height / 2,
                        child: Image.asset("asset/description (5).png"),
                      ),
                    ),
                    Text(
                      "Toutes vos matières sont expliqués",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      'Appuiyer sur "➔" pour continuer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
            bottom: 20,
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
