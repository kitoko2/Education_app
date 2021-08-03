import 'package:education/animation/animation.dart';
import "package:flutter/material.dart";
import 'package:package_info/package_info.dart';
import "package:url_launcher/url_launcher.dart";

// je crée une meme page pour gerer info devellopeur et a propos de l'application
class InfoOrPropos extends StatefulWidget {
  final bool? isInfoDev;
  InfoOrPropos({this.isInfoDev});
  //si isInfoDev = true alors je suis sur la page info_dev sinon je suis sur la page a propos de l'application
  //je fais cela pour ne pas avoir a creer 2 pages distincts.

  @override
  _InfoOrProposState createState() => _InfoOrProposState();
}

class _InfoOrProposState extends State<InfoOrPropos> {
  bool isplus = true;
  String version = "";

  contactWhatssap({required String? numero, required String? msg}) async {
    String url = "https://wa.me/$numero/?text=$msg"; //numero avec code du pays
    bool lancement = await canLaunch(url);
    lancement ? await launch(url) : throw "pas de connexion";
  }

  contactMail(
      {required String? mail,
      required String? subject,
      required String body}) async {
    String url = "mailto:$mail?subject=$subject&body=$body";
    bool lancement = await canLaunch(url);
    lancement ? await launch(url) : throw "pas de connexion";
  }

  @override
  void initState() {
    super.initState();
    getVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          splashRadius: 20,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 16,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.isInfoDev == true
              ? "Informations développeurs"
              : "A propos de Logitech",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      body: widget.isInfoDev == true
          ? ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: Colors.white,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nous sommes un groupe d'etudiants constitué de quatres personnes spécialisé dans le developpement mobile avec le framework flutter .\nCette application est le resultat du projet de fin de formation qui nous a été soumis , et qui consiste à rendre l'education accessible avec le téléphone ",
                              maxLines: isplus ? null : 5,
                              overflow: isplus ? null : TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "police1",
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                              ),
                              onPressed: () {
                                setState(() {
                                  isplus = !isplus;
                                });
                              },
                              child: Text(
                                isplus ? "voir moins" : "voir plus",
                                style: TextStyle(
                                  fontFamily: "police1",
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Center(
                              child: PoyAnime(
                                child: Container(
                                  child: Image.asset("asset/group2.png"),
                                  width: 200,
                                  height: 200,
                                ),
                                second: 2,
                                depart: "left",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                "Ce projet qui nous a été soumis par NaN à la suite de notre formation s’inscrit dans notre dynamisme qui est de résoudre les problèmes dans la société en l'occurrence ici celui de l’éducation. Notre but est donc qu’a parti de notre application toutes catégories de personnes aient accès à l’enseignement. Book Creator , parce que étant accessible à tous le monde (les petits comme les grands) ce outils se distingue par son modèle qui est de faire participer chacun à l’apprentissage de l’autre . 	Notre but est de créer une application mobile  (Ios et Android) et web qui regroupera différents cours de plusieurs niveaux dans le but de facilités les apprenants et leurs donnés une réelle base dans plusieurs domaines.",
                style: TextStyle(
                  fontFamily: "police1",
                ),
              ),
            ),
      bottomSheet: widget.isInfoDev == true
          ? Container(
              height: 95,
              width: double.infinity,
              padding: EdgeInsets.only(top: 10, bottom: 22),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        mybtn("Whatssap", "asset/wha1.png"),
                        mybtn("Mail", "asset/gmail.png"),
                      ],
                    ),
                    Text(
                      "@copyright by poyo",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 10,
                        fontFamily: "police1",
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.only(bottom: 22),
              width: double.infinity,
              height: 42,
              child: Center(
                child: Text(
                  "version : $version",
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "police1",
                  ),
                ),
              ),
            ),
    );
  }

  getVersion() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      version = info.version;
    });
  }

  Widget mybtn(String label, String asset) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        fixedSize: MaterialStateProperty.all(Size(120, 24)),
        backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
        ),
      ),
      onPressed: () {
        if (label == "Whatssap") {
          contactWhatssap(numero: "+2250787610716", msg: "Salut Logitech!");
        } else {
          contactMail(
            mail: "dogbo804@gmail.com",
            subject: "A propos de Logitech",
            body: "Salut Logitech!",
          );
        }
      },
      icon: Container(
        width: 20,
        height: 20,
        child: Image.asset(asset),
      ),
      label: Text(label),
    );
  }
}
