import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_learning/screens/detailsection/detail_screen.dart';

import 'package:on_learning/services/data_controller.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  late AsyncSnapshot snapshot;
  bool isExcecuted = false;
  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(const DetailScreen(),
                  transition: Transition.downToUp,
                  arguments: snapshot.data[index]);
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(snapshot.data[index].data()['image']),
              ),
              title: Text(
                snapshot.data[index].data()['title'],
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
              //subtitle: Text(
              //snapshotData.docs[index].data()['author'],
              //style: const TextStyle(
              //color: Colors.black,
              //fontWeight: FontWeight.bold,
              //fontSize: 24.0),
              //),
            ),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.clear),
        onPressed: () {
          setState(() {
            isExcecuted = false;
          });
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          GetBuilder<DataController>(
            init: DataController(),
            builder: (val) {
              return IconButton(
                onPressed: () {
                  val.queryData(searchController.text).then((value) {
                    snapshot = value;
                    setState(() {
                      isExcecuted = true;
                    });
                  });
                },
                icon: const Icon(Icons.search),
              );
            },
          )
        ],
        title: TextField(
          style: const TextStyle(color: Colors.black),
          decoration: const InputDecoration(
              hintText: 'Search Courses',
              hintStyle: TextStyle(color: Colors.black)),
          controller: searchController,
        ),
        backgroundColor: Colors.white,
      ),
      body: isExcecuted
          ? searchedData()
          : const Center(
              child: Text('Search Any Courses',
                  style: TextStyle(color: Colors.black, fontSize: 30.0)),
            ),
    );
  }
}
