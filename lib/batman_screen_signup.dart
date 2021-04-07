import 'package:batman_app/batman_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BatmanScreenSignUp extends AnimatedWidget {
  const BatmanScreenSignUp(
    Animation animation,
  ) : super(listenable: animation);
  Animation get _animationSignUpIn => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Opacity(
          opacity: _animationSignUpIn.value,
          child: Transform.translate(
            offset: Offset(0.0, 100 * (1 - _animationSignUpIn.value)),
            child: Column(
              children: [
                Text(
                  'GET ACCESS',
                  style: GoogleFonts.vidaloka(
                    textStyle: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
                SizedBox(height: 40),
                _BatmanInput(label: "Email"),
                SizedBox(height: 20),
                _BatmanInput(label: "Password", password: true),
                SizedBox(height: 20),
                BatmanButton(text: 'SIGN UP', onTap: () => {}),
              ],
            ),
          ),
        ));
  }
}

class _BatmanInput extends StatelessWidget {
  final String label;
  final bool password;

  const _BatmanInput({Key key, this.label, this.password = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.5));
    return TextField(
      decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
          enabledBorder: border,
          border: border,
          suffixIcon: password
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Image.asset(
                      'assets/images/batman_logo.png',
                      height: 15,
                      fit: BoxFit.contain,
                      color: Colors.white,
                    ),
                  ),
                )
              : null),
    );
  }
}
