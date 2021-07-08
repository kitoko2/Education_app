import 'package:education/main.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import "dart:io";
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ImagePicker imagepicker = ImagePicker();
  String? value;

  List<Matiere> matiereDispo = [
    Matiere("Mathematique", "les maths dans la poche"),
    Matiere("Anglais", "l'anglais donne des ailes"),
    Matiere("Français", "s'avoir s'exprimer pour reigner"),
    Matiere("Physique", "la physique pour les geeks"),
  ];
  @override
  void initState() {
    super.initState();
    _prefs.then((SharedPreferences prefs) {
      setState(() {
        value = prefs.getString("photoProfile") ?? null;
      });
    }); //pour aller chercher la photo de profils
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          "Bienvenue!",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text("Voulez-vous?"),
                        children: [
                          ListTile(
                            leading: Icon(Icons.camera_alt),
                            title: Text("Prendre une photo"),
                            onTap: () {
                              takePhoto();
                              Navigator.pop(context);
                              //prendre une photo et ensuite delete la pop up
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.photo),
                            title: Text("Choisir dans galerie"),
                            onTap: () {
                              chooseImage();
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
              child: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                backgroundImage: value != null
                    ? FileImage(
                        File(value!),
                      )
                    : null,
                child: value == null ? Text("Nom") : null,
              ),
            ),
          ),
        ],
      ),
      body: Container(
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            SizedBox(height: 13),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                itemCount: matiereDispo.length,
                crossAxisCount: 2,
                mainAxisSpacing: size.width >= 768 ? 20 : 10,
                crossAxisSpacing: size.width >= 768 ? 20 : 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //next page
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 19, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.6),
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
                                  fontFamily: "police1"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (i) {
                  return StaggeredTile.count(1, i.isEven ? 1 : 1.1);
                  //si i est pair le container aurat une taille 1 sinon 1.1
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void>? takePhoto() async {
    try {
      var image = await imagepicker.getImage(source: ImageSource.camera);

      if (image != null) {
        File tmpfile = File(image.path);

        _prefs.then((SharedPreferences prefs) {
          setState(() {
            prefs.setString("photoProfile", tmpfile.path);
            value = prefs.getString("photoProfile") ?? null;
          });
        });
      } else {
        print("aucune photo prise");
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void>? chooseImage() async {
    try {
      var image = await imagepicker.getImage(source: ImageSource.gallery);

      if (image != null) {
        File tmpfile = File(image.path);
        _prefs.then((SharedPreferences prefs) {
          setState(() {
            prefs.setString("photoProfile", tmpfile.path);
            value = prefs.getString("photoProfile");
          });
        });
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }
}

class Matiere {
  String? nom;
  String? description;
  String? image;
  Matiere(String nom, String description) {
    this.nom = nom;
    this.description = description;
    // this.image=image;
  }
}
