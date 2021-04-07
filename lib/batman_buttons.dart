import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class BatmanButton extends StatelessWidget {
  final String text;
  final bool left;
  final VoidCallback onTap;

  const BatmanButton({Key key, this.text, this.left = true, this.onTap}) : super(key: key);

  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFFDE86A),
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: ClipRect(
            child: SizedBox(
              height: 70,
              child: Stack(
                children: [
                  if (left)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..translate(-10.0)
                          ..rotateZ(vector.radians(35)),
                        child: Container(
                          child: Image.asset(
                            'assets/images/batman_logo.png',
                            height: 100,
                            color: Color(0xFFC8B853),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  Center(
                      child: Text(
                    text,
                    style: GoogleFonts.vidaloka(
                      textStyle: TextStyle(
                          color: Color(0xFF100F0B),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  if (!left)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..translate(10.0)
                          ..rotateZ(vector.radians(-35)),
                        child: Image.asset(
                          'assets/images/batman_logo.png',
                          height: 50,
                          color: Color(0xFFC8B853),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
