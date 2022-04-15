import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:on_learning/screens/detailsection/detail_screen.dart';
import 'package:on_learning/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const HomeScreen(),
                      type: PageTransitionType.fade));
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            )),
        backgroundColor: Colors.purple,
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
