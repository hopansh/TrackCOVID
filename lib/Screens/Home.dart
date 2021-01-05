import 'package:TrackCount/Screens/Country.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data, data2;
  static int total = 0, recovered = 0, death = 0;
  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://corona.lmao.ninja/v2/countries?today&sort"),
    );

    setState(() {
      data = json.decode(response.body);
    });
    return "Success";
  }

  Future<String> gettotal() async {
    var response = await http.get(
      Uri.encodeFull("https://corona.lmao.ninja/v2/continents?today=true&sort"),
    );

    setState(() {
      data2 = json.decode(response.body);
      total = 0;
      death = 0;
      recovered = 0;
      for (int j = 0; j < data2.length; j++) {
        total = total + data2[j]['cases'];
        death = death + data2[j]['deaths'];
        recovered = recovered + data2[j]['recovered'];
      }
    });

    return "Success";
  }

  Widget getList() {
    if (data == null || data.length < 1) {
      return Container(
        child: Center(
          child: Text("Please wait..."),
        ),
      );
    }
    return ListView.builder(
      itemCount: data?.length,
      itemBuilder: (BuildContext context, int index) {
        return getListItem(index);
      },
    );
  }

  Widget getListItem(int i) {
    if (data == null || data.length < 1) return null;
    if (i == 0) {
      return ListTile(
        leading: Icon(
          Icons.flag,
          color: Colors.white,
        ),
        title: Text(
          'Country',
          style: TextStyle(color: Colors.white),
        ),
        trailing: Text(
          'Total Cases',
          style: TextStyle(color: Colors.amberAccent),
        ),
      );
    }

    return ListTile(
      leading: Image.network(
        data[i]['countryInfo']['flag'],
        fit: BoxFit.scaleDown,
        height: 20,
        width: 30,
      ),
      title: Text(
        data[i]['country'],
        style: TextStyle(color: Colors.white),
      ),
      trailing: Text(
        data[i]['cases'].toString(),
        style: TextStyle(color: Colors.amberAccent),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (contex) => Country(
                      index: i,
                      data: this.data,
                    )));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
    gettotal();
  }

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        height: height * 0.01,
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
                          total.toString(),
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: height * 0.06,
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
                        death.toString(),
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
                        recovered.toString(),
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: width * 0.065,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: height * 0.48,
                decoration: BoxDecoration(
                    color: Color(0xff707089),
                    borderRadius: BorderRadius.circular(20)),
                child: getList(),
              )
            ],
          ),
        ));
  }
}
