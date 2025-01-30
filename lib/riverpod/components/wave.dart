import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Wave extends StatefulWidget {
  final double? value;
  final Color color;
  final Axis direction;

  const Wave({
    super.key,
    required this.value,
    required this.color,
    required this.direction,
  });

  @override
  State createState() => _WaveState();
}

class _WaveState extends State<Wave> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 3), // Aumentata la durata per un movimento più fluido
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
      builder: (context, child) => ClipPath(
        clipper: _WaveClipper(
          animationValue: _animationController.value,
          value: widget.value,
          direction: widget.direction,
        ),
        child: Container(
          color: widget.color,
        ),
      ),
    );
  }
}

class _WaveClipper extends CustomClipper<Path> {
  final double animationValue;
  final double? value;
  final Axis direction;

  _WaveClipper({
    required this.animationValue,
    required this.value,
    required this.direction,
  });

  @override
  Path getClip(Size size) {
    if (direction == Axis.horizontal) {
      Path path = Path()
        ..addPolygon(_generateHorizontalWavePath(size), false)
        ..lineTo(0.0, size.height)
        ..lineTo(0.0, 0.0)
        ..close();
      return path;
    }

    Path path = Path()
      ..addPolygon(_generateVerticalWavePath(size), false)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  List<Offset> _generateHorizontalWavePath(Size size) {
    final waveList = <Offset>[];
    final frequency = kIsWeb ? 2.0 : 4.0; // Aumentata la frequenza dell'onda
    final amplitude = size.width / 50; // Aumentata l'ampiezza dell'onda

    for (int i = -2; i <= size.height.toInt() + 2; i++) {
      final x = math.sin((animationValue * 360 - i * frequency) %
                  360 *
                  (math.pi / 180)) *
              amplitude +
          (size.width * value!);
      // Aggiunta una seconda onda sfasata per un effetto più complesso
      final x2 = math.sin((animationValue * 360 - i * frequency + 45) %
              360 *
              (math.pi / 180)) *
          (amplitude * 0.5);
      waveList.add(Offset(x + x2, i.toDouble()));
    }
    return waveList;
  }

  List<Offset> _generateVerticalWavePath(Size size) {
    final waveList = <Offset>[];
    final frequency = kIsWeb ? 2.0 : 4.0; // Aumentata la frequenza dell'onda
    final amplitude = size.height / 50; // Aumentata l'ampiezza dell'onda

    for (int i = -2; i <= size.width.toInt() + 2; i++) {
      final y = math.sin((animationValue * 360 - i * frequency) %
                  360 *
                  (math.pi / 180)) *
              amplitude +
          (size.height - (size.height * value!));
      // Aggiunta una seconda onda sfasata per un effetto più complesso
      final y2 = math.sin((animationValue * 360 - i * frequency + 45) %
              360 *
              (math.pi / 180)) *
          (amplitude * 0.5);
      waveList.add(Offset(i.toDouble(), y + y2));
    }
    return waveList;
  }

  @override
  bool shouldReclip(_WaveClipper oldClipper) =>
      animationValue != oldClipper.animationValue;
}
