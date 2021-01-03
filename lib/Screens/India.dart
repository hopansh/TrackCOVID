import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:firebase_admob/firebase_admob.dart';

class India extends StatefulWidget {
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  Map<String, dynamic> data;
  String name = '', totalcase = '', deaths = '', recovered = '';
  // InterstitialAd _interstitialAd;
  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull(
          "https://corona.lmao.ninja/v2/countries/india?today=true&strict=true&query"),
      // headers: {"Accept": "application/json"}
    );

    setState(() {
      data = json.decode(response.body);
      name = data['country'].toString();
      totalcase = data['cases'].toString();
      deaths = data['deaths'].toString();
      recovered = data['recovered'].toString();
    });
    return "Success";
  }

  @override
  void initState() {
    // FirebaseAdMob.instance.initialize(appId: BannerAd.testAdUnitId);
    // //Change appId With Admob Id
    // _interstitialAd = createInterstitialAd()
    //   ..load()
    //   ..show();
    super.initState();
  }

  @override
  void dispose() {
    // _interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: null,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: Color(0xff808099),
                    borderRadius: BorderRadius.circular(10)),
                height: height * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateTime.now().toString().substring(0, 19),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    ListTile(
                      title: Text(
                        "Total Cases",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.03,
                        ),
                      ),
                      subtitle: Text(
                        totalcase,
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: height * 0.05,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: height * 0.1,
                  width: width / 2.2,
                  decoration: BoxDecoration(
                      color: Color(0xff808099),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(
                      "Deaths",
                      style: TextStyle(
                          color: Colors.white, fontSize: width * 0.04),
                    ),
                    subtitle: Text(
                      deaths,
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: width * 0.065,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.1,
                  width: width / 2.2,
                  decoration: BoxDecoration(
                      color: Color(0xff808099),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(
                      "Recovered",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.04,
                      ),
                    ),
                    subtitle: Text(
                      recovered,
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: width * 0.065,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  //   keywords: <String>['Maths', 'calculator', 'booth', 'boothalgorithm'],
  //   contentUrl: 'https://flutter.io',
  //   childDirected: false,
  //   testDevices: <String>[], // Android emulators are considered test devices
  // );
  // InterstitialAd createInterstitialAd() {
  //   return InterstitialAd(
  //       adUnitId: 'ca-app-pub-7239841158106431/9366085489',
  //       //Change Interstitial AdUnitId with Admob ID
  //       targetingInfo: targetingInfo,
  //       listener: (MobileAdEvent event) {
  //         print("IntersttialAd $event");
  //       });
  // }
}
