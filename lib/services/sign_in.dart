import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:on_learning/screens/home_screen.dart';
import 'package:on_learning/services/authentication.dart';
import 'package:on_learning/services/sign_up.dart';
import 'package:page_transition/page_transition.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Authentication authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 200.0),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () async {
                      await authentication.googleSignIn();
                    },
                    icon: const Icon(EvaIcons.google),
                    label: const Text('Sign in With Email')),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(
                      width: 180.0,
                      child: Divider(color: Colors.white),
                    ),
                    Text('or', style: TextStyle(color: Colors.white)),
                    SizedBox(
                      width: 150.0,
                      child: Divider(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () async {
                      await authentication.googleSignIn().whenComplete(() {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: const HomeScreen(),
                                type: PageTransitionType.bottomToTop));
                      });
                    },
                    icon: const Icon(EvaIcons.google),
                    label: const Text('Sign in With Google')),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () {
                      print('Google Sign In....');
                    },
                    icon: const Icon(EvaIcons.facebook),
                    label: const Text('Sign In With Facebook')),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () {
                      print('Google Sign In....');
                    },
                    icon: const Icon(FontAwesomeIcons.apple),
                    label: const Text('Sign in With Apple')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: Row(
                  children: [
                    const Text(
                      'New Here.?',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: const SignUp(),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: const Text(
                        'Create an account',
                        style: TextStyle(color: Colors.black, fontSize: 18.00),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        decoration: const BoxDecoration(
            color: Color(0xffcc0099),
            //gradient: LinearGradient(
            //colors: [
            //Color(0xFF013BC5),
            //Color(0xFF5B16D0),
            //Color(0xFF5036D5),
            //Color(0xFF013BC5),
            //],
            //begin: Alignment.topCenter,
            //end: Alignment.bottomCenter,
            //stops: [0.1, 0.4, 0.8, 1],
            //),
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/img2.png',
                ),
                fit: BoxFit.fitWidth,
                colorFilter:
                    ColorFilter.mode(Colors.transparent, BlendMode.lighten))),
      ),
    );
  }
}
