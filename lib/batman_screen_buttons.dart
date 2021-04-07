import 'package:batman_app/batman_buttons.dart';
import 'package:flutter/material.dart';

class BatmanScreenButtons extends AnimatedWidget {
  const BatmanScreenButtons(
    Animation animation, 
    this.onTap,
  ) : super(listenable: animation);
  final VoidCallback onTap;
  Animation get _animationButtonsIn => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 30),
        child: Opacity(
          opacity: _animationButtonsIn.value,
          child: Transform.translate(
            offset: Offset(0.0, 100 * ( 1 - _animationButtonsIn.value )),
            child: Column(
              children: [
                BatmanButton(text: 'LOGIN', left: false),
                SizedBox(height: 20),
                BatmanButton(text: 'SIGN UP', onTap: onTap),
              ],
            ),
          ),
        ));
  }
}