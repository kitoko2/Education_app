import 'package:education/animation/animation.dart';
import 'package:education/authentification/database.dart';
import 'package:education/home/chat_parametre/chat_params.dart';
import 'package:education/home/chat_parametre/espace_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "package:fluttertoast/fluttertoast.dart";

class EspaceMembre extends StatefulWidget {
  final String? uid;
  final String? email;
  EspaceMembre({this.uid, this.email});
  @override
  _EspaceMembreState createState() => _EspaceMembreState();
}

class _EspaceMembreState extends State<EspaceMembre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamProvider<List<UserInfor>>.value(
        initialData: [],
        value: DatabaseFirestore(uid: widget.uid).usersinfos,
        child: Container(
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade400,
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
                              color: Colors.blue.shade400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 95,
                      left: 15,
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 20,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PoyAnime(
                              second: 1,
                              depart: "bas",
                              child: Text(
                                "ce espace sera un espace ou tous ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            PoyAnime(
                              second: 2,
                              depart: "bas",
                              child: Text(
                                "nos utilisateurs pouront discutés sur les différents cours (un espace chat)",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            PoyAnime(
                              second: 1,
                              depart: "bas",
                              child: Text(
                                "Afin de se partager les connaissances",
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
                SizedBox(height: 15),
                Res(
                  email: widget.email,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Res extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String? email;
  Res({this.email});
  @override
  Widget build(BuildContext context) {
    final result = Provider.of<List<UserInfor>>(context);
    for (var i = 0; i < result.length; i++) {
      if (result[i].uid == auth.currentUser!.uid) {
        result.remove(result[i]);
      }
      // print(result[i].name);
    }
    //on doit supprimer soit le mail de l'utilisateur actuelle dans la liste des mails retourner( car il peut pas s'ecrire a lui mm,),

    return result != []
        ? Expanded(
            child: ListView.builder(
              itemCount: result.length,
              padding: EdgeInsets.symmetric(
                vertical: 8,
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    //possibilite d'introduire un chat complet a l'avenir
                    if (auth.currentUser!.uid != result[index].uid) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return EspaceChat(
                              chatParam: ChatParam(
                                uid: auth.currentUser!.uid,
                                destinataire: result[index],
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: "impossible de chater avec vous-même",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        fontSize: 13.5,
                      );
                      // mais ne devrais jamais arriver car j'ai supprimer le current user dans la liste;
                    }
                  },
                  title: Text("${result[index].name}"),
                  leading: auth.currentUser!.email == result[index].name
                      ? Text("")
                      : Icon(Icons.message),
                );
              },
            ),
          )
        : Expanded(
            child: Center(
              child: Text("Vous etes le seul inscrit pour le moment"),
            ),
          );
  }
}
