import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:on_learning/services/authentication.dart';
import 'package:on_learning/services/sign_in.dart';
import 'package:page_transition/page_transition.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () async {
                      await authentication.googleSignIn();
                    },
                    icon: const Icon(EvaIcons.google),
                    label: const Text('Sign in With Google')),
              ),
              //Padding(
              //padding: const EdgeInsets.only(bottom: 15.0),
              //child: FlatButton.icon(
              //color: Colors.white,
              //onPressed: () {
              //print('Google Sign In....');
              //},
              //icon: const Icon(EvaIcons.facebook),
              //label: const Text('Sign In With Facebook')),
              //),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: FlatButton.icon(
                    color: Colors.white,
                    height: 45,
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
                      'Allready have an account?',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: const SignIn(),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
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
            //Color(0xFF000080),
            //Color(0xFF5B16D0),
            //Color(0xFF5036D5),
            //Color(0xFF000080),
            //],
            //begin: Alignment.topCenter,
            //end: Alignment.bottomCenter,
            //stops: [0.1, 0.4, 0.8, 1],
            //),
            image: DecorationImage(
                image: AssetImage('assets/images/img1.png'),
                fit: BoxFit.fitWidth,
                colorFilter:
                    ColorFilter.mode(Colors.transparent, BlendMode.lighten))),
      ),
    );
  }
}
