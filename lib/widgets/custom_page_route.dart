import 'package:flutter/material.dart';

class CustomDownPageRoute extends PageRouteBuilder{
  final Widget child;
  final AxisDirection direction;
  CustomDownPageRoute({
    required this.child,
    this.direction = AxisDirection.right
  }):
        super(
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => child,
      );
@override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) =>
    SlideTransition(
      position: Tween<Offset>(
        begin: getBeginOffset(),
        end: Offset.zero,
      ).animate( CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut, // You can change the curve here
      ),),
        child: child,);

Offset getBeginOffset() {
  switch (direction) {
    case AxisDirection.up:
      return const Offset(0, 1);
    case AxisDirection.down:
      return const Offset(0, -1);
    case AxisDirection.right:
      return const Offset(-1, 0);
    case AxisDirection.left:
      return const Offset(1, 0);
  }
}
}