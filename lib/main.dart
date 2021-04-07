import 'package:batman_app/batman_city.dart';
import 'package:batman_app/batman_screen_buttons.dart';
import 'package:batman_app/batman_screen_signup.dart';
import 'package:batman_app/batman_screen_title.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BatmanApp());
}

class BatmanApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Batman App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // fontFamily: 'Gotham'
      ),
      home: BatmanScreen(),
    );
  }
}

class BatmanScreen extends StatefulWidget {
  @override
  _BatmanScreenState createState() => _BatmanScreenState();
}

class _BatmanScreenState extends State<BatmanScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animationLogoIn;
  Animation<double> _animationLogoMovementUp;
  Animation<double> _animationBatmanIn;
  Animation<double> _animationButtonsIn;
  Animation<double> _animationBackgroundIn;

  AnimationController _animationControllerSignUp;
  Animation<double> _animationLogoOut;
  Animation<double> _animationBatmanUp;
  Animation<double> _animationBatmanCity;
  Animation<double> _animationSignUpIn;

  void _setupFirstAnimations() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animationLogoIn = Tween(begin: 30.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.25),
      ),
    );
    _animationLogoMovementUp = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.35, 0.60),
    );
    _animationBatmanIn = Tween(begin: 4.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.75, 1),
      ),
    );
    _animationButtonsIn = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.75, 1),
    );
    _animationBackgroundIn = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.75, 1),
    );
    _animationController.forward();
  }

  void _setupSecondAnimations() {
    _animationControllerSignUp =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    _animationLogoOut = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(0.0, 0.20),
    );
    _animationBatmanUp = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(0.35, 0.50),
    );
    _animationBatmanCity = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(0.60, 0.75),
    );
    _animationSignUpIn = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(0.60, 0.75),
    );
  }

  void _onSignUp() {
    _animationControllerSignUp.forward(from: 0.0);
  }

  @override
  void initState() {
    _setupFirstAnimations();
    _setupSecondAnimations();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerSignUp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => {
      //   _animationController.forward(from: 0.0),
      // },
      child: AnimatedBuilder(
        animation: Listenable.merge(
            [_animationController, _animationControllerSignUp]),
        builder: (BuildContext context, _) {
          return Scaffold(
              backgroundColor: Color(0xFF100F0B),
              body: Stack(
                children: [
                  Positioned(
                      top: -400 * (1 - _animationBackgroundIn.value),
                      right: 0,
                      left: 0,
                      child: Image.asset(
                        'assets/images/batman_background.png',
                        fit: BoxFit.contain,
                      )),
                  Positioned(
                      top: 10,
                      right: -20,
                      width: MediaQuery.of(context).size.width + 40,
                      child: Transform.translate(
                        offset: Offset(
                            0.0,
                            30.0 * _animationLogoOut.value -
                                _animationBatmanUp.value * 30.0),
                        child: Transform.scale(
                          scale: _animationBatmanIn.value,
                          child: Image.asset(
                            'assets/images/batman_alone.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      )),
                  Positioned(
                      top: 250,
                      right: 0,
                      left: 0,
                      child: Transform.translate(
                        offset: Offset(
                            0.0,
                            30.0 * _animationLogoOut.value -
                                _animationBatmanUp.value * 30.0),
                        child: Transform.scale(
                          scale: _animationBatmanIn.value,
                          child: BatmanCity(_animationBatmanCity),
                        ),
                      )),
                  Positioned(
                      top: MediaQuery.of(context).size.width - 30,
                      right: 0,
                      left: 0,
                      child: Column(children: [
                        Transform.translate(
                          offset: Offset(0.0, 80.0 * _animationLogoOut.value),
                          child: Transform.translate(
                              offset:
                                  Offset(0.0, 60.0 * _animationLogoOut.value),
                              child: Opacity(
                                  opacity: 1 - _animationLogoOut.value,
                                  child: BatmanScreenTitle(
                                      _animationLogoMovementUp))),
                        ),
                        SizedBox(height: 100),
                        Transform.translate(
                            offset: Offset(0.0, 80.0 * _animationLogoOut.value),
                            child: Opacity(
                              opacity: 1 - _animationLogoOut.value,
                              child: BatmanScreenButtons(
                                _animationButtonsIn,
                                _onSignUp,
                              ),
                            )),
                      ])),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.7,
                    left: 0,
                    right: 0,
                    child: Container(
                        child: BatmanScreenSignUp(_animationSignUpIn)),
                  ),
                  Positioned(
                      top: 370 - 70 * _animationLogoMovementUp.value,
                      right: 0,
                      left: 0,
                      child: Opacity(
                        opacity: (1 - _animationLogoOut.value),
                        child: Transform.scale(
                            scale: _animationLogoIn.value,
                            child: Image.asset(
                              'assets/images/batman_logo.png',
                              height: 70,
                              fit: BoxFit.contain,
                            )),
                      )),
                ],
              ));
        },
      ),
    );
  }
}
