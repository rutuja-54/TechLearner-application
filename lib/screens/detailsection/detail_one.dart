import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_learning/screens/detailsection/detail_screen.dart';
import 'package:on_learning/services/payment_gateway.dart';
import 'package:on_learning/services/video_player.dart';

class DetailOne extends StatefulWidget {
  const DetailOne({Key? key}) : super(key: key);

  @override
  State<DetailOne> createState() => _DetailOneState();
}

class _DetailOneState extends State<DetailOne> {
  get controller => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Course Detail'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              EvaIcons.share,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              EvaIcons.shoppingBag,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              Text(
                Get.arguments['title'],
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  Get.arguments['Description'],
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.black)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  Get.arguments['ratings'],
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.black)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  EvaIcons.people,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  '${Get.arguments['enrolled']}Enrolled',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.black)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  EvaIcons.clock,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  '${Get.arguments['hours']} total hours',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  EvaIcons.award,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  'Created By ${Get.arguments['author']}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.black)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    '${Get.arguments['language']}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.black)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    EvaIcons.calendar,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    'Updated ${Get.arguments['date']}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.dialog(VideoDisplay(
                    videoUrl: Get.arguments['trailer'],
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 300.0,
                    width: 400.0,
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 200.0,
                            width: 400.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(Get.arguments['image']),
                                    fit: BoxFit.cover,
                                    colorFilter: const ColorFilter.mode(
                                        Colors.black45, BlendMode.darken))),
                          ),
                          const Positioned(
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 100.0,
                            ),
                            top: 50.0,
                            left: 140.0,
                          ),
                          const Positioned(
                            child: Text(
                              'Preview this course',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0),
                            ),
                            top: 150.0,
                            left: 80.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GetBuilder<PaymentGateway>(
                init: PaymentGateway(),
                builder: (value) {
                  return GestureDetector(
                    onTap: () {
                      value.dispatchPayment(1000, 'Rutuja', 8888888888,
                          'test@gmail.com', 'GooglePay');
                    },
                    child: Container(
                      width: 200.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(200.0)),
                      child: const Center(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: Colors.grey.shade300),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        FirebaseFirestore.instance.collection('wishlist').add({
                          'title': Get.arguments['title'],
                          'image': Get.arguments['image'],
                          'author': Get.arguments['author'],
                          'ratings': Get.arguments['ratings'],
                          'price': Get.arguments['price'],
                        }).whenComplete(() {
                          Get.snackbar('Hurray',
                              '${Get.arguments['title']} is added to Wishlist',
                              colorText: Colors.black,
                              snackPosition: SnackPosition.BOTTOM);
                        });
                      },
                      child: Container(
                        width: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.grey.shade300),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Add to Wishlist',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
