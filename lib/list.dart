import 'package:flutter/material.dart';
import 'random_state.dart';
import 'package:flutter/cupertino.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'list demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: RandomWords(),
    );
  }
}
