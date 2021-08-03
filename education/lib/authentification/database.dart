import "package:cloud_firestore/cloud_firestore.dart";

class DatabaseFirestore {
  final String? uid;
  DatabaseFirestore({this.uid});

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  saveUser({String? name, bool? isFirst}) async {
    return  userCollection.doc(uid).set({
      "name": name,
      "isFirst": isFirst,
    });
  }

  UserInfor infoUtilisateur(DocumentSnapshot snapshot) {
    return UserInfor(
      uid: snapshot.id,
      //pas uid sinons tous les utilisateurs auront l'uid du connectecté
      name: (snapshot.data() as dynamic)["name"],
      isFirst: (snapshot.data() as dynamic)["isFirst"],
    );
  }

  Stream<UserInfor> get userinfo {
    return userCollection.doc(uid).snapshots().map(infoUtilisateur);
  }

  List<UserInfor> infosUtilisateurs(QuerySnapshot snapshot) {
    return snapshot.docs.map(
      (DocumentSnapshot document) {
        return infoUtilisateur(document);
      },
    ).toList(); //pour retourner une liste
  }

  Stream<List<UserInfor>> get usersinfos {
    return userCollection.snapshots().map(infosUtilisateurs);
  }
}

class UserInfor {
  final String? uid;
  final String? name;
  bool? isFirst;
  UserInfor({this.name, this.isFirst, this.uid});
}
