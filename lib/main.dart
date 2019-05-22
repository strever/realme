import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'Home.dart';

void main() {

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  return runApp(RealMeApp());
}

class RealMeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Private Zone',
      home: HomePage(),
    );
  }
}
