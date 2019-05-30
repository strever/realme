import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realme/markdown_list.dart';
import 'package:realme/markdown.dart';

CupertinoTabScaffold cupertinoDockWidget = CupertinoTabScaffold(
  tabBar: CupertinoTabBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book_solid),
          title: Text('Notes'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.pen),
          title: Text('M↓'),
        ),
      ],
  ),
  tabBuilder: (context, tabIndex) {
    switch(tabIndex) {
      case 0:
        return CupertinoTabView(
          builder: (context) {
            return MarkdownListWidget();
          },
        );
      case 1:

        return CupertinoTabView(
          builder: (context) {
            return MarkdownWidget();
          },
        );
    }
  },
);