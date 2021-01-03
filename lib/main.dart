import 'package:flutter/material.dart';
import 'Screens/MyHomePage.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track COVID',
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        canvasColor: Color(0xff202029),
        // canvasColor: Color.fromRGBO(13, 0, 26, 1),
        accentColor: Colors.deepPurpleAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
