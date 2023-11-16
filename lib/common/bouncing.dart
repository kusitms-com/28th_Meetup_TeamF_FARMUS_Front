import 'package:flutter/material.dart';

class Bouncing extends StatefulWidget {
  final Widget child;
  final Function()? onPress;

  Bouncing({required this.child, Key? key, this.onPress}) : super(key: key);

  @override
  _BouncingState createState() => _BouncingState();
}

class _BouncingState extends State<Bouncing>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        _controller.forward();
      },
      onPointerUp: (PointerUpEvent event) {
        _controller.reverse();
        if (widget.onPress != null) {
          widget.onPress!();
        }
      },
      child: GestureDetector(
        onTap: widget.onPress,
        child: Transform.scale(
          scale: _scale,
          child: widget.child,
        ),
      ),
    );
  }
}
