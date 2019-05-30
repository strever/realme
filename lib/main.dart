import 'package:flutter/cupertino.dart';

import 'home.dart';

void main() {

//  SystemChrome.setPreferredOrientations([
//    DeviceOrientation.portraitUp,
//    DeviceOrientation.portraitDown
//  ]);

  return runApp(MarkdownNoteApp());
}

class MarkdownNoteApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Markdown Note',
      home: HomePage(),
    );
  }
}
