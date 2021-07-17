import 'package:education/animation/animation.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

class MenuCours extends StatefulWidget {
  final String? nomMatiere;
  final String? description;
  final Color? couleur;
  MenuCours({this.nomMatiere, this.couleur, this.description});

  @override
  _MenuCoursState createState() => _MenuCoursState();
}

class _MenuCoursState extends State<MenuCours> {
  String selection = "debutant";
  var maList;
  ScrollController? controller;
  bool floatB = true;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller!.addListener(() {
      final direction = controller!.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        setState(() {
          floatB = true;
        });
      }
      if (direction == ScrollDirection.reverse) {
        setState(() {
          floatB = false;
        });
      }
      if (controller!.position.pixels == controller!.position.maxScrollExtent) {
        setState(() {
          floatB = false;
        });
      }
    });
    switch (widget.nomMatiere) {
      case "Mathematique":
        List<Cours> debutant = [
          Cours(
            "Math de base",
            "les mathematiques de base(resoudre des problemes)",
          ),
          Cours(
            "Math de base",
            "les mathematiques de base(resoudre des problemes)",
          ),
          Cours(
            "Math de base",
            "les mathematiques de base(resoudre des problemes)",
          ),
        ];
        List<Cours> intermediaire = [
          Cours(
            "Math intermediaire",
            "les mathematiques intermediaire(niveau 3ime et plus)",
          ),
          Cours(
            "Math intermediaire",
            "les mathematiques intermediaire(niveau 3ime et plus)",
          ),
          Cours(
            "Math intermediaire",
            "les mathematiques intermediaire(niveau 3ime et plus)",
          ),
        ];
        List<Cours> avancer = [
          Cours(
            "Math avancer",
            "les fonctions et autres(niveau Tle et plus)",
          ),
          Cours(
            "Math intermediaire",
            "les mathematiques intermediaire(Tle et plus)",
          ),
          Cours(
            "Math intermediaire",
            "les mathematiques intermediaire(Tle et plus)",
          ),
        ];
        setState(() {
          maList = [debutant, intermediaire, avancer];
        });

        break;
      case "Anglais":
        List<Cours> debutant = [
          Cours(
            "Anglais de base",
            "Anglais de base(verbe)",
          ),
          Cours(
            "Anglais de base",
            "Anglais de base(debut preterits)",
          ),
          Cours(
            "Anglais de base",
            "Anglais de base",
          ),
        ];
        List<Cours> intermediaire = [
          Cours(
            "Anglais intermediaire",
            "Anglais intermediaire(niveau 3ime et plus)",
          ),
          Cours(
            "Anglais",
            "Anglais intermediaire(niveau 3ime et plus)",
          ),
          Cours(
            "Anglais intermediaire",
            "Anglais intermediaire(niveau 3ime et plus)",
          ),
        ];
        List<Cours> avancer = [
          Cours(
            "Anglais avancer",
            "les preterits(niveau Tle et plus)",
          ),
          Cours(
            "Anglais avancer",
            "Anglais avancer(niveau Tle et plus)",
          ),
          Cours(
            "Anglais avancer",
            "Anglais avancer(niveau Tle et plus)",
          ),
        ];
        setState(() {
          maList = [debutant, intermediaire, avancer];
        });

        break;
      case "Français":
        List<Cours> debutant = [
          Cours(
            "Français de base",
            "Français de base(verbe)",
          ),
          Cours(
            "Français de base",
            "Français de base(les temps)",
          ),
          Cours(
            "Français de base",
            "Français de base",
          ),
        ];
        List<Cours> intermediaire = [
          Cours(
            "Français intermediaire",
            "Français intermediaire(niveau 3ime et plus)",
          ),
          Cours(
            "Français",
            "Français intermediaire(niveau 3ime et plus)",
          ),
          Cours(
            "Français intermediaire",
            "Français intermediaire(niveau 3ime et plus)",
          ),
        ];
        List<Cours> avancer = [
          Cours(
            "Français avancer",
            "les resumés(niveau Tle et plus)",
          ),
          Cours(
            "Français avancer",
            "Français avancer(niveau Tle et plus)",
          ),
          Cours(
            "Français avancer",
            "Français avancer(niveau Tle et plus)",
          ),
        ];
        setState(() {
          maList = [debutant, intermediaire, avancer];
        });
        break;
      case "Physique":
        List<Cours> debutant = [
          Cours(
            "physique de base",
            "physique de base(la masse)",
          ),
          Cours(
            "physique de base",
            "physique de base(debut les corps)",
          ),
          Cours(
            "physique de base",
            "physique de base",
          ),
        ];
        List<Cours> intermediaire = [
          Cours(
            "physique intermediaire",
            "physique intermediaire(niveau 3ime et plus)",
          ),
          Cours(
            "physique",
            "physique intermediaire(niveau 3ime et plus)",
          ),
          Cours(
            "physique intermediaire",
            "physique intermediaire(niveau 3ime et plus)",
          ),
          Cours(
            "physique intermediaire",
            "physique intermediaire(niveau 3ime et plus)",
          ),
        ];
        List<Cours> avancer = [
          Cours(
            "physique avancer",
            "les forces(niveau Tle et plus)",
          ),
          Cours(
            "physique avancer",
            "physique avancer(niveau Tle et plus)",
          ),
          Cours(
            "physique avancer",
            "physique avancer(niveau Tle et plus)",
          ),
        ];
        setState(() {
          maList = [debutant, intermediaire, avancer];
        });
        break;
      default:
        print("");
    }
  }

  List<Cours> result = [];

  @override
  Widget build(BuildContext context) {
    switch (selection) {
      case "debutant":
        result = maList[0];
        break;
      case "intermediaire":
        result = maList[1];
        break;
      default:
        result = maList[2];
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: new AppBar(
      //   toolbarHeight: 0,
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   elevation: 0,
      // ),
      floatingActionButton: floatB
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            )
          : null, //pas utile ici (juste un test)
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height / 3,
                  decoration: BoxDecoration(
                    color: widget.couleur,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(25),
                    ),
                  ),
                ),
                Positioned(
                  top: 35,
                  left: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 35,
                    height: 35,
                    child: Center(
                      child: IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: 16,
                          color: widget.couleur,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 15,
                  child: Center(
                    child: Column(
                      children: [
                        PoyAnime(
                          second: 1,
                          depart: "bas",
                          child: Text(
                            "${widget.description}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        PoyAnime(
                          second: 1,
                          depart: "bas",
                          child: Text(
                            "Maîtrisez ce dommanine",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        PoyAnime(
                          second: 1,
                          depart: "bas",
                          child: Text(
                            "avec notre solution",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                "${widget.nomMatiere}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2),
              color: widget.couleur!.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  myButton("debutant"),
                  myButton("intermediaire"),
                  myButton("difficle"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                controller: controller,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                itemCount: result.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      //voir cour
                    },
                    child: Card(
                      elevation: 5,
                      color: Color(0xff6b7b8c),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 9, horizontal: 10),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: double.infinity,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${result[i].titreLecon}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              "${result[i].descriptionLecon}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: "police1",
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myButton(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selection = text;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInExpo,
        decoration: BoxDecoration(
          color: selection == text ? Colors.black38 : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 100,
        height: 40,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: selection == text ? Colors.white : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}

class Cours {
  String? titreLecon;
  String? cours; // a implementer quand on aura les cours dispos;
  String? descriptionLecon;
  Cours(String titreLecon, String descriptionLecon) {
    this.titreLecon = titreLecon;
    this.descriptionLecon = descriptionLecon;
  }
}
