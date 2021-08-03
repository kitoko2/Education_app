import 'dart:async';

import 'package:education/home/chat_parametre/chat_params.dart';
import 'package:education/home/chat_parametre/messageDatabase.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class EspaceChat extends StatefulWidget {
  final ChatParam? chatParam;
  const EspaceChat({this.chatParam});

  @override
  _EspaceChatState createState() => _EspaceChatState();
}

class _EspaceChatState extends State<EspaceChat> {
  ScrollController listcontroller = ScrollController();
  TextEditingController _textEditingController = TextEditingController();
  int? limit = 20;
  var internet = false;
  var checkinternet = InternetConnectionChecker();
  MessageDataBase messageDataBase = MessageDataBase();

  internetchecker() async {
    if (await checkinternet.hasConnection) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    listcontroller.addListener(() {
      if (listcontroller.offset <= listcontroller.position.maxScrollExtent &&
          !listcontroller.position.outOfRange) {
        setState(() {
          limit = limit! + 20;
        });
      }
    });

    Timer.periodic(
      Duration(milliseconds: 1000),
      (timer) async {
        if (mounted) {
          internet = await internetchecker();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      internet = internet;
    });

    // print(widget.chatParam!.uid);
    // print(widget.chatParam!.destinataire!.name);
    // print(widget.chatParam!.getIdConversation());
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "chat avec ${widget.chatParam!.destinataire!.name}",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
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
      ),
      body: Container(
        child: Column(
          children: [
            listmessage(
              listcontroller,
              widget.chatParam!.uid,
              widget.chatParam,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueGrey,
                      ),
                      width: 300,
                      child: TextFormField(
                        controller: _textEditingController,
                        cursorColor: Colors.white,
                        cursorHeight: 22,
                        autofocus: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      splashRadius: 28,
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_textEditingController.text.trim() != "") {
                            internet
                                ? messageDataBase.sendMessage(
                                    widget.chatParam!.getIdConversation(),
                                    Message(
                                      idEnvoyeur: widget.chatParam!.uid,
                                      idReceveur:
                                          widget.chatParam!.destinataire!.uid,
                                      content: _textEditingController.text,
                                      timestamp:
                                          DateTime.now().millisecondsSinceEpoch,
                                    ),
                                  )
                                : Fluttertoast.showToast(
                                    msg: "internet non disponible",
                                  );
                            listcontroller.animateTo(
                              0.0,
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceIn,
                            ); //revenir ts en bas apres l'envois d'un sms
                          } else {
                            Fluttertoast.showToast(
                              msg: "entrer un message svp",
                            );
                          }
                          _textEditingController.clear();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listmessage(
      ScrollController? listcontroller, String? userId, ChatParam? chatparam) {
    return Expanded(
      child: StreamBuilder<List<Message>?>(
        stream:
            messageDataBase.getMessages(chatparam!.getIdConversation(), limit!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message>? res = snapshot.data ?? [];
            // print(res);

            return ListView.builder(
              controller: listcontroller,
              reverse: true,
              itemCount: res.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: userId == res[index].idEnvoyeur
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  crossAxisAlignment: userId == res[index].idEnvoyeur
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: userId == res[index].idEnvoyeur
                            ? Colors.blueGrey
                            : Colors.teal,
                        borderRadius: userId == res[index].idEnvoyeur
                            ? BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              )
                            : BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                      ),
                      child: Center(
                        child: Text(
                          "${res[index].content}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
