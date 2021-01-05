import 'package:flutter/material.dart';
import 'Screens/MyHomePage.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_admob/firebase_admob.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: "ca-app-pub-7239841158106431/6223124814",
      size: AdSize.banner,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  await Firebase.initializeApp();
  FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
  createBannerAd()
    ..load()
    ..show(anchorOffset: 75);
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
      title: 'Track Count',
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
