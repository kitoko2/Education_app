import "package:flutter/material.dart";

class GettingStart extends StatefulWidget {
  const GettingStart({Key? key}) : super(key: key);

  @override
  _GettingStartState createState() => _GettingStartState();
}

class _GettingStartState extends State<GettingStart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ), // juste la pour appliquer une brighness.dark pour les icones haut du telephone
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: size.height / 2.8,
              child: Image.asset(
                'asset/group1.png',
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "En route vers la connaissance, vous souhaitez apprendre quelque chose de nouveau ou approfondir vos connaissances ? vous êtes au bon endroit, c'est ici",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "police1",
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(220, 50)),
                backgroundColor: MaterialStateProperty.all(
                  Color(0xFF6C63FF),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/pageDescription");
              },
              child: Text(
                "Commencer",
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
