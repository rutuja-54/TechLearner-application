import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_learning/screens/landing_page.dart';
//import 'package:on_learning/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fudmay',
      theme: ThemeData(
        //primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcc0099),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: const Text(
                    "TechLearner",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        height: 1),
                  ),
                ),
                Container(
                  child: const Text(
                    "Online learning is not the next",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        height: 1),
                  ),
                ),
                Container(
                  child: const Text(
                    "big thing,",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        height: 1),
                  ),
                ),
                Container(
                  child: const Text(
                    "it is now the",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        height: 1),
                  ),
                ),
                Container(
                  child: const Text(
                    "BIG THING,",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        height: 1),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/splash.png'),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      openLandingPage();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: const Text(
                        'Continue...',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void openLandingPage() {
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: const LandingPage(), type: PageTransitionType.bottomToTop));
  }
}
