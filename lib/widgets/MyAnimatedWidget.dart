import 'package:flutter/cupertino.dart';

class MyAnimatedWidget extends StatelessWidget {
  const MyAnimatedWidget({super.key, required this.child, required this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => SlideTransition(
          position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: const Offset(0, 0)
          ).animate(animation),
          child: child,
        ),
        child: child),
  );
}