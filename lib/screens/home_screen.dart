import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_learning/screens/homescreens/account.dart';
import 'package:on_learning/screens/homescreens/featured.dart';
import 'package:on_learning/screens/homescreens/my_course.dart';
import 'package:on_learning/screens/homescreens/search.dart';
import 'package:on_learning/screens/homescreens/wishlist.dart';
import 'package:on_learning/screens/my_list.dart';
import 'package:on_learning/services/data_controller.dart';
//import 'package:on_learning/screens/homescreens/wishllist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  DataController dataController = Get.put(DataController());
  int currentIndex = 0;
  void onTap(int page) {
    setState(() {
      currentIndex = page;
    });
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Scaffold(
        //appBar: AppBar(),
        body: PageView(
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          controller: pageController,
          children: const [
            Featured(),
            Search(),
            MyList(),
            Wishlist(),
            Account()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          backgroundColor: Colors.purple,
          selectedIconTheme: const IconThemeData(color: Colors.black),
          unselectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          unselectedItemColor: Colors.white,
          iconSize: 26.0,
          selectedItemColor: Colors.black,
          selectedFontSize: 16.0,
          unselectedFontSize: 12.0,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Features',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_rounded), label: 'My course'),
            BottomNavigationBarItem(
                icon: Icon(EvaIcons.heartOutline), label: 'Wishlist'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: 'Account')
          ],
        ),
      ),
    );
  }
}
