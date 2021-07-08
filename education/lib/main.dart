import 'package:education/description.dart';
import 'package:education/getting_start.dart';
import 'package:education/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:splash_screen_view/SplashScreenView.dart";
import "package:flutter/material.dart";


void main() {
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
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool>? isFirst;
  bool premier = true;
  @override
  void initState() {
    super.initState();
    isFirst = _prefs.then((SharedPreferences prefs) {
      setState(() {
        premier = prefs.getBool("isFirst") ?? true;
      });
      return prefs.getBool("isFirst") ?? true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: premier ? GettingStart() : Home(),
      duration: 5000,
      imageSrc: "asset/splash/iconSplash.png",
      imageSize: 300,
      backgroundColor: Color(0xFFD26EEC),
      text: "Poy & Smad",
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
