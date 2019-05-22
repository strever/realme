import 'package:flutter/cupertino.dart';
import 'package:realme/list.dart';
import 'package:realme/markdown.dart';

CupertinoTabScaffold dock = CupertinoTabScaffold(
  tabBar: CupertinoTabBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          title: Text('M|'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.heart),
          title: Text('M|'),
        ),
      ],
  ),
  tabBuilder: (context, tabIndex) {
    switch(tabIndex) {
      case 0:
        return CupertinoTabView(
          builder: (context) {
            return markdown;
          },
        );
      case 1:
        return CupertinoTabView(
          builder: (context) {
            return MyApp();
          },
        );
    }
  },
);