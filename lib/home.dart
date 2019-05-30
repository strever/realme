import 'package:flutter/material.dart';
import 'package:realme/layouts/dock.dart';

import 'layouts/cupertino_dock.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M↓',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MaterialDockWidget(),
    );
  }

}