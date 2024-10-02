import 'package:flutter/material.dart';
import 'package:grofast/core/theme/app_colors.dart';

class CurvedTopContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const CurvedTopContainer({
    super.key,
    required this.child,
    this.width = 300,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CurvedTopPainter(),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}

class _CurvedTopPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * 0.1)
      ..quadraticBezierTo(
        size.width / 2,
        0,
        size.width,
        size.height * 0.1,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);

    final shadowPaint = Paint()
      ..color = AppColors.white
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    canvas.drawPath(path, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
