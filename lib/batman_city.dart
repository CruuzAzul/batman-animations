import 'package:flutter/material.dart';

class BatmanCity extends AnimatedWidget {
  const BatmanCity(
    Animation animation, 
  ) : super(listenable: animation);
  Animation get _animationCity => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CityClipper(_animationCity.value),
      child: Image.asset(
        'assets/images/city.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

class _CityClipper extends CustomClipper<Path> {
  final double progress;

  _CityClipper(this.progress);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, size.height * (1 - progress));
    path.lineTo(0.0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
