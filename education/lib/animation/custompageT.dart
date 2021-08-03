import "package:flutter/material.dart";

class PoyCustom extends PageRouteBuilder {
  final child;
  var pos = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero);
  PoyCustom({this.child})
      : super(
          transitionDuration: Duration(milliseconds: 500),
          reverseTransitionDuration: Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondAimation) {
            return child;
          },
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: pos.animate(animation),
      child: child,
    );
  }
}
