import "package:flutter/material.dart";

class GettingStart extends StatefulWidget {
  const GettingStart({Key? key}) : super(key: key);

  @override
  _GettingStartState createState() => _GettingStartState();
}

class _GettingStartState extends State<GettingStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.6),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.8,
              child: Center(
                child: Text(
                  "LogiTech",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "Bienvenu dans votre application d'apprentissage , Avec tous un systeme de cours et des exercices adaptés à tous les niveaux , suivis des grands examen regroupés en session ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "police1",
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(220, 50)),
                backgroundColor: MaterialStateProperty.all(
                  Colors.teal.withOpacity(0.7),
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
