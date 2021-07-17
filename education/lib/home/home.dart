import 'dart:async';
import 'package:education/afterHome/menuCours.dart';
import 'package:education/animation/custompageT.dart';
import 'package:education/authentification/authentification.dart';
import 'package:education/authentification/database.dart';
import 'package:education/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class Home extends StatefulWidget {
  final User? user;

  const Home({this.user});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ImagePicker imagepicker = ImagePicker();
  String? value;
  AuthentificationService auth = AuthentificationService();
  List<Matiere> matiereDispo = [
    Matiere(
      "Mathematique",
      "les maths dans la poche",
      Colors.red.withOpacity(0.7),
    ),
    Matiere(
      "Anglais",
      "l'anglais donne des ailes",
      Colors.blue.withOpacity(0.7),
    ),
    Matiere(
      "Français",
      "s'avoir s'exprimer pour reigner",
      Colors.blue.withOpacity(0.7),
    ),
    Matiere(
      "Physique",
      "la physique pour les geeks",
      Colors.red.withOpacity(0.7),
    ),
  ];
  late UserInfor? result = UserInfor();

  @override
  void initState() {
    super.initState();

    _prefs.then((SharedPreferences prefs) {
      setState(() {
        value = prefs.getString("photoProfile") ?? null;
      });
    }); //pour aller chercher la photo de profils
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (result!.isFirst == true) {
        setState(() {
          result!.isFirst = false;
          DatabaseFirestore(uid: widget.user!.uid)
              .saveUser(name: widget.user!.email, isFirst: false);
          //pour changer dans la base de donne (si le meme utilisateur viens prochainement (se connecte))
          // il n'y aura pas mon toast
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return StreamBuilder<UserInfor>(
      initialData: null,
      stream: DatabaseFirestore(uid: widget.user!.uid).userinfo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          result = snapshot.data;
          return Scaffold(
            endDrawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "${widget.user!.email}",
                              style: TextStyle(
                                fontFamily: "police1",
                                fontSize: 20,
                              ),
                            ),
                            if (widget.user!.displayName != null)
                              Text("${widget.user!.displayName}"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text("deconexion"),
                    leading: Icon(Icons.logout),
                    onTap: () {
                      auth.deconnexion();
                    },
                  )
                ],
              ),
            ),
            appBar: new AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              centerTitle: true,
              title: Column(
                children: [
                  Text(
                    "Bienvenue!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  Text(
                    widget.user!.displayName != null
                        ? "${widget.user!.displayName}"
                        : "${widget.user!.email}",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              actions: [
                Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          backgroundImage: widget.user!.photoURL != null
                              ? NetworkImage(widget.user!.photoURL!)
                              : null,
                          child: widget.user!.photoURL == null
                              ? Text(
                                  "${firstLetterEmail(widget.user!.email!)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red.withOpacity(0.9),
                        ),
                        height: size.height / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Vos cours d'aujourd'hui",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Container(
                              child: Image.asset("asset/description (1).png"),
                              height: (size.height / 3) - 50,
                              width: 150,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        "Cours disponibles",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      SizedBox(height: 13),
                      Expanded(
                        child: StaggeredGridView.countBuilder(
                          padding:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                          itemCount: matiereDispo.length,
                          crossAxisCount: 2,
                          mainAxisSpacing: size.width >= 768 ? 20 : 10,
                          crossAxisSpacing: size.width >= 768 ? 20 : 10,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PoyCustom(
                                    child: MenuCours(
                                      nomMatiere: matiereDispo[index].nom,
                                      couleur: matiereDispo[index].couleur,
                                      description:
                                          matiereDispo[index].description,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 19, horizontal: 8),
                                decoration: BoxDecoration(
                                  color: matiereDispo[index].couleur,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        "${matiereDispo[index].nom}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${matiereDispo[index].description}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: "police1",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          staggeredTileBuilder: (i) {
                            return StaggeredTile.count(
                                1, oneORtwo(i)! ? 1.1 : 1);
                            //si i =1 ou i=2 le container aura une taille plus grande
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (result!.isFirst == true) //si il vient de s'inscrire
                  Positioned(
                    bottom: 15,
                    left: (size.width - 210) / 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.blueGrey,
                      ),
                      width: 210,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check, color: Colors.white, size: 15),
                          SizedBox(
                            width: 12.0,
                          ),
                          Text(
                            "Inscription Valider",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        } else {
          return Container(
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
              child: SpinKitCubeGrid(
                color: Color(0xFF6C63FF),
                size: 30,
              ),
            ),
          );
        }
      },
    );
  }

  bool? oneORtwo(i) {
    if (i == 1 || i == 2) {
      return true;
    } else {
      return false;
    }
  }

  String firstLetterEmail(String email) {
    return email[0].toUpperCase();
  }

  // Future<void>? takePhoto() async {
  //   try {
  //     var image = await imagepicker.getImage(source: ImageSource.camera);

  //     if (image != null) {
  //       File tmpfile = File(image.path);

  //       _prefs.then((SharedPreferences prefs) {
  //         setState(() {
  //           prefs.setString("photoProfile", tmpfile.path);
  //           value = prefs.getString("photoProfile") ?? null;
  //         });
  //       });
  //     } else {
  //       print("aucune photo prise");
  //     }
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void>? chooseImage() async {
  //   try {
  //     var image = await imagepicker.getImage(source: ImageSource.gallery);

  //     if (image != null) {
  //       File tmpfile = File(image.path);
  //       _prefs.then((SharedPreferences prefs) {
  //         setState(() {
  //           prefs.setString("photoProfile", tmpfile.path);
  //           value = prefs.getString("photoProfile");
  //         });
  //       });
  //     }
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }
  // }   NB : PAS UTILISER (CAR j'UTILISE l'IMAGE DE GOOGLE)
}

class Matiere {
  String? nom;
  String? description;
  String? image;
  Color? couleur;
  Matiere(String nom, String description, Color couleur) {
    this.nom = nom;
    this.description = description;
    this.couleur = couleur;
    // this.image=image;
  }
}
