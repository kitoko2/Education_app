import 'package:education/description.dart';
import 'package:education/home/home.dart';
import 'package:education/switchWidget/firstornot.dart';
import 'package:education/test.dart';
import "package:splash_screen_view/SplashScreenView.dart";
import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF6C63FF),
        ),
      ),
      title: "Education",
      home: Splash(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/route1": (context) => Home(),
        "/pageDescription": (context) => Description(),
        "/test": (context) => Test(),
      },
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: FirstOrNot(),
      duration: 5000,
      imageSrc: "asset/splash/iconSplash.png",
      imageSize: 300,
      backgroundColor: Colors.red[300],
      text: "Logitech",
      textType: TextType.ColorizeAnimationText,
      colors: [
        Color(0xFF6C63FF),
        Colors.orange,
        Color(0xFF6C63FF),
        Colors.teal,
        Color(0xFF6C63FF),
      ],
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      pageRouteTransition: PageRouteTransition.SlideTransition,
    );
  }
}
