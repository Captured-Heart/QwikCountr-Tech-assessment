// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// Displays a widget that will be passed to `child` parameter above the current
/// contents of the app, with transition animation
///
/// The `child` argument is used to pass widget that you want to show
///
/// The `showOutAnimationDuration` argument is used to specify duration of
/// enter transition
///
/// The `hideOutAnimationDuration` argument is used to specify duration of
/// exit transition
///
/// The `displayDuration` argument is used to specify duration displaying
///
/// The `additionalTopPadding` argument is used to specify amount of top
/// padding that will be added for SafeArea values
///
/// The `overlayState` argument is used to add specific overlay state.
/// If you will not pass it, it will try to get the current overlay state from
/// passed `BuildContext`
///
void showTopSnackBar(
  BuildContext context,
  Widget child, {
  Duration showOutAnimationDuration = const Duration(milliseconds: 1200),
  Duration hideOutAnimationDuration = const Duration(milliseconds: 550),
  Duration displayDuration = const Duration(milliseconds: 3000),
  double additionalTopPadding = 16.0,
  OverlayState? overlayState,
}) {
  overlayState ??= Overlay.of(context);
  OverlayEntry? overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) {
      return TopSnackBar(
        onDismissed: () {
          overlayEntry!.remove();
        },
        showOutAnimationDuration: showOutAnimationDuration,
        hideOutAnimationDuration: hideOutAnimationDuration,
        displayDuration: displayDuration,
        additionalTopPadding: additionalTopPadding,
        child: child,
      );
    },
  );

  overlayState!.insert(overlayEntry);
}

/// Widget that controls all animations
class TopSnackBar extends StatefulWidget {
  final Widget child;
  final VoidCallback onDismissed;
  final showOutAnimationDuration;
  final hideOutAnimationDuration;
  final displayDuration;
  final additionalTopPadding;

  const TopSnackBar({
    Key? key,
    required this.child,
    required this.onDismissed,
    required this.showOutAnimationDuration,
    required this.hideOutAnimationDuration,
    required this.displayDuration,
    required this.additionalTopPadding,
  }) : super(key: key);

  @override
  TopSnackBarState createState() => TopSnackBarState();
}

class TopSnackBarState extends State<TopSnackBar>
    with SingleTickerProviderStateMixin {
  Animation<Offset>? offsetAnimation;
  AnimationController? animationController;
  double? topPosition;

  @override
  void initState() {
    topPosition = widget.additionalTopPadding;
    _setupAndStartAnimation();
    super.initState();
  }

  void _setupAndStartAnimation() async {
    animationController = AnimationController(
      vsync: this,
      duration: widget.showOutAnimationDuration,
      reverseDuration: widget.hideOutAnimationDuration,
    );

    Tween<Offset> offsetTween = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.0),
    );

    offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.elasticOut,
        reverseCurve: Curves.linearToEaseOut,
      ),
    )..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          await Future.delayed(widget.displayDuration);
          animationController!.reverse();
          if (mounted) {
            setState(() {
              topPosition = 0;
            });
          }
        }

        if (status == AnimationStatus.dismissed) {
          widget.onDismissed.call();
        }
      });

    animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget.hideOutAnimationDuration * 1.5,
      curve: Curves.linearToEaseOut,
      top: topPosition,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: offsetAnimation!,
        child: SafeArea(
          child: TapBounceContainer(
            onTap: () {
              animationController!.reverse();
            },
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

/// Widget for nice tap effect. It decrease widget scale while tapping
class TapBounceContainer extends StatefulWidget {
  final Widget child;
  final Function onTap;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  TapBounceContainer({
    required this.child,
    required this.onTap,
  });

  @override
  TapBounceContainerState createState() => TapBounceContainerState();
}

class TapBounceContainerState extends State<TapBounceContainer>
    with SingleTickerProviderStateMixin {
  double? _scale;
  AnimationController? _controller;

  final animationDuration = const Duration(milliseconds: 200);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: animationDuration,
      lowerBound: 0.0,
      upperBound: 0.04,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller!.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onPanEnd: _onPanEnd,
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _controller!.forward();
  }

  void _onTapUp(TapUpDetails details) async {
    await _closeSnackBar();
  }

  void _onPanEnd(DragEndDetails details) async {
    await _closeSnackBar();
  }

  Future _closeSnackBar() async {
    _controller!.reverse();
    await Future.delayed(animationDuration);
    widget.onTap();
  }
}
