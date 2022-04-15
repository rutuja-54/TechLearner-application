//import 'dart:html';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:on_learning/screens/landing_page.dart';
import 'package:on_learning/screens/my_list.dart';
//import 'package:on_learning/screens/splash_screen.dart';
import 'package:on_learning/services/authentication.dart';
import 'package:on_learning/services/storage.dart';
import 'package:page_transition/page_transition.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Authentication authentication = Authentication();
  SecureStorage secureStorage = SecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                await authentication.googleSignOut().whenComplete(() {
                  secureStorage.deleteSecureData('email');
                }).whenComplete(() {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const LandingPage(),
                          type: PageTransitionType.bottomToTop));
                });
              },
              icon: const Icon(EvaIcons.logOut),
            )
          ],
          backgroundColor: Colors.purple,
          title: const Text(
            'Account',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300.0,
                  width: 400.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Rutuja Ghatttuwar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              EvaIcons.google,
                              color: Colors.black,
                            ),
                            Text(
                              'rutujaghattuwar05@gmail.com',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: MaterialButton(
                          onPressed: () {},
                          child: const Text(
                            'Become an instructor',
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Text(
                  'Video preference',
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
                const ListTile(
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  title: Text(
                    'Download option',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ),
                const ListTile(
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  title: Text(
                    'Video Playback Options',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ),
                const Text(
                  'Account Settings',
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
                const ListTile(
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  title: Text(
                    'Account Security',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ),
                const ListTile(
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  title: Text(
                    'Email Notification preference',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ),
                const ListTile(
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  title: Text(
                    'Learning Remainder',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ),
                const Text(
                  'Support',
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
                const ListTile(
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  title: Text(
                    'About TechLearner App',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ),
                const ListTile(
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  title: Text(
                    'About TechLearner For business',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ),
                const ListTile(
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  title: Text(
                    'FAQs',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ),
                const ListTile(
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  title: Text(
                    'Share the TechLearner App',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ),
                const Text(
                  'Diagonostics',
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
                const ListTile(
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  title: Text(
                    'Status',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ),
                Center(
                  child: MaterialButton(
                    onPressed: () async {
                      await authentication.googleSignOut().whenComplete(() {
                        secureStorage.deleteSecureData('email');
                      }).whenComplete(() {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: const LandingPage(),
                                type: PageTransitionType.bottomToTop));
                      });
                    },
                    child: const Text(
                      'Sign out',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
