import 'package:flutter/material.dart';

typedef CustomTransitionBuilder = Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    );

class PageTransitions {
  static CustomTransitionBuilder fade = (
      context,
      animation,
      secondaryAnimation,
      child,
      ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  };

  static CustomTransitionBuilder slideFromRight = (
      context,
      animation,
      secondaryAnimation,
      child,
      ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  };

  static CustomTransitionBuilder slideFromBottom = (
      context,
      animation,
      secondaryAnimation,
      child,
      ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  };

  static CustomTransitionBuilder scale = (
      context,
      animation,
      secondaryAnimation,
      child,
      ) {
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  };

  static CustomTransitionBuilder rotate = (
      context,
      animation,
      secondaryAnimation,
      child,
      ) {
    return RotationTransition(
      turns: animation,
      child: child,
    );
  };

  static CustomTransitionBuilder slideFadeFromRight = (
      context,
      animation,
      secondaryAnimation,
      child,
      ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0), // 오른쪽에서
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  };

  static CustomTransitionBuilder slideFadeFromLeft = (
      context,
      animation,
      secondaryAnimation,
      child,
      ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.0, 0.0), // 왼쪽에서
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  };

  static CustomTransitionBuilder slideFadeFromTop = (
      context,
      animation,
      secondaryAnimation,
      child,
      ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, -1.0), // 위에서
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  };

  static CustomTransitionBuilder slideFadeFromBottom = (
      context,
      animation,
      secondaryAnimation,
      child,
      ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0), // 아래에서
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  };
}