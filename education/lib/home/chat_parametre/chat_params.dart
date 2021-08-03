import 'package:education/authentification/database.dart';

class ChatParam {
  final String? uid; //uid du connecter
  final UserInfor? destinataire;
  ChatParam({required this.uid, required this.destinataire});

  //id de la conversation est le plus ptit hasCode - le plus grand has code
  getIdConversation() {
    if (uid.hashCode < destinataire!.uid.hashCode) {
      return "$uid-${destinataire!.uid}";
    } else {
      return "${destinataire!.uid}-$uid";
    }
  }
}
