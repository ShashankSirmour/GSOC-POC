import 'package:gsoc/pages/main/screen/bookmark.dart';
import 'package:gsoc/pages/main/screen/near_me.dart';
import 'package:gsoc/pages/main/screen/search.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key key,
  }) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String projectCode = '2';

  Color iconcolor = Colors.black54;
  int currentIndex;

  Widget bookmarkScreen;
  Widget nearMeScreen;
  Widget searchScreen;
  Widget currentScreen;

  @override
  void initState() {
    searchScreen = SearchScreen();
    bookmarkScreen = BookmarkScreen();
    nearMeScreen = NearMeScreen();
    currentIndex = 0;
    currentScreen = searchScreen;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return mainPageBuilder();
  }

  Widget mainPageBuilder() {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 0) {
            setState(() {
              currentIndex = index;
              currentScreen = searchScreen;
            });
          } else if (index == 1) {
            setState(() {
              currentIndex = index;
              currentScreen = bookmarkScreen;
            });
          } else if (index == 2) {
            setState(() {
              currentIndex = index;
              currentScreen = bookmarkScreen;
            });
          }
        },
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        elevation: 8,
        hasInk: true,
        inkColor: Colors.black12,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.search,
                color: iconcolor,
              ),
              activeIcon: Icon(
                Icons.search,
                color: Colors.indigo,
              ),
              title: Text("Search")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.bookmark_border,
                color: iconcolor,
              ),
              activeIcon: Icon(
                Icons.bookmark,
                color: Colors.indigo,
              ),
              title: Text("Bookmarks")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.near_me,
                color: iconcolor,
              ),
              activeIcon: Icon(
                Icons.near_me,
                color: Colors.indigo,
              ),
              title: Text("Near Me"))
        ],
      ),
      body: currentScreen,
    );
  }
}
