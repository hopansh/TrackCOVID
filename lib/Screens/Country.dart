import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Country extends StatelessWidget {
  final int index;
  final List data;
  Country({@required this.index, @required this.data});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(data[index]['country'].toString()),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
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
                      height: 15,
                    ),
                    ListTile(
                      title: Text(
                        "Total Cases",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      subtitle: Text(
                        data[index]['cases'].toString(),
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 40,
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
                        color: Colors.white,
                        fontSize: width * 0.04,
                      ),
                    ),
                    subtitle: Text(
                      data[index]['deaths'].toString(),
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
                      data[index]['deaths'].toString(),
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
}
