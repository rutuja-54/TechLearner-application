//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
//import 'package:on_learning/screens/detailsection/detail_screen.dart';
import 'package:on_learning/screens/my_list.dart';
import 'package:on_learning/services/data_controller.dart';
import 'package:page_transition/page_transition.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text(
            'Wishlist',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const MyList(), type: PageTransitionType.fade));
              },
              icon: const Icon(
                EvaIcons.shoppingBag,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: GetBuilder<DataController>(
            init: DataController(),
            builder: (value) {
              return FutureBuilder(
                  future: value.getData('yourwishlist'),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Row(children: [
                                  Column(
                                    children: [
                                      Container(
                                          height: 70.0,
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                      .data[index]
                                                      .data()['image']),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 285.0),
                                          child: Text(
                                              snapshot.data[index]
                                                  .data()['title'],
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                              )),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                              snapshot.data[index]
                                                  .data()['author'],
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Row(
                                            children: [
                                              const Icon(EvaIcons.starOutline,
                                                  color: Colors.yellow,
                                                  size: 16),
                                              const Icon(EvaIcons.starOutline,
                                                  color: Colors.yellow,
                                                  size: 16),
                                              const Icon(EvaIcons.starOutline,
                                                  color: Colors.yellow,
                                                  size: 16),
                                              const Icon(EvaIcons.starOutline,
                                                  color: Colors.yellow,
                                                  size: 16),
                                              const Icon(EvaIcons.starOutline,
                                                  color: Colors.yellow,
                                                  size: 16),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 4.0),
                                                child: Text(
                                                  snapshot.data[index]
                                                      .data()['ratings'],
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade600,
                                                      fontSize: 16.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                FontAwesomeIcons.rupeeSign,
                                                color: Colors.white,
                                                size: 16.0,
                                              ),
                                              Text(
                                                snapshot.data[index]
                                                    .data()['price'],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                              ));
                        },
                      );
                    }
                  });
            }));
  }
}
