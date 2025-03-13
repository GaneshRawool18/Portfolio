import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle; // ✅ Allow custom text styles
  final List<Color> gradientColors; // ✅ Allow custom gradients

  AnimatedButton({
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.gradientColors = const [
      Colors.blue,
      Colors.purple
    ], // Default gradient
  });

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: ScaleTransition(
          scale: _animation,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03, // Responsive padding
              vertical: screenWidth * 0.009,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.gradientColors, // ✅ Use custom gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Text(
              widget.text,
              style: widget.textStyle ??
                  TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.018 > 20
                        ? 20
                        : screenWidth *
                            0.018, // ✅ Ensure text is not too big/small
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
