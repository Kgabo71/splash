import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: Center(
          child: Ellipse179Sequence(),
        ),
      ),
    );
  }
}

class Ellipse179Sequence extends StatefulWidget {
  @override
  _Ellipse179SequenceState createState() => _Ellipse179SequenceState();
}

class _Ellipse179SequenceState extends State<Ellipse179Sequence> with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _animations = List.generate(4, (index) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * 0.25, (index + 1) * 0.25),
        ),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAnimatedContainer(71, _animations[0]),
            _buildAnimatedContainer(111, _animations[1]),
            _buildAnimatedContainer(183, _animations[2]),
            _buildSplashingContainer(264, 253, _animations[3]),
          ],
        );
      },
    );
  }

  Widget _buildAnimatedContainer(double size, Animation<double> animation) {
    return Opacity(
      opacity: animation.value,
      child: Transform.scale(
        scale: animation.value,
        child: Container(
          width: size,
          height: size,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFF05D2FF), Color(0xFF3687E5)],
            ),
            shape: CircleBorder(),
          ),
        ),
      ),
    );
  }

  Widget _buildSplashingContainer(double width, double height, Animation<double> animation) {
    return Opacity(
      opacity: animation.value,
      child: Container(
        width: width * (1.0 + animation.value),
        height: height * (1.0 + animation.value),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFF05D2FF), Color(0xFF3687E5)],
          ),
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: Image.network(
            "https://via.placeholder.com/264x253",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
