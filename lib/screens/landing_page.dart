//import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:on_learning/screens/home_screen.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:on_learning/screens/homescreens/featured.dart';
//import 'package:on_learning/screens/homescreens/search.dart';
import 'package:on_learning/services/sign_in.dart';
import 'package:page_transition/page_transition.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xfff4f6fd),
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Hello TechLearners",
                  style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/profilePic.png'))),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'What do you \nwant to \nlearn today?',
              style: TextStyle(
                  fontSize: 35, height: 1.3, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          courseWidget('Multimedia', 'Animation Course', 'img1',
                              const Color(0xffff6a65), const Color(0xffff5954)),
                          const SizedBox(
                            height: 20,
                          ),
                          courseWidget(
                              'Social Media',
                              'Social Media Monitoring',
                              'img2',
                              const Color(0xffe9eefa),
                              Colors.white),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const SizedBox(
                            height: 50,
                          ),
                          courseWidget('Programming', 'Python for everybody',
                              'img3', const Color(0xffe9eefa), Colors.white),
                          const SizedBox(
                            height: 20,
                          ),
                          courseWidget(
                              'Graphic Design',
                              'Fundamentals of Design',
                              'img4',
                              const Color(0xffbdcddf),
                              const Color(0xffcedaff)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        color: Colors.purple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                side: const BorderSide(width: 2, color: Colors.purple),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const SignIn(),
                        type: PageTransitionType.bottomToTop));
              },
              child: Text('Log In',
                  style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                side: const BorderSide(width: 3, color: Colors.purple),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const SignIn(),
                        type: PageTransitionType.bottomToTop));
              },
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container courseWidget(String category, String title, String img,
      Color categoryColor, Color bgColor) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              PageTransition(
                  child: const HomeScreen(), type: PageTransitionType.fade));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: categoryColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                category,
                style: TextStyle(
                    color: (categoryColor == Color(0xffe9eefa)
                        ? Color(0xff2657ce)
                        : Colors.white)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                color: (bgColor == Color(0xffff5954))
                    ? Colors.white
                    : Colors.black,
                fontSize: 20,
                height: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 5,
                  width: 100,
                  color: (bgColor == Color(0xffff5954))
                      ? Colors.red
                      : Color(0xff2657ce),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    color: (bgColor == Color(0xffff5954))
                        ? Colors.white.withOpacity(0.5)
                        : Color(0xff2657ce).withOpacity(0.5),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Hero(
              tag: '$img',
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/$img.png'),
                )),
              ),
            )
          ],
        ),
      ),
      //bottomNavigationBar: BottomAppBar(
      //shape: const CircularNotchedRectangle(),
      //notchMargin: 4.0,
      //color: Colors.purple,
      //child: Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //children: [
      //OutlinedButton(
      //style: OutlinedButton.styleFrom(
      //shape: const StadiumBorder(),
      //side: const BorderSide(width: 2, color: Colors.purple),
      //),
      //onPressed: () {
      //Navigator.pushReplacement(
      //context,
      //PageTransition(
      //child: const SignIn(),
      //type: PageTransitionType.bottomToTop));
      //},
      //child: Text('Log In',
      //style: TextStyle(
      //color: Colors.grey.shade300,
      //fontSize: 20.0,
      //fontWeight: FontWeight.bold)),
      //),
      //OutlinedButton(
      //style: OutlinedButton.styleFrom(
      //shape: const StadiumBorder(),
      //side: const BorderSide(width: 3, color: Colors.purple),
      //),
      //onPressed: () {
      //Navigator.pushReplacement(
      //context,
      //PageTransition(
      //child: const SignIn(),
      //type: PageTransitionType.bottomToTop));
      //},
      //child: Text(
      //'Sign In',
      //style: TextStyle(
      //color: Colors.grey.shade300,
      //fontSize: 20.0,
      //fontWeight: FontWeight.bold,
      //),
      //),
      //),
      //],
      //),
      //),
    );
  }
}
