import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_covid19/dataSource.dart';
import 'package:flutter_covid19/pages/countryPage.dart';
import 'package:flutter_covid19/panels/indonesiapanel.dart';
import 'package:flutter_covid19/panels/infopanel.dart';
import 'package:flutter_covid19/panels/mosteffectedcountries.dart';
import 'package:flutter_covid19/panels/worldwidepanel.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;
  fetchWorldWidrData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v3/covid-19/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List dataCountries;
  fetchDataCountries() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v3/covid-19/countries');
    setState(() {
      dataCountries = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWidrData();
    fetchDataCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Covid-19 Tracker'),
      ),
      body: SingleChildScrollView(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            color: Colors.orange[100],
            child: Text(DataSource.quote, style: TextStyle(color: Colors.red[800],fontWeight: FontWeight.bold, fontSize: 16),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('WorldWide', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: primaryBlack,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text('Regional', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white),)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: worldData==null?CircularProgressIndicator():WorldWidePanel(worldData: worldData,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: dataCountries==null?Container():MostEffectedPanel(dataCountries: dataCountries,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Covid-19 in Indonesia', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: dataCountries==null?Container():IndonesiaPanel(dataCountries: dataCountries,),
          ),
          InfoPanel(),
        ],
      )),
    );
  }
}
