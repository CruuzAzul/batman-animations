import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BatmanScreenTitle extends AnimatedWidget {
  const BatmanScreenTitle(
    Animation animation, 
  ) : super(listenable: animation);
  Animation get _animationLogoMovementUp => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animationLogoMovementUp.value,
      child: Column(
        children: [
          Text(
            'WELCOME TO',
            style: GoogleFonts.vidaloka(
              textStyle: TextStyle(
                  color: Colors.white, fontSize: 25),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'GOTHAM CITY',
            style: GoogleFonts.vidaloka(
              textStyle: TextStyle(
                  color: Colors.white, fontSize: 35),
            ),
          ),
        ],
      ),
    );
  }
}
