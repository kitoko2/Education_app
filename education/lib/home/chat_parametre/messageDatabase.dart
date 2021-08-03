import 'package:cloud_firestore/cloud_firestore.dart';

class MessageDataBase {
  Stream<List<Message>?> getMessages(String idConversation, int limit) {
    return FirebaseFirestore.instance
        .collection("message")
        .doc(idConversation)
        .collection(idConversation)
        .orderBy("timestamp", descending: true)
        .limit(limit)
        .snapshots()
        .map(mesmessage);
  }

  List<Message>? mesmessage(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Message(
        idEnvoyeur: (doc.data() as dynamic)["idEnvoyeur"],
        idReceveur: (doc.data() as dynamic)["idReceveur"],
        timestamp: (doc.data() as dynamic)["timestamp"],
        content: (doc.data() as dynamic)["content"],
      );
    }).toList();
  }

  void sendMessage(String idConversation, Message message) {
    var documentReference = FirebaseFirestore.instance
        .collection("message")
        .doc(idConversation)
        .collection(idConversation)
        .doc(
          DateTime.now().millisecondsSinceEpoch.toString(),
        );

    FirebaseFirestore.instance.runTransaction(
      (transaction) async {
        transaction.set(
          documentReference,
          {
            "idEnvoyeur": message.idEnvoyeur,
            "idReceveur": message.idReceveur,
            "timestamp": message.timestamp,
            "content": message.content,
          },
        );
      },
    );
  } //pour envoyer un sms j'ai besoin d'un objet Message et du idConversation (dans chat params)
}

class Message {
  final String? idEnvoyeur;
  final String? idReceveur;
  final int? timestamp;
  final String? content;

  Message({
    required this.idEnvoyeur,
    this.idReceveur,
    this.timestamp,
    this.content,
  });
  Map<String, dynamic> fromClasstoMap() {
    return {
      "idEnvoyeur": idEnvoyeur,
      "idReceveur": idReceveur,
      "timestamp": timestamp,
      "content": content,
    };
  }

  factory Message.fromMaptoClass(Map<String, dynamic> map) {
    return Message(
      idEnvoyeur: map["idEnvoyeur"],
      idReceveur: map["idReceveur"],
      timestamp: map["timestamp"],
      content: map["content"],
    );
  }
}
