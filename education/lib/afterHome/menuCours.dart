import 'package:education/afterHome/cours.dart';
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

  @override
  void initState() {
    super.initState();

    switch (widget.nomMatiere) {
      case "Mathematique":
        List<Cours> debutant = [
          Cours(
            "Math de base",
            "THALES",
            cours: "Mathematique/COURS DEBUTANTS/#3-theoreme-de-thales.pdf",
          ),
          Cours(
            "Math de base",
            "Volumes et sections de solides",
            cours:
                "Mathematique/COURS DEBUTANTS/#10-volumes-et-sections-de-solides.pdf",
          ),
          Cours(
            "Math de base",
            "Statistique",
            cours:
                "Mathematique/COURS DEBUTANTS/#11-statistiques-avec-mediane-et-moyenne.pdf",
          ),
        ];
        List<Cours> intermediaire = [
          Cours(
            "Math intermediaire",
            "Dérivée d'une fonction",
            cours:
                "Mathematique/COURS INTERMEDIAIRE/#1-derivee-d-une-fonction.pdf",
          ),
          Cours(
            "Math intermediaire",
            "les equations du second dégrée",
            cours:
                "Mathematique/COURS INTERMEDIAIRE/#2-les-equations-du-second-degre-et-discriminant.pdf",
          ),
          Cours(
            "Math intermediaire",
            "Probabilites conditionnelles et independance",
            cours:
                "Mathematique/COURS INTERMEDIAIRE/#6-probabilites-conditionnelles-et-independance.pdf",
          ),
          Cours(
            "Math intermediaire",
            "fonctions-trigonometriques",
            cours:
                "Mathematique/COURS INTERMEDIAIRE/#8-fonctions-trigonometriques.pdf",
          ),
        ];
        List<Cours> avancer = [
          Cours(
            "Math avancer",
            "exponentielles",
            cours: "Mathematique/COURS AVANCE/#6-exponentielles.pdf",
          ),
          Cours(
            "Math avancer",
            "logarithme neperien",
            cours: "Mathematique/COURS AVANCE/#7-logarithme-neperien.pdf",
          ),
          Cours(
            "Math avancer",
            "Integrale",
            cours: "Mathematique/COURS AVANCE/#8-integrales-.pdf",
          ),
          Cours(
            "Math avancer",
            "produit-scalaire",
            cours:
                "Mathematique/COURS AVANCE/#9-produit-scalaire-dans-l-espace.pdf",
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
            "Exprimer	en	anglais	ses	idées et	ses	sentiments	(facile partie 1)",
            cours: "ANGLAIS/DEBUTANT/Lecon 1.pdf",
          ),
          Cours(
            "Anglais de base",
            "Exprimer	en	anglais	ses	idées et	ses	sentiments	(facile partie 2)",
            cours: "ANGLAIS/DEBUTANT/Lecon 2.pdf",
          ),
          Cours(
            "Anglais de base",
            "Exprimer	en	anglais	ses	idées et	ses	sentiments	(facile partie 3)",
            cours: "ANGLAIS/DEBUTANT/Lecon 3.pdf",
          ),
        ];
        List<Cours> intermediaire = [
          Cours(
            "Anglais intermediaire",
            "Exprimer en Anglais ses idées et ses sentiments (intermediaire partie 1)",
            cours: "ANGLAIS/INTERMEDIAIRE/Lecon 1.pdf",
          ),
          Cours(
            "Anglais",
            "Exprimer en Anglais ses idées et ses sentiments (intermediaire partie 2)",
            cours: "ANGLAIS/INTERMEDIAIRE/Lecon 2.pdf",
          ),
          Cours(
            "Anglais intermediaire",
            "Exprimer en Anglais ses idées et ses sentiments (intermediaire partie 3)",
            cours: "ANGLAIS/INTERMEDIAIRE/Lecon 3.pdf",
          ),
          Cours(
            "Anglais intermediaire",
            "Exprimer en Anglais ses idées et ses sentiments (intermediaire partie 4)",
            cours: "ANGLAIS/INTERMEDIAIRE/Lecon 4.pdf",
          ),
        ];
        List<Cours> avancer = [
          Cours(
            "Anglais avancer",
            "Adjectifs-possessifs-anglais",
            cours: "ANGLAIS/AVANCE/Adjectifs-possessifs-anglais.pdf",
          ),
          Cours(
            "Anglais avancer",
            "Le conditionnel-anglais",
            cours: "ANGLAIS/AVANCE/conditionnel-anglais-pdf.pdf",
          ),
          Cours(
            "Anglais avancer",
            "Modaux Anglais",
            cours: "ANGLAIS/AVANCE/modaux-anglais-pdf.pdf",
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
            cours: "",
          ),
          Cours(
            "Français de base",
            "Français de base(les temps)",
            cours: "",
          ),
          Cours(
            "Français de base",
            "Français de base",
            cours: "",
          ),
        ];
        List<Cours> intermediaire = [
          Cours(
            "Français intermediaire",
            "Français intermediaire(niveau 3ime et plus)",
            cours: "",
          ),
          Cours(
            "Français",
            "Français intermediaire(niveau 3ime et plus)",
            cours: "",
          ),
          Cours(
            "Français intermediaire",
            "Français intermediaire(niveau 3ime et plus)",
            cours: "",
          ),
        ];
        List<Cours> avancer = [
          Cours(
            "Français avancer",
            "les resumés(niveau Tle et plus)",
            cours: "",
          ),
          Cours(
            "Français avancer",
            "Français avancer(niveau Tle et plus)",
            cours: "",
          ),
          Cours(
            "Français avancer",
            "Français avancer(niveau Tle et plus)",
            cours: "",
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
            "J'utilise des modèles",
            cours:
                "APK dossier physique/debutant/j'utilise des modele-pivoté.pdf",
          ),
          Cours(
            "physique de base",
            "Les Mesures",
            cours:
                "APK dossier physique/debutant/je mesure les grandeures physiques-pivoté.pdf",
          ),
          Cours(
            "physique de base",
            "La physique au service de l'environnement",
            cours:
                "APK dossier physique/debutant/je preserve environnement-pivoté.pdf",
          ),
        ];
        List<Cours> intermediaire = [
          Cours(
            "physique intermediaire",
            "Electricité",
            cours: "APK dossier physique/intermediare/Electricité.pdf",
          ),
          Cours(
            "physique",
            "Force et Electrisation",
            cours:
                "APK dossier physique/intermediare/force et electrisation.pdf",
          ),
          Cours(
            "physique intermediaire",
            "Les lentilles",
            cours: "APK dossier physique/intermediare/Les lentilles.pdf",
          ),
        ];
        List<Cours> avancer = [
          Cours(
            "physique avancer",
            "Cinématique du point",
            cours: "APK dossier physique/avance/theme1.pdf",
          ),
          Cours(
            "physique avancer",
            "Oscillation Mecanique Libre",
            cours: "APK dossier physique/avance/theme2.pdf",
          ),
          Cours(
            "physique avancer",
            "Auto Induction , Electromagnétique",
            cours: "APK dossier physique/avance/theme3.pdf",
          ),
          Cours(
            "physique avancer",
            "Interférence lumineuse",
            cours: "APK dossier physique/avance/theme4.pdf",
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

      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
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
                  child: Container(
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                itemCount: result.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return VoirCour(
                            cours: result[i].cours,
                            color: widget.couleur,
                          );
                        }),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      color: Color(0xff6b7b8c),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 10),
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
                          Positioned(
                            bottom: 10,
                            right: 20,
                            child: PoyAnime(
                              second: 2,
                              depart: "bas",
                              child: Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Color(0xff6b7b8c),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
  Cours(String titreLecon, String descriptionLecon, {this.cours}) {
    this.titreLecon = titreLecon;
    this.descriptionLecon = descriptionLecon;
  }
}
