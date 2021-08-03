import 'package:education/authentification/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:google_sign_in/google_sign_in.dart";

class AuthentificationService {
  FirebaseAuth auth = FirebaseAuth.instance;

  GoogleSignIn authgoogle = GoogleSignIn();

  User? utilisateur(User? user) {
    return user != null ? user : null;
  }

  Stream<User?> get user {
    return auth.authStateChanges().map(utilisateur);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;
      return utilisateur(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  } //s'identifier

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;
      await DatabaseFirestore(uid: user!.uid)
          .saveUser(name: email, isFirst: true);
      return utilisateur(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithGoole() async {
    try {
      GoogleSignInAccount? connexion = await authgoogle.signIn();

      GoogleSignInAuthentication? authentication =
          await connexion!.authentication; //authentifiaction
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );

      print(connexion.email);

      await auth.signInWithCredential(credential);
      await DatabaseFirestore()
          .userCollection
          .doc(auth.currentUser!.uid)
          .get()
          .then((doc) {
        if (!doc.exists) {
          DatabaseFirestore(uid: auth.currentUser!.uid)
              .saveUser(name: connexion.email, isFirst: true);
        }
        // si le document n'existe pas on le cree et on donne la valeur isFisrt=true qui sera changer dans le home plus tard
        // si on ne fait pas commxe a chaque fois que l'utilisateur voudra s'identifier avec google
        // la isFisrt deviendrat true et le pop Up (inscription valide) reviendra
      });

      return utilisateur(auth.currentUser);
      //auth.current utilisateur return un User(je peux donc use l'email...)
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future deconnexion() async {
    try {
      await auth.signOut(); //deconnection email mdp
      await authgoogle.signOut(); // decoonection google
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

// si ya une erreur de PlatformException(sign_in_failed, com.google.android.gms.common.api.ApiException: 12500: , null)
// on ajoute un email a Adresse e-mail associée dans firebase ou une clé sha
