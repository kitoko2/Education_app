import "package:cloud_firestore/cloud_firestore.dart";

class DatabaseFirestore {
  final String? uid;
  DatabaseFirestore({this.uid});

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  saveUser({String? name, bool? isFirst}) async {
    return await userCollection.doc(uid).set({
      "name": name,
      "isFirst": isFirst,
    });
  }

  UserInfor infoUtilisateur(DocumentSnapshot snapshot) {
    return UserInfor(
      name: (snapshot.data() as dynamic)["name"],
      isFirst: (snapshot.data() as dynamic)["isFirst"],
    );
  }

  Stream<UserInfor> get userinfo {
    return userCollection.doc(uid).snapshots().map(infoUtilisateur);
  }

  List<UserInfor> infosUtilisateurs(QuerySnapshot snapshot) {
    return (snapshot as dynamic).docs(uid).map((doc) {
      return infoUtilisateur(doc);
    });
  }

  Stream<List<UserInfor>> get usersinfos {
    return userCollection.snapshots().map(infosUtilisateurs);
  }
}

class UserInfor {
  final String? name;
  bool? isFirst;
  UserInfor({this.name, this.isFirst});
}
