//import 'dart:js_util';
//import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:on_learning/screens/detailsection/detail_one.dart';
import 'package:on_learning/screens/detailsection/detail_screen.dart';
import 'package:on_learning/screens/my_list.dart';
import 'package:on_learning/services/data_controller.dart';

class Featured extends StatefulWidget {
  const Featured({Key? key}) : super(key: key);

  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/images/download.png'))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80.0,
                  width: 400.0,
                  color: Colors.blueAccent,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Courses now on sale',
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                        ),
                        Text(
                          '2 Days Left',
                          style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Feactured',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 300.0,
                width: 400.0,
                child: GetBuilder<DataController>(
                  init: DataController(),
                  builder: (value) {
                    return FutureBuilder(
                      future: value.getData('courses'),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                          ));
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(const DetailScreen(),
                                      transition:
                                          Transition.leftToRightWithFade,
                                      arguments: snapshot.data[index]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 100.0,
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fitWidth,
                                                image: NetworkImage(snapshot
                                                    .data[index]
                                                    .data()['image']))),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 200.0),
                                          child: Text(
                                            snapshot.data[index]
                                                .data()['title'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Text(
                                          snapshot.data[index].data()['author'],
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            EvaIcons.star,
                                            color: Colors.yellow,
                                          ),
                                          const Icon(
                                            EvaIcons.star,
                                            color: Colors.yellow,
                                          ),
                                          const Icon(
                                            EvaIcons.star,
                                            color: Colors.yellow,
                                          ),
                                          const Icon(
                                            EvaIcons.star,
                                            color: Colors.yellow,
                                          ),
                                          const Icon(
                                            EvaIcons.star,
                                            color: Colors.yellow,
                                          ),
                                          Text(
                                            snapshot.data[index]
                                                .data()['ratings'],
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.0),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              ('(${snapshot.data[index].data()['enrolled']})'),
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.rupeeSign,
                                              color: Colors.black38,
                                            ),
                                            Text(
                                              snapshot.data[index]
                                                  .data()['price'],
                                              style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.deepPurple,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Bestseller',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Top Courses ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 300.0,
                width: 400.0,
                child: GetBuilder<DataController>(
                  init: DataController(),
                  builder: (value) {
                    return FutureBuilder(
                      future: value.getData('top'),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                          ));
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(const DetailOne(),
                                      transition:
                                          Transition.leftToRightWithFade,
                                      arguments: snapshot.data[index]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 100.0,
                                        width: 200.0,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fitWidth,
                                                image: NetworkImage(snapshot
                                                    .data[index]
                                                    .data()['image']))),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 240.0),
                                          child: Text(
                                            snapshot.data[index]
                                                .data()['title'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Text(
                                          snapshot.data[index].data()['author'],
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            EvaIcons.star,
                                            color: Colors.yellow,
                                          ),
                                          const Icon(
                                            EvaIcons.star,
                                            color: Colors.yellow,
                                          ),
                                          const Icon(
                                            EvaIcons.star,
                                            color: Colors.yellow,
                                          ),
                                          const Icon(
                                            EvaIcons.star,
                                            color: Colors.yellow,
                                          ),
                                          const Icon(
                                            EvaIcons.star,
                                            color: Colors.yellow,
                                          ),
                                          Text(
                                            snapshot.data[index]
                                                .data()['ratings'],
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.0),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              ('(${snapshot.data[index].data()['enrolled']})'),
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.rupeeSign,
                                              color: Colors.black38,
                                            ),
                                            Text(
                                              snapshot.data[index]
                                                  .data()['price'],
                                              style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Trending',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 300.0,
                width: 400.0,
                child: GetBuilder<DataController>(
                  init: DataController(),
                  builder: (value) {
                    return FutureBuilder(
                      future: value.getData('Trending'),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                          ));
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100.0,
                                      width: 200.0,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fitWidth,
                                              image: NetworkImage(snapshot
                                                  .data[index]
                                                  .data()['image']))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                            maxWidth: 240.0),
                                        child: Text(
                                          snapshot.data[index].data()['title'],
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        snapshot.data[index].data()['author'],
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          EvaIcons.star,
                                          color: Colors.yellow,
                                        ),
                                        const Icon(
                                          EvaIcons.star,
                                          color: Colors.yellow,
                                        ),
                                        const Icon(
                                          EvaIcons.star,
                                          color: Colors.yellow,
                                        ),
                                        const Icon(
                                          EvaIcons.star,
                                          color: Colors.yellow,
                                        ),
                                        const Icon(
                                          EvaIcons.star,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          snapshot.data[index]
                                              .data()['ratings'],
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            ('(${snapshot.data[index].data()['enrolled']})'),
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.rupeeSign,
                                            color: Colors.black38,
                                          ),
                                          Text(
                                            snapshot.data[index]
                                                .data()['price'],
                                            style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Get.to(const MyList());
              },
              icon: const Icon(EvaIcons.shoppingBag),
            )
          ],
          title: const Text('All Courses'),
          backgroundColor: Colors.purple,
        ));
  }
}
