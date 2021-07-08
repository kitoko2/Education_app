import 'dart:async';

import 'package:flutter/material.dart';

class PoyAnime extends StatefulWidget {
  final Widget? child;
  final int? second;
  final String? depart;
  const PoyAnime({this.child, this.second, this.depart});

  @override
  _PoyAnimeState createState() => _PoyAnimeState();
}

class _PoyAnimeState extends State<PoyAnime>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 500),
  );
  late final pos = Tween<Offset>(begin: Offset(0, 0.6), end: Offset.zero)
      .animate(animationController);
  late final pos1 = Tween<Offset>(begin: Offset(0, -0.9), end: Offset.zero)
      .animate(animationController);
  late final pos2 = Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
      .animate(animationController);
  Animation<Offset>? position;
  func() {
    switch (widget.depart) {
      case "top":
        position = pos1;
        break;
      case "bas":
        position = pos;
        break;
      case "left":
        position = pos2;
        break;

      default:
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    func();
    Timer(Duration(seconds: widget.second!), () {
      if (mounted) {
        animationController.forward();
      } // on verifie d'abord si on est sur la page(pour ne pas que le timer genere une erreur)
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SlideTransition(
        child: widget.child,
        position: position!,
      ),
    );
  }
}
