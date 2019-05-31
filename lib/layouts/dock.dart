import 'package:flutter/material.dart';
//import 'package:realme/layouts/future_builder.dart';
import 'package:realme/markdown_list.dart';
import 'package:realme/markdown.dart';

class MaterialDockWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialDockState();
  }


}

class _MaterialDockState extends State<MaterialDockWidget> {
  int _currentTabIndex = 0;

  List _bodyWidgets = [
    MarkdownListWidget(),
    MarkdownWidget(),
    MarkdownListWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidgets[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text('Notes')),
        BottomNavigationBarItem(icon: Icon(Icons.edit), title: Text('M↓')),
        BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search'),),
      ],
        currentIndex: _currentTabIndex,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        },),
    );
  }

}